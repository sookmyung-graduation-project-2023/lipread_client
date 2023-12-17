import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_button.dart';
import 'package:lipread_client/screens/home/screens/prompt_screen.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasePrompt extends StatelessWidget {
  final String id;
  final String emoji;
  final String text;
  final List<String> tags;
  final int count;

  const BasePrompt({
    super.key,
    required this.id,
    required this.emoji,
    required this.text,
    required this.tags,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PromptScreen(id),
        ),
      ),
      child: Container(
        padding:
            EdgeInsets.only(top: 24.h, bottom: 24.h, left: 24.w, right: 32.w),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: AppColor.g200,
          ),
          borderRadius: BorderRadius.all(const Radius.circular(10.0).r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Text(
                emoji,
                style: TextStyle(
                  fontSize: 36.sp,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: AppColor.g800,
                      fontSize: 16.sp,
                      fontFamily: AppFonts.pretendardFont,
                      fontVariations: const [
                        FontVariation('wght', 500),
                      ],
                      height: 1.6,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: List.generate(
                              tags.length, (index) => PromptTag(tags[index]))),
                      Usage(count: count),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Usage extends StatelessWidget {
  const Usage({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.g200,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
        child: Row(
          children: [
            SvgPicture.asset(
              width: 16.w,
              'assets/icons/ic_person.svg',
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              count.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.pretendardFont,
                fontSize: 10.sp,
                fontVariations: const [
                  FontVariation('wght', 600),
                ],
                color: AppColor.g500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PromptTag extends StatelessWidget {
  final String text;

  const PromptTag(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.secondaryLight,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppFonts.pretendardFont,
            fontSize: 12.sp,
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
