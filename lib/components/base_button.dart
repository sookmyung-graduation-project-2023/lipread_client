import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool isDisable;

  const BaseButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDisable = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: !isDisable ? onPressed : null,
      style: TextButton.styleFrom(
        minimumSize: Size(382.w, 0.h),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppColor.g200,
        disabledForegroundColor: AppColor.g300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10).r,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: AppFonts.pretendardFont,
          fontSize: 18.sp,
          fontVariations: const [
            FontVariation('wght', 700),
          ],
        ),
      ),
    );
  }
}
