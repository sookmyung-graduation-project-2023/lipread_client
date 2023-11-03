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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final _tabs = [
    const Tab(text: "공식"),
    const Tab(text: "비공식"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
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
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24.h,
              ),
            ),
            SliverToBoxAdapter(
              child: BaseButton(
                  text: "새로운 주제나 상황 만들기",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateChatScreen()));
                  }),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 44.h,
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyHeaderDelegate(
                child: Container(
                  color: Colors.white,
                  height: 30.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TabBar(
                        controller: _tabController,
                        tabs: _tabs,
                        isScrollable: true,
                        labelColor: AppColor.primary,
                        labelStyle: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: pretendardFont,
                          fontVariations: const [
                            FontVariation('wght', 700),
                          ],
                        ),
                        unselectedLabelColor: AppColor.g500,
                        unselectedLabelStyle: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: pretendardFont,
                          fontVariations: const [
                            FontVariation('wght', 600),
                          ],
                        ),
                        indicatorColor: AppColor.primary,
                        indicatorWeight: 2,
                        indicatorSize: TabBarIndicatorSize.label,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0,
                        ),
                        labelPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0,
                        ),
                        indicatorPadding: const EdgeInsets.all(2),
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 8.h,
                          ),
                          side:
                              const BorderSide(width: 1, color: AppColor.g300),
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
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                physics: const ClampingScrollPhysics(),
                controller: _tabController,
                children: [
                  ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 20,
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
                  const Center(child: Text('Content for Tab 2')),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 30.0;

  @override
  double get minExtent => 30.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
