import 'package:flutter/material.dart';
import 'package:trekkers_pk/backend/provider/providers.dart';
import 'package:trekkers_pk/homescreen/adventure/adv_place.dart';
import 'package:trekkers_pk/homescreen/hmscrn.dart';
import 'package:trekkers_pk/homescreen/recomms/recomms.dart';
import 'package:trekkers_pk/profile/experiece.dart';
import 'package:trekkers_pk/profile/profile_edit/profileedit.dart';
import 'package:trekkers_pk/profile/signinout/Login/login.dart';
import 'package:trekkers_pk/profile/signinout/verifyemail.dart';
import 'backend/sharedprefs/sharedprefs.dart';
import 'profile/profile.dart';
import 'mainpage.dart';
import 'profile/signinout/SignUp/signup.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final prefsService = SharedPreferencesService();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider2(prefsService)),
      ChangeNotifierProvider(create: (_) => IndexProvider()),
    ],
    child: const MyApp(),
  ));
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
