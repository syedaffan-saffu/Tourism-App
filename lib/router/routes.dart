import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/homescreen/guide/guideprofile/guide_profile.dart';

import '../backend/provider/providers.dart';
import '../homescreen/adventure/adv_place.dart';
import '../homescreen/hmscrn.dart';
import '../mainpage2.dart';
import '../profile/profile.dart';
import '../profile/signinout/SignUp/signup.dart';
import '../search/s_tours/tours.dart';
import '../search/search.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<NavigatorState> _sectionBNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<NavigatorState> _sectionCNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<NavigatorState> _sectionDNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

class Goroutes {
  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/a',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        // parentNavigatorKey: _parentshellkey,
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          // Return the widget that implements the custom shell (in this case
          // using a BottomNavigationBar). The StatefulNavigationShell is passed
          // to be able access the state of the shell and to navigate to other
          // branches in a stateful way.
          return PopScope(
              canPop: false,
              onPopInvoked: (didpop) {
                print(navigationShell.route.parentNavigatorKey!.currentState!
                    .canPop());
              },
              child: BottomBarPage(navigationShell: navigationShell));
        },
        branches: <StatefulShellBranch>[
          // The route branch for the first tab of the bottom navigation bar.
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
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
            navigatorKey: _sectionBNavigatorKey,
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
            navigatorKey: _sectionCNavigatorKey,
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
            navigatorKey: _sectionDNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                // The screen to display as the root in the third tab of the
                // bottom navigation bar.
                path: '/profile',
                builder: (BuildContext context, GoRouterState state) =>
                    const SignUp(),
                routes: const <RouteBase>[],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
