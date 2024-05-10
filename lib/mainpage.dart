import 'package:flutter/material.dart';
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
  static const bool _isregistered = false;
  int _selectedIndex = 0;

  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override //Waqar
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: NavigatorPopHandler(
        onPop: () => navigatorKeys[_selectedIndex]!.currentState!.pop(),
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            NavigationPage(
              navigatorKey: navigatorKeys[0],
              child: const HomeScreen(),
            ),
            NavigationPage(
              navigatorKey: navigatorKeys[1],
              child: const Search(
                isregistered: _isregistered,
              ),
            ),
            NavigationPage(
              navigatorKey: navigatorKeys[2],
              child: const Location(),
            ),
            NavigationPage(
              navigatorKey: navigatorKeys[3],
              child: const Profile(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontSize: 1.0),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
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
