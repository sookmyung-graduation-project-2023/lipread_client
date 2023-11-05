import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lipread_client/components/base_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_emptydata.dart';
import 'package:lipread_client/components/base_prompt.dart';
import 'package:lipread_client/models/prompt_model.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textController = TextEditingController();
  final bool test = false;
  final String text = "#파자마";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar("검색하기"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 28.h,
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColor.g100,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    "키워드로만 검색할 때는 #을 붙여 검색해 주세요",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.g400,
                      fontSize: 14.sp,
                      fontFamily: pretendardFont,
                      fontVariations: const [
                        FontVariation('wght', 700),
                      ],
                      height: 1.6,
                    ),
                  )),
              SizedBox(
                height: 8.h,
              ),
              TextField(
                onChanged: (value) => setState(() {}),
                controller: _textController,
                style: FontStyles.textFieldSingleTextStyle,
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: '검색어를 입력해 주세요',
                  hintStyle: FontStyles.textFieldSingleHintTextStyle,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: AppStyles.textFieldStyle,
                  enabledBorder: AppStyles.textFieldStyle,
                  contentPadding: AppStyles.textFieldEdgeInsets,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 18.sp,
                      fontFamily: pretendardFont,
                      fontVariations: const [
                        FontVariation('wght', 700),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "검색 결과",
                    style: FontStyles.headline2TextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              test
                  ? EmptyData(
                      image: Image.asset(
                        "assets/images/img_search.png",
                        opacity: const AlwaysStoppedAnimation(.5),
                        width: 64.w,
                      ),
                      text: "검색 결과가 없습니다")
                  : ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 8,
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
