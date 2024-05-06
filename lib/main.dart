import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/profile/experiece.dart';
import 'package:trekkers_pk/profile/profile_edit/profileedit.dart';
import 'homescreen/activities/activities.dart';
import 'profile/profile.dart';
import 'mainpage.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => WishlistState()),
  ], child: const MyApp()));
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
      home: const MainPage(),
    );
  }
}
