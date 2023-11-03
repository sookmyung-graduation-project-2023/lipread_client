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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        "홈",
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
              weight: 400,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('내가 연습하고 싶은\n구화 주제나 상황을\n찾아볼까요?',
                      style: FontStyles.titleTextStyle),
                  Image.asset(
                    "assets/images/img_rocket.png",
                    width: 140.w,
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              BaseButton(
                  text: "새로운 주제나 상황 만들기",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateChatScreen()));
                  }),
              SizedBox(
                height: 40.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "공식",
                        style: TextStyle(
                          color: AppColor.g500,
                          fontSize: 18.sp,
                          fontFamily: pretendardFont,
                          fontVariations: const [
                            FontVariation('wght', 600),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "비공식",
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 18.sp,
                          fontFamily: pretendardFont,
                          fontVariations: const [
                            FontVariation('wght', 700),
                          ],
                        ),
                      ),
                    ],
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 8.h,
                      ),
                      side: const BorderSide(width: 1, color: AppColor.g300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200).r,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sort_rounded,
                          size: 20.w,
                          weight: 300,
                          color: AppColor.g500,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        const Text(
                          "최신 순",
                          style: TextStyle(
                            color: AppColor.g600,
                            fontSize: 14,
                            fontFamily: pretendardFont,
                            fontVariations: [
                              FontVariation('wght', 500),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const BasePrompt(
                emoji: "🍪",
                count: 10,
                tags: ["파자마 파티", "과자", "친구"],
                text: '친구의 파자마 파티에서 같이 과자를 먹기로 했는데 내가 과자를 사오지 않았다.',
              ),
              SizedBox(
                height: 12.h,
              ),
              const BasePrompt(
                emoji: "🎓",
                count: 15,
                tags: ["파자마 파티", "과자", "친구"],
                text: '대학원생과 교수의 첫 면담. 교수가 대학원생에게 관심 분야와 능력, 진로 계획에 대해 묻는다.',
              ),
              SizedBox(
                height: 12.h,
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
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
