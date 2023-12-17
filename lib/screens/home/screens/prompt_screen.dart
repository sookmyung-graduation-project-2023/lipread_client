import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lipread_client/components/base_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_button.dart';
import 'package:lipread_client/components/base_dialog.dart';
import 'package:lipread_client/components/base_dialog_text_button.dart';
import 'package:lipread_client/components/base_emptydata.dart';
import 'package:lipread_client/components/base_prompt.dart';
import 'package:lipread_client/components/base_tag.dart';
import 'package:lipread_client/models/chat_model.dart';
import 'package:lipread_client/models/prompt_model.dart';
import 'package:lipread_client/screens/chat/chat_screen.dart';
import 'package:lipread_client/services/prompt_service.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromptScreen extends StatefulWidget {
  final String id;

  const PromptScreen(this.id, {super.key});

  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  late Future<PromptModel> _promptData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _promptData = PromptService.getPromptById(widget.id, true);
  }

  @override
  Widget build(BuildContext context) {
    final SizedBox margin = SizedBox(
      height: 40.h,
    );
    return Scaffold(
      appBar: BaseAppBar(
        "상세보기",
        actions: <Widget>[
          TextButton(
              child: Text(
                "삭제",
                style: TextStyle(
                  color: AppColor.g700,
                  fontSize: 16.sp,
                  fontFamily: AppFonts.pretendardFont,
                  fontVariations: const [
                    FontVariation('wght', 700),
                  ],
                ),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return BaseDialog(
                          title: "구화 연습 기록 삭제",
                          content:
                              "해당 구화 연습 기록을 삭제하시겠어요?\n한 번 삭제하면 다시 복구할 수 없어요. ",
                          actions: Row(
                            children: [
                              BaseDialogTextButton(
                                text: "취소",
                                color: AppColor.g300,
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Expanded(
                                child: BaseDialogTextButton(
                                  text: "삭제할게요",
                                  color: AppColor.primary,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ));
                    });
              }),
          TextButton(
              child: Text(
                "등록",
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 16.sp,
                  fontFamily: AppFonts.pretendardFont,
                  fontVariations: const [
                    FontVariation('wght', 700),
                  ],
                ),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return BaseDialog(
                          title: "구화 템플릿 등록",
                          content:
                              "해당 구화 템플릿을 등록하시겠어요?\n한 번 템플릿을 등록하면 삭제가 불가능하고, 모든 사용자가 해당 템플릿을 볼 수 있어요.",
                          actions: Row(
                            children: [
                              BaseDialogTextButton(
                                text: "취소",
                                color: AppColor.g300,
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Expanded(
                                child: BaseDialogTextButton(
                                  text: "등록할게요",
                                  color: AppColor.primary,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ));
                    });
              }),
        ],
      ),
      body: FutureBuilder(
        future: _promptData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else {
            final PromptModel prompt = snapshot.data!;

            return SingleChildScrollView(
              child: Padding(
                padding: AppStyles.horizontalEdgeInset,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 28.h,
                    ),
                    Text(
                      prompt.emoji,
                      style: TextStyle(fontSize: 32.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      prompt.subject,
                      style: TextStyle(
                          color: AppColor.g800,
                          fontSize: 24.sp,
                          fontFamily: AppFonts.pretendardFont,
                          fontVariations: const [
                            FontVariation('wght', 500),
                          ],
                          height: 1.6),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Text("by ${prompt.creatdBy} | ${prompt.count}명 사용")
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      "역할",
                      style: FontStyles.headline3TextStyle,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Role(
                      role: "나",
                      content: prompt.userRole,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Role(
                      role: "상대방",
                      content: prompt.assistantRole,
                    ),
                    margin,
                    Text(
                      "키워드",
                      style: FontStyles.headline3TextStyle,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: List.generate(prompt.tags.length,
                            (index) => BaseTag(prompt.tags[index]))),
                    margin,
                    Text(
                      "대화 내용",
                      style: FontStyles.headline3TextStyle,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          return Chat(
                              role: prompt.chats[index].role,
                              text: prompt.chats[index].text);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20.h,
                          );
                        },
                        itemCount: prompt.chats.length),
                    SizedBox(
                      height: 20.h,
                    ),
                    BaseButton(
                      text: "이 템플릿으로 구화 연습하기",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                justRead: true,
                                id: prompt.chatId,
                              ),
                            ));
                      },
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class PeopleCount extends StatelessWidget {
  final int count;

  const PeopleCount({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColor.g200,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  width: 20.w,
                  'assets/icons/ic_person.svg',
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  '$count명 사용',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFonts.pretendardFont,
                    fontSize: 14.sp,
                    fontVariations: const [
                      FontVariation('wght', 700),
                    ],
                    color: AppColor.g500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Role extends StatelessWidget {
  final String role;
  final String content;

  const Role({
    super.key,
    required this.role,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 24.h, bottom: 24.h, left: 24.w, right: 24.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColor.g200,
        ),
        borderRadius: BorderRadius.all(const Radius.circular(12.0).r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          role == '나'
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8.0).r,
                  child: Image.asset(
                    'assets/images/me_example.png',
                    width: 40.w,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(8.0).r,
                  child: Image.asset(
                    'assets/images/assistant_example.png',
                    width: 40.w,
                  ),
                ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  role,
                  style: TextStyle(
                    color: AppColor.g500,
                    fontSize: 12.sp,
                    fontFamily: AppFonts.pretendardFont,
                    fontVariations: const [
                      FontVariation('wght', 500),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  content,
                  style: TextStyle(
                    color: AppColor.g800,
                    height: 1.6,
                    fontSize: 16.sp,
                    fontFamily: AppFonts.pretendardFont,
                    fontVariations: const [
                      FontVariation('wght', 500),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Chat extends StatelessWidget {
  final String role;
  final String text;
  const Chat({
    super.key,
    required this.role,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        role == 'user'
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8.0).r,
                child: Image.asset(
                  'assets/images/me_example.png',
                  width: 36.w,
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(8.0).r,
                child: Image.asset(
                  'assets/images/assistant_example.png',
                  width: 36.w,
                ),
              ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColor.g200,
                  ),
                  borderRadius: BorderRadius.all(const Radius.circular(12.0).r),
                ),
                child: Text(text))),
      ],
    );
  }
}
