import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_appbar.dart';
import 'package:lipread_client/components/base_button.dart';
import 'package:lipread_client/components/base_prompt.dart';
import 'package:lipread_client/models/prompt_model.dart';
import 'package:lipread_client/screens/chat/create_chat_screen.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';

import '../components/study_summary.dart';

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
              const StudySummary(
                hourCount: 45,
                sentenceCount: 3,
              ),
              SizedBox(
                height: 44.h,
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
                height: 16.h,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemCount: 3,
                itemBuilder: (context, index) {
                  final PromptModel prompt = PromptModel();
                  return BasePrompt(
                    emoji: prompt.emoji,
                    count: prompt.count,
                    tags: prompt.tags,
                    text: prompt.subject,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 12.h,
                  );
                },
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
