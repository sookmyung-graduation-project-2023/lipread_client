import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lipread_client/components/base_navigationbar.dart';
import 'package:lipread_client/screens/home/screens/home_screen.dart';
import 'package:lipread_client/screens/login/screens/login_screen.dart';
import 'package:lipread_client/utilities/colors.dart';
import 'package:lipread_client/utilities/fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'LipRead',
            theme: ThemeData(
              fontFamily: AppFonts.pretendardFont,
              primaryColor: AppColor.primary,
              primaryColorLight: AppColor.primaryLight,
              scaffoldBackgroundColor: Colors.white,
              dividerColor: Colors.transparent,
            ),
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            home: child,
          );
        },
        child: const LoginScreen());
  }
}
