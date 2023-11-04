import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';

class FontStyles {
  static final headline1TextStyle = TextStyle(
    color: AppColor.g900,
    fontSize: 24.sp,
    fontFamily: pretendardFont,
    fontVariations: const [
      FontVariation('wght', 700),
    ],
    height: 1.5,
  );

  static final headline2TextStyle = TextStyle(
    color: AppColor.g600,
    fontSize: 18.sp,
    fontFamily: pretendardFont,
    fontVariations: const [
      FontVariation('wght', 600),
    ],
  );

  static final headline3TextStyle = TextStyle(
    color: AppColor.g800,
    fontSize: 18.sp,
    fontFamily: pretendardFont,
    fontVariations: const [
      FontVariation('wght', 700),
    ],
  );

  static final TextStyle textFieldTextStyle = TextStyle(
    color: AppColor.g700,
    fontSize: 16.sp,
    fontFamily: pretendardFont,
    fontVariations: const [
      FontVariation('wght', 600),
    ],
    height: 1.6,
  );
  static final TextStyle textFieldHintTextStyle = TextStyle(
    color: AppColor.g400,
    fontSize: 16.sp,
    fontFamily: pretendardFont,
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
      EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.h);
}
