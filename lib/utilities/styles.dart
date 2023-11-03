import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';

class FontStyles {
  static var titleTextStyle = TextStyle(
    color: AppColor.g900,
    fontSize: 24.sp,
    fontFamily: pretendardFont,
    fontVariations: const [
      FontVariation('wght', 700),
    ],
    height: 1.5,
  );
}
