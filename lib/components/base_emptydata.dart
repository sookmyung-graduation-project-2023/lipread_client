import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';

class EmptyData extends StatelessWidget {
  final Image? image;
  final String text;

  const EmptyData({
    super.key,
    this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 80.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (image != null) image!,
          SizedBox(
            height: 8.h,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.g400,
              fontSize: 16.sp,
              fontFamily: pretendardFont,
              fontVariations: const [
                FontVariation('wght', 600),
              ],
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
