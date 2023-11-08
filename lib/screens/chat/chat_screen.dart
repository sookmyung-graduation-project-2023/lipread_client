import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_appbar.dart';
import 'package:lipread_client/components/base_button.dart';
import 'package:lipread_client/components/base_prompt.dart';
import 'package:lipread_client/components/base_video_control.dart';

import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';
import 'package:video_player/video_player.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late VideoPlayerController _controller;
  String videoPath = "assets/images/video.mp4";
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(videoPath);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      color: AppColor.g800,
      fontSize: 18.sp,
      fontFamily: AppFonts.pretendardFont,
      fontVariations: const [
        FontVariation('wght', 600),
      ],
      height: 1.6,
    );
    return Scaffold(
      appBar: BaseAppBar(
        "학습하기",
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("학습 완료"),
          )
        ],
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                ControlsOverlay(controller: _controller),
                VideoProgressIndicator(_controller, allowScrubbing: true),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(children: [
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10.h),
                      decoration: const BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          color: AppColor.g300,
                          width: 1.0,
                        ),
                      )),
                      child: Text(
                        "안녕하세요! 어떤 음료와 디저트를 \n주문하시겠어요?",
                        style: textStyle,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.play_arrow),
                        Icon(Icons.bookmark),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 48.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10.h),
                      decoration: const BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          color: AppColor.g300,
                          width: 1.0,
                        ),
                      )),
                      child: Text(
                        "아이스라떼 하나 주세요",
                        style: textStyle,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          )),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
              backgroundColor: AppColor.primary, // <-- Button color
              // <-- Splash color
            ),
            child: const Icon(Icons.mic, color: Colors.white),
          ),
          SizedBox(
            height: 40.h,
          )
        ],
      ),
    );
  }
}
