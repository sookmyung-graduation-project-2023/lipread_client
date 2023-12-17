import 'dart:ui';

import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final TextStyle? titleTextStyle;
  final List<Widget>? actions;
  final int height = 52;

  const BaseAppBar(
    this.titleText, {
    super.key,
    this.actions,
    this.titleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      actionsIconTheme: IconThemeData(
        color: AppColor.g800,
        size: 24.w,
      ),
      toolbarHeight: height.h,
      iconTheme: const IconThemeData(
        color: AppColor.g800,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        titleText,
      ),
      titleTextStyle: titleTextStyle ??
          TextStyle(
            fontFamily: AppFonts.pretendardFont,
            fontSize: 18.sp,
            fontVariations: const [
              FontVariation('wght', 600),
            ],
            color: AppColor.g800,
          ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}
