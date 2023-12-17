import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_appbar.dart';
import 'package:lipread_client/components/base_button.dart';
import 'package:lipread_client/components/base_prompt.dart';
import 'package:lipread_client/components/base_video_control.dart';
import 'package:lipread_client/models/chat_model.dart';
import 'package:lipread_client/services/chat_service.dart';

import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';
import 'package:lipread_client/utilities/styles.dart';
import 'package:video_player/video_player.dart';

class ChatScreen extends StatefulWidget {
  final String id;
  final bool justRead;

  const ChatScreen({
    super.key,
    this.justRead = false,
    required this.id,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late VideoPlayerController _controller;
  late Future<List<ChatModel>> _chatsData;
  String videoPath = "https://dyxryua47v6ay.cloudfront.net/a1.mp4";

  @override
  void initState() {
    super.initState();
    _chatsData = ChatService.getChatsById(widget.id);

    _controller = VideoPlayerController.networkUrl(Uri.parse(videoPath));

    _controller.addListener(() {
      setState(() {});
    });

    //_controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
          future: _chatsData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('error');
            } else {
              final List<ChatModel> chats = snapshot.data!;
              return Column(
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        VideoPlayer(_controller),
                        ControlsOverlay(controller: _controller),
                        VideoProgressIndicator(_controller,
                            allowScrubbing: true),
                      ],
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Padding(
                      padding: AppStyles.horizontalEdgeInset,
                      child: Column(children: [
                        SizedBox(
                          height: 32.h,
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              return Chat(
                                isMine: chats[index].role == 'user',
                                text: chats[index].text,
                                onPressPlayButton: () {
                                  print("df");
                                  _controller =
                                      VideoPlayerController.networkUrl(
                                          Uri.parse(chats[index].videoUrl))
                                        ..initialize().then((_) => setState(() {
                                              _controller.play();
                                            }));

                                  print(chats[index].videoUrl);
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 20.h,
                              );
                            },
                            itemCount: chats.length),
                        SizedBox(
                          height: 48.h,
                        ),
                      ]),
                    ),
                  )),
                  /*
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    backgroundColor: AppColor.primary,
                  ),
                  child: const Icon(Icons.mic, color: Colors.white),
                ),*/
                ],
              );
            }
          }),
    );
  }
}

class Chat extends StatefulWidget {
  final bool isMine;
  final String text;
  final void Function() onPressPlayButton;

  const Chat({
    super.key,
    required this.isMine,
    required this.text,
    required this.onPressPlayButton,
  });

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      child: Row(
        mainAxisAlignment:
            widget.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            width: 300.w,
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppColor.g300,
              ),
              borderRadius: BorderRadius.all(const Radius.circular(12.0).r),
              color: widget.isMine ? AppColor.g100 : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                !isCheck
                    ? GestureDetector(
                        child: const ConfirmContent(),
                        onTap: () {
                          setState(() {
                            isCheck = true;
                          });
                        },
                      )
                    : Text(
                        widget.text,
                        style: TextStyle(
                          color: AppColor.g900,
                          fontSize: 16.sp,
                          fontFamily: AppFonts.pretendardFont,
                          fontVariations: const [
                            FontVariation('wght', 500),
                          ],
                          height: 1.6,
                        ),
                      ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: widget.onPressPlayButton,
                            icon: const Icon(
                              Icons.play_arrow_outlined,
                            )),
                        SizedBox(
                          width: 4.w,
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isCheck = false;
                              });
                            },
                            icon: const Icon(
                              Icons.lock_outline,
                            )),
                      ],
                    ),
                    const Icon(Icons.bookmark_outline),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmContent extends StatelessWidget {
  const ConfirmContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColor.blue,
        ),
        color: AppColor.blueLight,
        borderRadius: BorderRadius.all(const Radius.circular(12.0).r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "내용 확인하기",
            style: TextStyle(
              color: AppColor.blue,
              fontSize: 16.sp,
              fontFamily: AppFonts.pretendardFont,
              fontVariations: const [
                FontVariation('wght', 600),
              ],
            ),
          ),
          const Icon(
            Icons.lock_outline,
            color: AppColor.blue,
          ),
        ],
      ),
    );
  }
}
