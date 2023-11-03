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

class MyRoomScreen extends StatelessWidget {
  const MyRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        "내 학습방",
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.bookmark_outline_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline_rounded),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateChatScreen()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('재은님은 이번 주에\n14번 구화 연습을\n진행했어요',
                      style: FontStyles.titleTextStyle),
                  Image.asset(
                    "assets/images/img_fire.png",
                    width: 140.w,
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
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
                              fontFamily: pretendardFont,
                              fontVariations: const [
                                FontVariation('wght', 600),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '45',
                            style: TextStyle(
                              color: AppColor.g800,
                              fontSize: 32.sp,
                              fontFamily: pretendardFont,
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
                              fontFamily: pretendardFont,
                              fontVariations: const [
                                FontVariation('wght', 600),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '3',
                            style: TextStyle(
                              color: AppColor.g800,
                              fontSize: 32.sp,
                              fontFamily: pretendardFont,
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
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "학습 기록",
                style: TextStyle(
                  color: AppColor.g600,
                  fontSize: 18.sp,
                  fontFamily: pretendardFont,
                  fontVariations: const [
                    FontVariation('wght', 600),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const BasePrompt(
                emoji: "🍿",
                count: 100,
                tags: ["파자마 파티", "과자", "친구"],
                text: '영화관에서 영화 티켓을 예매하는데 직원은 신작 영화를 나에게 소개해준다.',
              ),
              SizedBox(
                height: 12.h,
              ),
              const BasePrompt(
                emoji: "🧀",
                count: 0,
                tags: ["파자마 파티", "과자", "친구"],
                text: '마트에서 치즈를 사며 카드 결제를 한다.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
