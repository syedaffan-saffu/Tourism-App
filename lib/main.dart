import 'package:flutter/material.dart';
import 'package:trekkers_pk/homescreen/guide/guideprofile/guide_profile.dart';
import 'profile/profile.dart';
import 'package:trekkers_pk/search/s_tours/tours.dart';

import 'mainpage.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> mynavigatorKey = GlobalKey<NavigatorState>();

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
      home: const Profile(),
    );
  }
}
