import 'package:flutter/material.dart';
import 'package:trekkers_pk/backend/provider/providers.dart';
import 'package:trekkers_pk/router/initpage.dart';
import 'backend/sharedprefs/sharedprefs.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final prefsService = SharedPreferencesService();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider2(prefsService)),
      ChangeNotifierProvider(create: (_) => IndexProvider()),
      ChangeNotifierProvider(create: (_) => RoutesProvider())
    ],
    child: const MyApp(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // routes: {
//       //   "/home": (context) => const HomeScreen(),
//       //   "/search": (context) => const Search(),
//       //   "/loc": (context) => const Location(),
//       //   "/profile": (context) => const Profile(),
//       //   "/adv": (context) => const Advplace(),
//       //   "/guide": (context) => const GuidesProfile(),
//       // },
//       navigatorKey: mynavigatorKey,
//       title: 'trekkers_pk',
//       theme: ThemeData(
//         primaryColor: const Color(0xFF000000),
//         textSelectionTheme:
//             const TextSelectionThemeData(cursorColor: Color(0xFF000000)),
//         appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
//         fontFamily: 'RedHat',
//         useMaterial3: true,
//       ),
//       home: const MainPage(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'trekkers_pk',
      theme: ThemeData(
        primaryColor: const Color(0xFF000000),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Color(0xFF000000)),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        fontFamily: 'RedHat',
        useMaterial3: true,
      ),
    );
  }
}
