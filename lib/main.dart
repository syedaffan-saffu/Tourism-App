import 'package:flutter/material.dart';
import 'package:trekkers_pk/mainpage.dart';
import 'package:go_router/go_router.dart';

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
      home: const MainPage(),
    );
  }
}
