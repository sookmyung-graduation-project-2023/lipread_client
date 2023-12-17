import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_button.dart';
import 'package:lipread_client/components/base_navigationbar.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppStyles.horizontalEdgeInset,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 120.h,
                  ),
                  Text(
                    'LipRead.',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 36.sp,
                      fontFamily: AppFonts.bronovaFont,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('내가\n직접 만드는\n구화 영상',
                      style: FontStyles.headline1TextStyle),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/images/img_video.png",
                    width: 200.w,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  BaseButton(
                      text: "google로 시작하기",
                      backgroundColor: AppColor.g900,
                      textColor: AppColor.g100,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BaseScaffold()));
                      }),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
