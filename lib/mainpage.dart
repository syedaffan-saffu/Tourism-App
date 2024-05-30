import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/profile/signinout/SignUp/signup.dart';
import 'backend/Navigation.dart';
import 'backend/provider/providers.dart';
import 'reusabs/reusabs.dart';
import 'homescreen/hmscrn.dart';
import 'profile/profile.dart';
import 'search/search.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
  0: GlobalKey(),
  1: GlobalKey(),
  2: GlobalKey(),
  3: GlobalKey(),
};

class _MainPageState extends State<MainPage> {
  Map<int, NavigationTracker> navigationTrackers = {};
  late final LinkCountProvider countprov;
  late final List<int> routes;

  @override
  void initState() {
    super.initState();
    final authProvider2 = Provider.of<AuthProvider2>(context, listen: false);
    countprov = Provider.of<LinkCountProvider>(context, listen: false);
    authProvider2.loadLoginStatus();
    navigationTrackers = {
      0: NavigationTracker(countprov, 0),
      1: NavigationTracker(countprov, 1),
      2: NavigationTracker(countprov, 2),
      3: NavigationTracker(countprov, 3),
    };
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider2>(context);
    final indexprovider = Provider.of<IndexProvider>(context);
    return Scaffold(
      key: scaffoldkey,
      appBar: null,
      body: NavigatorPopHandler(
        onPop: () {
          // if (countprov.count[indexprovider.selectedindex] > 1) {
          //   navigatorKeys[indexprovider.selectedindex]!.currentState!.pop();
          // } else {
          //   indexprovider.changeindex(0);
          // }
          // if (countprov.count[indexprovider.selectedindex] < 2 &&
          //     indexprovider.selectedindex != 0) {
          //   indexprovider.changeindex(0);
          // } else {
          //   navigatorKeys[indexprovider.selectedindex]!.currentState!.pop();
          // }
          navigatorKeys[indexprovider.selectedindex]!.currentState!.pop();
          // print("${indexprovider.selectedindex}, ${countprov.count}");
        },
        child: IndexedStack(
          index: indexprovider.selectedindex,
          children: [
            NavigationPage(
              navigatorKey: navigatorKeys[0],
              navigatorObserver: navigationTrackers[0] as NavigatorObserver,
              child: const HomeScreen(),
            ),
            NavigationPage(
              navigatorKey: navigatorKeys[1],
              navigatorObserver: navigationTrackers[1] as NavigatorObserver,
              child: const Search(),
            ),
            NavigationPage(
              navigatorKey: navigatorKeys[2],
              navigatorObserver: navigationTrackers[2] as NavigatorObserver,
              child: const Location(),
            ),
            NavigationPage(
              navigatorKey: navigatorKeys[3],
              navigatorObserver: navigationTrackers[3] as NavigatorObserver,
              child: authProvider.isLoggedIn ? const Profile() : const SignUp(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontSize: 1.0),
        type: BottomNavigationBarType.fixed,
        currentIndex: indexprovider.selectedindex,
        showSelectedLabels: false,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            indexprovider.changeindex(index);
          });
          print("selected tab ${indexprovider.selectedindex}");
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.home),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(CustomIcons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(CustomIcons.location), label: ''),
          BottomNavigationBarItem(icon: Icon(CustomIcons.profile), label: ''),
        ],
      ),
    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage(
      {super.key,
      required this.child,
      this.navigatorKey,
      required this.navigatorObserver});
  final Widget child;
  final GlobalKey? navigatorKey;
  final NavigatorObserver navigatorObserver;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      // observers: [widget.navigatorObserver],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              return widget.child;
            });
      },
      key: widget.navigatorKey,
    );
  }
}

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Location'),
    );
  }
}
