import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_appbar.dart';
import 'package:lipread_client/components/base_button.dart';
import 'package:lipread_client/components/base_prompt.dart';
import 'package:lipread_client/screens/chat/create_chat_screen.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';

class StudySummary extends StatelessWidget {
  final int sentenceCount;
  final int hourCount;

  const StudySummary({
    super.key,
    required this.sentenceCount,
    required this.hourCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: ShapeDecoration(
        color: AppColor.g100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10).r,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  '총 연습한 문장',
                  style: TextStyle(
                    color: AppColor.g600,
                    fontSize: 14.sp,
                    fontFamily: AppFonts.pretendardFont,
                    fontVariations: const [
                      FontVariation('wght', 600),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  sentenceCount.toString(),
                  style: TextStyle(
                    color: AppColor.g800,
                    fontSize: 32.sp,
                    fontFamily: AppFonts.pretendardFont,
                    fontVariations: const [
                      FontVariation('wght', 700),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 2,
            height: 60.h,
            color: AppColor.g200,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  '총 학습 시간',
                  style: TextStyle(
                    color: AppColor.g600,
                    fontSize: 14.sp,
                    fontFamily: AppFonts.pretendardFont,
                    fontVariations: const [
                      FontVariation('wght', 600),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  hourCount.toString(),
                  style: TextStyle(
                    color: AppColor.g800,
                    fontSize: 32.sp,
                    fontFamily: AppFonts.pretendardFont,
                    fontVariations: const [
                      FontVariation('wght', 700),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
