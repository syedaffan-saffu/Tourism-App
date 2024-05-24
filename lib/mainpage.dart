import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/profile/signinout/SignUp/signup.dart';
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

class _MainPageState extends State<MainPage> {
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    final authProvider2 = Provider.of<AuthProvider2>(context, listen: false);
    authProvider2.loadLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider2>(context);
    final indexprovider = Provider.of<IndexProvider>(context);

    return Scaffold(
      appBar: null,
      body: NavigatorPopHandler(
        onPop: () =>
            navigatorKeys[indexprovider.selectedindex]!.currentState!.pop(),
        child: IndexedStack(
          index: indexprovider.selectedindex,
          children: [
            NavigationPage(
              navigatorKey: navigatorKeys[0],
              child: const HomeScreen(),
            ),
            NavigationPage(
              navigatorKey: navigatorKeys[1],
              child: const Search(),
            ),
            NavigationPage(
              navigatorKey: navigatorKeys[2],
              child: const Location(),
            ),
            NavigationPage(
              navigatorKey: navigatorKeys[3],
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
  const NavigationPage({super.key, required this.child, this.navigatorKey});
  final Widget child;
  final GlobalKey? navigatorKey;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
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
