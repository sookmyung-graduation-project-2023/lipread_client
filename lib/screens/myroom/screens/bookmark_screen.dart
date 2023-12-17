import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_appbar.dart';
import 'package:lipread_client/components/base_bookmark.dart';
import 'package:lipread_client/components/base_button.dart';
import 'package:lipread_client/components/base_dialog.dart';
import 'package:lipread_client/components/base_dialog_text_button.dart';
import 'package:lipread_client/components/base_emptydata.dart';
import 'package:lipread_client/components/base_prompt.dart';
import 'package:lipread_client/models/bookmark_model.dart';
import 'package:lipread_client/models/chat_model.dart';
import 'package:lipread_client/models/prompt_model.dart';
import 'package:lipread_client/screens/chat/create_chat_screen.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  final bool test = false;
  bool canDelete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        "보관함",
        actions: <Widget>[
          if (!test && canDelete)
            TextButton(
              child: Text(
                "전체 해제",
                style: TextStyle(
                  color: AppColor.g700,
                  fontSize: 16.sp,
                  fontFamily: AppFonts.pretendardFont,
                  fontVariations: const [
                    FontVariation('wght', 700),
                  ],
                ),
              ),
              onPressed: () {},
            ),
          if (!test && canDelete)
            TextButton(
                child: Text(
                  "삭제",
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 16.sp,
                    fontFamily: AppFonts.pretendardFont,
                    fontVariations: const [
                      FontVariation('wght', 700),
                    ],
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return BaseDialog(
                            title: "보관한 구화 영상 삭제",
                            content: "선택한 구화 영상을\n보관함에서 삭제하시겠어요?",
                            actions: Row(
                              children: [
                                BaseDialogTextButton(
                                  text: "취소",
                                  color: AppColor.g300,
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  child: BaseDialogTextButton(
                                    text: "삭제할게요",
                                    color: AppColor.primary,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ));
                      });
                }),
          if (!test && !canDelete)
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded),
              onPressed: () {
                setState(() {
                  canDelete = true;
                });
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppStyles.horizontalEdgeInset,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 28.h,
              ),
              Text(
                "보관한 영상",
                style: FontStyles.headline2TextStyle,
              ),
              SizedBox(
                height: 16.h,
              ),
              test
                  ? EmptyData(
                      image: Image.asset(
                        "assets/images/img_bookmark.png",
                        opacity: const AlwaysStoppedAnimation(.5),
                        width: 64.w,
                      ),
                      text: "아직 보관한 구화 영상이 없어요.\n구화 연습 중 원하는 영상을 보관해 보세요!")
                  : ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final BookmarkModel bookmark = BookmarkModel();
                        return Column(
                          children: [
                            BaseBookmark(
                              text: bookmark.text,
                              videoUrl: bookmark.videoUrl,
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 12.h,
                        );
                      },
                    ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class Bookmark extends StatelessWidget {
  final String text;
  final String videoUrl;

  const Bookmark({
    super.key,
    required this.text,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (bool expanded) {},
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColor.g200),
        borderRadius: BorderRadius.circular(10.r),
      ),
      collapsedShape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColor.g200),
        borderRadius: BorderRadius.circular(10.r),
      ),
      textColor: AppColor.primary,
      collapsedTextColor: AppColor.g800,
      iconColor: AppColor.g400,
      collapsedIconColor: AppColor.g400,
      tilePadding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 24.w,
      ),
      childrenPadding: EdgeInsets.zero,
      title: Container(
        margin: EdgeInsets.only(right: 36.w),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16.sp,
              fontFamily: AppFonts.pretendardFont,
              fontVariations: const [
                FontVariation('wght', 500),
              ],
              height: 1.6),
        ),
      ),
      children: <Widget>[
        Image.asset(
          "assets/images/img_test.png",
          width: double.infinity,
        ),
      ],
    );
  }
}
*/
class Bookmark extends StatefulWidget {
  final String text;
  final String videoUrl;
  final bool isExpanded;
  final bool isSelected;
  final void Function() onExpaned;
  final void Function() onSelected;

  const Bookmark({
    super.key,
    required this.text,
    required this.videoUrl,
    required this.isSelected,
    required this.isExpanded,
    required this.onExpaned,
    required this.onSelected,
  });

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          const ExpansionTile(title: Text("d")),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 24.w,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: AppFonts.pretendardFont,
                        fontVariations: const [
                          FontVariation('wght', 500),
                        ],
                        height: 1.6),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 36.w),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.isSelected != widget.isSelected;
                        });
                      },
                      icon: widget.isExpanded
                          ? const Icon(Icons.expand_less_rounded)
                          : const Icon(Icons.expand_more_rounded)),
                ),
              ],
            ),
          ),
          if (widget.isExpanded)
            Image.asset(
              "assets/images/img_test.png",
              width: double.infinity,
            ),
        ],
      ),
    );
  }
}
