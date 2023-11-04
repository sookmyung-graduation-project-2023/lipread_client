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
import 'package:lipread_client/models/prompt_model.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromptScreen extends StatelessWidget {
  const PromptScreen({super.key});

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
                  color: AppColor.g600,
                  fontSize: 16.sp,
                  fontFamily: pretendardFont,
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
                  fontFamily: pretendardFont,
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
      floatingActionButton: BaseButton(
        text: "이 템플릿으로 구화 연습하기",
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 28.h,
              ),
              Column(
                children: [
                  Text(
                    "🍪",
                    style: TextStyle(fontSize: 36.sp),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  const PeopleCount(
                    count: 11,
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColor.g200,
                  ),
                  borderRadius: BorderRadius.all(const Radius.circular(10.0).r),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 36.h,
                  horizontal: 24.w,
                ),
                child: Column(children: [
                  TextContent(
                    title: "나의 역할",
                    content: Text(
                      "파자마 파티에 초대된 사람",
                      style: FontStyles.textFieldTextStyle,
                    ),
                  ),
                  margin,
                  TextContent(
                    title: "상대방의 역할",
                    content: Text(
                      "친구",
                      style: FontStyles.textFieldTextStyle,
                    ),
                  ),
                  margin,
                  TextContent(
                    title: "주제 및 상황",
                    content: Text(
                      "친구의 파자마 파티에서 같이 과자를 먹기로 했는데 내가 과자를 사오지 않았다. 친구는 나에게 질책을 하고 나는 친구에게 사과를 한다.",
                      style: FontStyles.textFieldTextStyle,
                    ),
                  ),
                  margin,
                  TextContent(
                    title: "키워드",
                    content: Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: const [
                        BaseTag("파자마 파티"),
                        BaseTag("파자마 파티"),
                        BaseTag("친구"),
                        BaseTag("키워드"),
                        BaseTag("과자"),
                      ],
                    ),
                  ),
                  margin,
                  const TextContent(
                    title: "히스토리",
                    content: Text("dfas"),
                  ),
                ]),
              ),
              SizedBox(
                height: 120.h,
              )
            ],
          ),
        ),
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
                    fontFamily: pretendardFont,
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

class TextContent extends StatelessWidget {
  final String title;
  final Widget content;

  const TextContent({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: FontStyles.headline3TextStyle,
        ),
        SizedBox(
          height: 16.h,
        ),
        content,
        SizedBox(
          height: 16.h,
        ),
        const DottedLine(
          lineLength: double.infinity,
          lineThickness: 1,
          dashLength: 2.0,
          dashColor: AppColor.g300,
          dashRadius: 0.0,
        ),
      ],
    );
  }
}
