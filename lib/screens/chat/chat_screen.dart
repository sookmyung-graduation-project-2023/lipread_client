import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_appbar.dart';
import 'package:lipread_client/components/base_button.dart';
import 'package:lipread_client/components/base_prompt.dart';
import 'package:lipread_client/components/base_video_control.dart';

import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';
import 'package:video_player/video_player.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late VideoPlayerController _controller;
  String videoPath = "assets/images/video.mp4";
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(videoPath);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      color: AppColor.g900,
      fontSize: 16.sp,
      fontFamily: AppFonts.pretendardFont,
      fontVariations: const [
        FontVariation('wght', 500),
      ],
      height: 1.6,
    );
    return Scaffold(
      appBar: BaseAppBar(
        "학습하기",
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("학습 완료"),
          )
        ],
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                ControlsOverlay(controller: _controller),
                VideoProgressIndicator(_controller, allowScrubbing: true),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: AppStyles.horizontalEdgeInset,
              child: Column(children: [
                SizedBox(
                  height: 32.h,
                ),
                SizedBox(
                  width: 250.w,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 16.h),
                          decoration: const BoxDecoration(
                              color: AppColor.g100,
                              border: Border(
                                bottom: BorderSide(width: 1),
                              )),
                          child: Text(
                            "안녕하세요! 어떤 음료와 디저트를 주문하시겠어요?",
                            style: textStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.play_arrow),
                          Icon(Icons.bookmark),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 48.h,
                ),
              ]),
            ),
          )),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
              backgroundColor: AppColor.primary, // <-- Button color
              // <-- Splash color
            ),
            child: const Icon(Icons.mic, color: Colors.white),
          ),
          SizedBox(
            height: 40.h,
          )
        ],
      ),
    );
  }
}
