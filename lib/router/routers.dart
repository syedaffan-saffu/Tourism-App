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

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<NavigatorState> _sectionBNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<NavigatorState> _sectionCNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

late final AuthProvider2 authProvider2;

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/a',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      // parentNavigatorKey: _parentshellkey,
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        authProvider2 = Provider.of<AuthProvider2>(context, listen: false);
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
                      const Advplace(),
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
          navigatorKey: _sectionCNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              // The screen to display as the root in the third tab of the
              // bottom navigation bar.
              path: '/profile',
              builder: (BuildContext context, GoRouterState state) =>
                  authProvider2.isLoggedIn ? const Profile() : const SignUp(),
              routes: const <RouteBase>[],
            ),
          ],
        ),
      ],
    ),
  ],
);

class MainPage2 extends StatefulWidget {
  const MainPage2({super.key});

  @override
  State<MainPage2> createState() => _MainPage2State();
}

class _MainPage2State extends State<MainPage2> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
