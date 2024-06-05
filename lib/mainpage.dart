import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'backend/provider/providers.dart';
import 'router/initpage.dart';
import 'utils/reusabs.dart';

class BottomBarPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const BottomBarPage({super.key, required this.navigationShell});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  @override
  void initState() {
    super.initState();

    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final indexprovider = Provider.of<IndexProvider>(context);
    final authprov = Provider.of<AuthProvider2>(context);
    return Scaffold(
      appBar: null,
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontSize: 1.0),
        type: BottomNavigationBarType.fixed,
        currentIndex: indexprovider.selectedindex,
        showSelectedLabels: false,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) => _onTap(context, index, indexprovider, authprov),
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

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    final indexProvider = Provider.of<IndexProvider>(context, listen: false);

    if (widget.navigationShell.currentIndex == 0) {
      print("Home bye"); // Do some stuff.
      return false;
    } else if (sectionBNavigatorKey.currentState != null &&
        sectionBNavigatorKey.currentState!.canPop() &&
        widget.navigationShell.currentIndex == 1) {
      print("B bye"); // Do some stuff.
      return false;
    } else if (sectionCNavigatorKey.currentState != null &&
        sectionCNavigatorKey.currentState!.canPop() &&
        widget.navigationShell.currentIndex == 2) {
      print("C bye"); // Do some stuff.
      return false;
    } else if (sectionDNavigatorKey.currentState != null &&
        sectionDNavigatorKey.currentState!.canPop() &&
        widget.navigationShell.currentIndex == 3) {
      print("D bye"); // Do some stuff.
      return false;
    } else if (rootNavigatorKey.currentState!.canPop()) {
      rootNavigatorKey.currentState!.pop();
      return false;
    } else {
      widget.navigationShell.goBranch(0);
      indexProvider.changeindex(0);
      print("nothing to pop, going to home screen back");
      return true;
    }
  }

  void _onTap(BuildContext context, int index, IndexProvider indexProvider,
      AuthProvider2 authprov) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == indexProvider.selectedindex,
    );
    indexProvider.changeindex(index);
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
