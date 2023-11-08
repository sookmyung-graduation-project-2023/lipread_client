import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';

class FontStyles {
  static final headline1TextStyle = TextStyle(
    color: AppColor.g900,
    fontSize: 24.sp,
    fontFamily: AppFonts.pretendardFont,
    fontVariations: const [
      FontVariation('wght', 600),
    ],
    height: 1.5,
    letterSpacing: -0.2,
  );

  static final headline2TextStyle = TextStyle(
    color: AppColor.g800,
    fontSize: 18.sp,
    fontFamily: AppFonts.pretendardFont,
    fontVariations: const [
      FontVariation('wght', 700),
    ],
  );

  static final headline3TextStyle = TextStyle(
    color: AppColor.g800,
    fontSize: 18.sp,
    fontFamily: AppFonts.pretendardFont,
    fontVariations: const [
      FontVariation('wght', 600),
    ],
  );

  static final TextStyle textFieldSingleTextStyle = TextStyle(
    color: AppColor.g800,
    fontSize: 16.sp,
    fontFamily: AppFonts.pretendardFont,
    fontVariations: const [
      FontVariation('wght', 500),
    ],
  );

  static final TextStyle textFieldSingleHintTextStyle = TextStyle(
    color: AppColor.g400,
    fontSize: 16.sp,
    fontFamily: AppFonts.pretendardFont,
    fontVariations: const [
      FontVariation('wght', 400),
    ],
  );

  static final TextStyle textFieldMultiTextStyle = TextStyle(
    color: AppColor.g800,
    fontSize: 16.sp,
    fontFamily: AppFonts.pretendardFont,
    fontVariations: const [
      FontVariation('wght', 500),
    ],
    height: 1.6,
  );

  static final TextStyle textFieldMultiHintTextStyle = TextStyle(
    color: AppColor.g400,
    fontSize: 16.sp,
    fontFamily: AppFonts.pretendardFont,
    fontVariations: const [
      FontVariation('wght', 400),
    ],
    height: 1.6,
  );

  static final TextStyle dialogTitleTextStyle = TextStyle(
    color: AppColor.g900,
    fontSize: 18.sp,
    fontFamily: AppFonts.pretendardFont,
    fontVariations: const [
      FontVariation('wght', 700),
    ],
    height: 1.6,
  );

  static final TextStyle dialogContentTextStyle = TextStyle(
    color: AppColor.g700,
    fontSize: 16.sp,
    fontFamily: AppFonts.pretendardFont,
    fontVariations: const [
      FontVariation('wght', 500),
    ],
    height: 1.6,
  );
}

class AppStyles {
  static final OutlineInputBorder textFieldStyle = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(10)).r,
    borderSide: const BorderSide(
      width: 1,
      color: AppColor.g300,
    ),
  );

  static final EdgeInsets textFieldEdgeInsets =
      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w);
}
