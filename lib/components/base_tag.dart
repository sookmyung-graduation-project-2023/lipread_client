import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lipread_client/components/base_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_emptydata.dart';
import 'package:lipread_client/components/base_prompt.dart';
import 'package:lipread_client/models/prompt_model.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';
import 'package:dotted_line/dotted_line.dart';

class BaseTag extends StatelessWidget {
  final String text;

  const BaseTag(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.secondaryLight,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppFonts.pretendardFont,
            fontSize: 16.sp,
            fontVariations: const [
              FontVariation('wght', 600),
            ],
            color: AppColor.secondary,
          ),
        ),
      ),
    );
  }
}
