import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lipread_client/components/base_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_button.dart';
import 'package:lipread_client/components/base_dialog.dart';
import 'package:lipread_client/components/base_emptydata.dart';
import 'package:lipread_client/components/base_prompt.dart';
import 'package:lipread_client/components/base_tag.dart';
import 'package:lipread_client/models/prompt_model.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseDialogTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color color;

  const BaseDialogTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 28.w),
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10).r,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: AppFonts.pretendardFont,
          fontSize: 16.sp,
          fontVariations: const [
            FontVariation('wght', 700),
          ],
        ),
      ),
    );
  }
}
