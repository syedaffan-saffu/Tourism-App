import 'package:flutter/material.dart';
import '/homescreen/guide/guideprofile/guideprofile.dart';
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
        fontFamily: 'RedHat',
        useMaterial3: true,
      ),
      home: const GuideProfile(),
    );
  }
}
