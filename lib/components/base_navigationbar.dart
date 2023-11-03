import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lipread_client/screens/account/screens/account_screen.dart';
import 'package:lipread_client/screens/home/screens/home_screen.dart';
import 'package:lipread_client/screens/chat/create_chat_screen.dart';
import 'package:lipread_client/screens/myroom/screens/my_room_screen.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/utilities/fonts.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({super.key});

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  int _selectedIdx = 0;

  final List<Widget> _screenList = [
    const HomeScreen(),
    const MyRoomScreen(),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screenList.elementAt(_selectedIdx)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIdx,
        backgroundColor: Colors.white,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.g400,
        selectedLabelStyle: TextStyle(
          fontSize: 14.sp,
          fontFamily: pretendardFont,
          fontVariations: const [
            FontVariation('wght', 700),
          ],
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14.sp,
          fontFamily: pretendardFont,
          fontVariations: const [
            FontVariation('wght', 500),
          ],
        ),
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                width: 24.w,
                'assets/icons/ic_home.svg',
              ),
              activeIcon: SvgPicture.asset(
                width: 24.w,
                'assets/icons/ic_home_filled.svg',
              ),
              label: '홈'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                width: 24.w,
                'assets/icons/ic_assignment.svg',
              ),
              activeIcon: SvgPicture.asset(
                width: 24.w,
                'assets/icons/ic_assignment_filled.svg',
              ),
              label: '내 학습방'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                width: 24.w,
                'assets/icons/ic_account_circle.svg',
              ),
              activeIcon: SvgPicture.asset(
                width: 24.w,
                'assets/icons/ic_account_circle_filled.svg',
              ),
              label: '계정'),
        ],
      ),
    );
  }
}
