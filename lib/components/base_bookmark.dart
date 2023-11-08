import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lipread_client/components/base_video_control.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class BaseBookmarkController {
  BaseBookmarkController();

  _BaseBookmarkState? _state;

  bool get isExpanded {
    assert(_state != null);
    return _state!._isExpanded;
  }

  void expand() {
    assert(_state != null);
    if (!isExpanded) {
      _state!._toggleExpansion();
    }
  }

  void collapse() {
    assert(_state != null);
    if (isExpanded) {
      _state!._toggleExpansion();
    }
  }

  static BaseBookmarkController of(BuildContext context) {
    final _BaseBookmarkState? result =
        context.findAncestorStateOfType<_BaseBookmarkState>();
    if (result != null) {
      return result._baseBookmarkController;
    }
    throw Error();
  }

  static BaseBookmarkController? maybeOf(BuildContext context) {
    return context
        .findAncestorStateOfType<_BaseBookmarkState>()
        ?._baseBookmarkController;
  }
}

class BaseBookmark extends StatefulWidget {
  final String text;
  final String videoUrl;

  const BaseBookmark({
    super.key,
    required this.text,
    required this.videoUrl,
  });

  @override
  State<BaseBookmark> createState() => _BaseBookmarkState();
}

class _BaseBookmarkState extends State<BaseBookmark>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();

  late AnimationController _animationController;

  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  late Animation<Color?> _headerColor;
  late Animation<Color?> _iconColor;

  bool _isExpanded = false;

  late BaseBookmarkController _baseBookmarkController;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));
    _heightFactor = _animationController.drive(_easeInTween);

    _headerColor =
        _animationController.drive(_headerColorTween.chain(_easeInTween));
    _iconColor =
        _animationController.drive(_iconColorTween.chain(_easeInTween));

    _isExpanded =
        PageStorage.maybeOf(context)?.readState(context) as bool? ?? false;

    if (_isExpanded) {
      _animationController.value = 1.0;
    }

    _baseBookmarkController = BaseBookmarkController();
    _baseBookmarkController._state = this;

    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl);
    _videoPlayerController.addListener(() {
      setState(() {});
    });
    _videoPlayerController.setLooping(true);
    _videoPlayerController.initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _baseBookmarkController._state = null;
    _videoPlayerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.maybeOf(context)?.writeState(context, _isExpanded);
    });
  }

  Widget? _buildIcon(BuildContext context) {
    return RotationTransition(
      turns: _iconTurns,
      child: const Icon(Icons.expand_more_rounded),
    );
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.g200),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileTheme.merge(
            iconColor: _iconColor.value,
            textColor: _headerColor.value,
            child: ListTile(
              onTap: _toggleExpansion,
              contentPadding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 24.w,
              ),
              title: Text(
                widget.text,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: AppFonts.pretendardFont,
                    fontVariations: const [
                      FontVariation('wght', 500),
                    ],
                    height: 1.6),
              ),
              trailing: _buildIcon(context),
            ),
          ),
          ClipRect(
            child: Align(
              alignment: Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    _headerColorTween
      ..begin = AppColor.g800
      ..end = AppColor.primary;
    _iconColorTween
      ..begin = AppColor.g400
      ..end = AppColor.primary;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _animationController.isDismissed;
    final bool shouldRemoveChildren = closed;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: EdgeInsets.zero,
          child: AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_videoPlayerController),
                ControlsOverlay(controller: _videoPlayerController),
                VideoProgressIndicator(
                  _videoPlayerController,
                  allowScrubbing: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _animationController.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}
