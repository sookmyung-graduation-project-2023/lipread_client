import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';

class BaseDialog extends StatelessWidget {
  final String title;
  final String content;
  final Widget? actions;

  const BaseDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final RoundedRectangleBorder shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)));
    final EdgeInsets insetPadding =
        EdgeInsets.symmetric(horizontal: 72.w, vertical: 40.h);

    final EdgeInsets actionsPadding =
        EdgeInsets.only(right: 20.w, left: 20.w, bottom: 16.h, top: 36.h);

    return actions == null
        ? AlertDialog(
            shape: shape,
            insetPadding: insetPadding,
            contentPadding: EdgeInsets.only(
                right: 20.w, left: 20.w, top: 8.h, bottom: 28.h),
            title: Text(
              title,
            ),
            content: Text(
              content,
            ),
            titleTextStyle: FontStyles.dialogTitleTextStyle,
            contentTextStyle: FontStyles.dialogContentTextStyle,
            actionsPadding: actionsPadding,
          )
        : AlertDialog(
            shape: shape,
            insetPadding: insetPadding,
            contentPadding: EdgeInsets.only(right: 20.w, left: 20.w, top: 8.h),
            title: Text(
              title,
            ),
            content: Text(
              content,
            ),
            titleTextStyle: FontStyles.dialogTitleTextStyle,
            contentTextStyle: FontStyles.dialogContentTextStyle,
            actionsPadding: actionsPadding,
            actions: [actions!],
          );
  }
}
