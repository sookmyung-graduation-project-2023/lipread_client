import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_appbar.dart';
import 'package:lipread_client/components/base_button.dart';
import 'package:lipread_client/components/base_prompt.dart';
import 'package:lipread_client/screens/chat/Chat_screen.dart';

import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';

class CreateChatScreen extends StatefulWidget {
  const CreateChatScreen({super.key});

  @override
  State<CreateChatScreen> createState() => _CreateChatScreenState();
}

class _CreateChatScreenState extends State<CreateChatScreen> {
  final TextEditingController _myRoleTextController = TextEditingController();
  final TextEditingController _otherRoleController = TextEditingController();
  final TextEditingController _subjectTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar("주제 생성"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text('내가 연습하고 싶은\n새로운 구화 주제나 상황을\n만들어 보세요',
                  style: FontStyles.headline1TextStyle),
              SizedBox(
                height: 44.h,
              ),
              Text(
                "당신의 역할은 무엇인가요?",
                style: FontStyles.headline3TextStyle,
              ),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                onChanged: (value) => setState(() {}),
                controller: _myRoleTextController,
                style: FontStyles.textFieldTextStyle,
                maxLength: 20,
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'ex. 빵집에 케이크를 사러간 손님',
                  hintStyle: FontStyles.textFieldHintTextStyle,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: AppStyles.textFieldStyle,
                  enabledBorder: AppStyles.textFieldStyle,
                  contentPadding: AppStyles.textFieldEdgeInsets,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                "상대방의 역할은 무엇인가요?",
                style: FontStyles.headline3TextStyle,
              ),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                onChanged: (value) => setState(() {}),
                controller: _otherRoleController,
                style: FontStyles.textFieldTextStyle,
                maxLength: 20,
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'ex. 빵집 직원',
                  hintStyle: FontStyles.textFieldHintTextStyle,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: AppStyles.textFieldStyle,
                  enabledBorder: AppStyles.textFieldStyle,
                  contentPadding: AppStyles.textFieldEdgeInsets,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                "원하는 대화 주제나 상황을 입력해 주세요.",
                style: FontStyles.headline3TextStyle,
              ),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                onChanged: (value) => setState(() {}),
                controller: _subjectTextController,
                style: FontStyles.textFieldTextStyle,
                maxLength: 100,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'ex. 일주일 이내로 가져올 수 있는 케이크를 주문한다',
                  hintStyle: FontStyles.textFieldHintTextStyle,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: AppStyles.textFieldStyle,
                  enabledBorder: AppStyles.textFieldStyle,
                  contentPadding: AppStyles.textFieldEdgeInsets,
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              BaseButton(
                  text: "연습 시작하기",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatScreen()));
                  }),
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
