import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/backend/provider/providers.dart';
import 'package:trekkers_pk/widgets/homescreen/adventure/adv_place.dart';
import 'package:trekkers_pk/widgets/homescreen/guide/guideprofile/gprofile_elements/videos/videos.dart';
import 'package:trekkers_pk/widgets/homescreen/guide/guideprofile/guide_profile.dart';
import 'package:trekkers_pk/widgets/homescreen/hmscrn.dart';
import 'package:trekkers_pk/widgets/mainpage.dart';
import 'package:trekkers_pk/widgets/profile/cert_license.dart';
import 'package:trekkers_pk/widgets/profile/experiece.dart';
import 'package:trekkers_pk/widgets/profile/p_s_activities.dart';
import 'package:trekkers_pk/widgets/profile/profile.dart';
import 'package:trekkers_pk/widgets/profile/profile_edit/profileedit.dart';
import 'package:trekkers_pk/widgets/profile/signinout/Login/login.dart';
import 'package:trekkers_pk/widgets/profile/signinout/SignUp/signup.dart';

import 'package:trekkers_pk/widgets/search/s_tours/tours.dart';
import 'package:trekkers_pk/widgets/search/search.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<NavigatorState> sectionBNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionBNav');
final GlobalKey<NavigatorState> sectionCNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionCNav');
final GlobalKey<NavigatorState> sectionDNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionDNav');

AuthProvider2 _authProvider2(BuildContext context) {
  final authprov = Provider.of<AuthProvider2>(context);
  return authprov;
}

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: '/ytvideo',
      builder: (context, state) => YTPlayer(videoid: state.extra.toString()),
    ),
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
                      const GuidesProfile(),
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
                  path: 'tours',
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
              routes: <RouteBase>[
                GoRoute(
                  path: 'login',
                  builder: (context, state) {
                    return const Login();
                  },
                ),
                GoRoute(
                  path: 'profedit',
                  builder: (context, state) {
                    return const ProfileEdit();
                  },
                ),
                GoRoute(
                  path: 'exp',
                  builder: (context, state) {
                    return const Experience();
                  },
                ),
                GoRoute(
                  path: 'sportsact',
                  builder: (context, state) {
                    return const SportsAct();
                  },
                ),
                GoRoute(
                  path: 'certnlic',
                  builder: (context, state) {
                    return const CertandLicense();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
