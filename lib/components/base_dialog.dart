import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';

class BaseDialog extends StatelessWidget {
  final String title;
  final String content;
  final Widget actions;

  const BaseDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
      contentPadding: EdgeInsets.only(right: 20.w, left: 20.w, top: 8.h),
      title: Text(
        title,
      ),
      content: Text(
        content,
      ),
      titleTextStyle: TextStyle(
        color: AppColor.g900,
        fontSize: 18.sp,
        fontFamily: pretendardFont,
        fontVariations: const [
          FontVariation('wght', 700),
        ],
        height: 1.6,
      ),
      contentTextStyle: TextStyle(
        color: AppColor.g700,
        fontSize: 16.sp,
        fontFamily: pretendardFont,
        fontVariations: const [
          FontVariation('wght', 500),
        ],
        height: 1.6,
      ),
      actionsPadding:
          EdgeInsets.only(right: 20.w, left: 20.w, bottom: 16.h, top: 36.h),
      actions: [actions],
    );
  }
}
