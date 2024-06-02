import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/backend/provider/providers.dart';
import 'package:trekkers_pk/homescreen/adventure/adv_place.dart';
import 'package:trekkers_pk/homescreen/hmscrn.dart';
import 'package:trekkers_pk/mainpage2.dart';
import 'package:trekkers_pk/profile/profile.dart';
import 'package:trekkers_pk/profile/signinout/SignUp/signup.dart';

import 'package:trekkers_pk/search/s_tours/tours.dart';
import 'package:trekkers_pk/search/search.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<NavigatorState> sectionBNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<NavigatorState> sectionCNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<NavigatorState> sectionDNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

AuthProvider2 _authProvider2(BuildContext context) {
  final authprov = Provider.of<AuthProvider2>(context);
  return authprov;
}

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      // parentNavigatorKey: _parentshellkey,
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        // Return the widget that implements the custom shell (in this case
        // using a BottomNavigationBar). The StatefulNavigationShell is passed
        // to be able access the state of the shell and to navigate to other
        // branches in a stateful way.
        return BottomBarPage(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        // The route branch for the first tab of the bottom navigation bar.
        StatefulShellBranch(
          navigatorKey: sectionANavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              // The screen to display as the root in the first tab of the
              // bottom navigation bar.
              path: '/home',
              builder: (BuildContext context, GoRouterState state) =>
                  const HomeScreen(),
              routes: <RouteBase>[
                // The details screen to display stacked on navigator of the
                // first tab. This will cover screen A but not the application
                // shell (bottom navigation bar).
                GoRoute(
                  path: 'adv',
                  builder: (BuildContext context, GoRouterState state) =>
                      const Advplace(),
                ),
                GoRoute(
                  path: 'guide',
                  builder: (BuildContext context, GoRouterState state) =>
                      const Advplace(),
                )
              ],
            ),
          ],
        ),

        // The route branch for the second tab of the bottom navigation bar.
        StatefulShellBranch(
          navigatorKey: sectionBNavigatorKey,
          // It's not necessary to provide a navigatorKey if it isn't also
          // needed elsewhere. If not provided, a default key will be used.
          routes: <RouteBase>[
            GoRoute(
              // The screen to display as the root in the second tab of the
              // bottom navigation bar.
              path: '/search',
              builder: (BuildContext context, GoRouterState state) =>
                  const Search(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'Tours',
                  builder: (BuildContext context, GoRouterState state) =>
                      const Tours(),
                ),
              ],
            ),
          ],
        ),

        // The route branch for the third tab of the bottom navigation bar.
        StatefulShellBranch(
          navigatorKey: sectionCNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              // The screen to display as the root in the third tab of the
              // bottom navigation bar.
              path: '/location',
              builder: (BuildContext context, GoRouterState state) =>
                  const Location(),
              routes: const <RouteBase>[],
            ),
          ],
        ),
///////////////////////////////////////////////////////////
        StatefulShellBranch(
          navigatorKey: sectionDNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              // The screen to display as the root in the third tab of the
              // bottom navigation bar.
              path: '/profile',
              builder: (BuildContext context, GoRouterState state) {
                final authprov2 = _authProvider2(context);
                return authprov2.isLoggedIn ? const Profile() : const SignUp();
              },
              routes: const <RouteBase>[],
            ),
          ],
        ),
      ],
    ),
  ],
);


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const InitPage();
//   }
// }
