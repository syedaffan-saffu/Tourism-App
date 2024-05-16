import 'package:flutter/material.dart';
import 'package:trekkers_pk/homescreen/hmscrn.dart';
import 'package:trekkers_pk/homescreen/recomms/recomms.dart';
import 'package:trekkers_pk/profile/experiece.dart';
import 'package:trekkers_pk/profile/profile_edit/profileedit.dart';
import 'package:trekkers_pk/profile/signinout/Login/login.dart';
import 'profile/profile.dart';
import 'mainpage.dart';
import 'profile/signinout/SignUp/signup.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> mynavigatorKey = GlobalKey<NavigatorState>();

bool isregistered = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: mynavigatorKey,
      title: 'trekkers_pk',
      theme: ThemeData(
        primaryColor: const Color(0xFF000000),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Color(0xFF000000)),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        fontFamily: 'RedHat',
        useMaterial3: true,
      ),
      home: MainPage(isregistered: isregistered),
    );
  }
}
