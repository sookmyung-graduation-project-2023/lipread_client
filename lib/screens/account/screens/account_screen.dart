import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_appbar.dart';
import 'package:lipread_client/components/base_dialog.dart';
import 'package:lipread_client/components/base_dialog_text_button.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isChecked = true;
  bool _editName = false;

  final TextStyle _settingTextStyle = TextStyle(
    fontFamily: AppFonts.pretendardFont,
    fontSize: 16.sp,
    fontVariations: const [
      FontVariation('wght', 600),
    ],
    color: AppColor.g800,
  );

  final TextStyle _creditCaptionTextStyle = TextStyle(
    color: AppColor.g500,
    fontSize: 14.sp,
    fontFamily: AppFonts.pretendardFont,
    fontVariations: const [
      FontVariation('wght', 500),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar("계정"),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppStyles.horizontalEdgeInset,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 28.h,
              ),
              Text(
                "닉네임",
                style: FontStyles.headline2TextStyle,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 60.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    !_editName
                        ? Expanded(
                            child: Text(
                              "윤재은",
                              style: TextStyle(
                                fontFamily: AppFonts.pretendardFont,
                                fontSize: 16.sp,
                                fontVariations: const [
                                  FontVariation('wght', 600),
                                ],
                                color: AppColor.g800,
                              ),
                            ),
                          )
                        : Flexible(
                            child: TextField(
                              onChanged: (value) => setState(() {}),
                              controller: _controller,
                              style: FontStyles.textFieldSingleTextStyle,
                              maxLines: 1,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: '닉네임을 입력해 주세요',
                                hintStyle:
                                    FontStyles.textFieldSingleHintTextStyle,
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: AppStyles.textFieldStyle,
                                enabledBorder: AppStyles.textFieldStyle,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 20.w),
                              ),
                            ),
                          ),
                    SizedBox(
                      width: 8.w,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          if (!_editName) {
                            _editName = true;
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 28.w),
                        backgroundColor: AppColor.g200,
                        foregroundColor: AppColor.g500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                      ),
                      child: Text(
                        _editName ? '수정' : '변경',
                        style: TextStyle(
                          fontFamily: AppFonts.pretendardFont,
                          fontSize: 16.sp,
                          fontVariations: const [
                            FontVariation('wght', 700),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "크레딧 사용량",
                    style: FontStyles.headline2TextStyle,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const BaseDialog(
                                title: "크레딧이 무엇인가요?",
                                content:
                                    "크레딧이란 구화 연습을 진행할 때 상대방이 말한 단어의 개수에요. 모든 크레딧을 소진하면 갱신되기 전까지 구화 연습을 더 이상 진행할 수 없어요.");
                          });
                    },
                    child: Icon(
                      Icons.info_rounded,
                      color: AppColor.g400,
                      size: 20.w,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 20.h,
                decoration: BoxDecoration(
                  color: AppColor.g200,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: AppColor.g600,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "00월 00일에 갱신됩니다",
                    style: _creditCaptionTextStyle,
                  ),
                  Text(
                    "43/3000 크레딧",
                    style: _creditCaptionTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              Text(
                "설정",
                style: FontStyles.headline2TextStyle,
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '알림 받기',
                      style: _settingTextStyle,
                    ),
                    SizedBox(
                      width: 44.w,
                      child: CupertinoSwitch(
                          value: _isChecked,
                          activeColor: AppColor.primary,
                          trackColor: AppColor.g300,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '앱 버전',
                      style: _settingTextStyle,
                    ),
                    Text(
                      'v1.0',
                      style: TextStyle(
                        fontFamily: AppFonts.pretendardFont,
                        fontSize: 16.sp,
                        fontVariations: const [
                          FontVariation('wght', 600),
                        ],
                        color: AppColor.g800,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '로그아웃',
                      style: _settingTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
