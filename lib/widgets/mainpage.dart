import 'dart:io';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../backend/provider/providers.dart';
import '../backend/router/routes.dart';
import '../utils/utilspack1.dart';

class BottomBarPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const BottomBarPage({super.key, required this.navigationShell});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _counter = 0;
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
    final authprov = Provider.of<AuthProvider>(context);
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
          BottomNavigationBarItem(icon: Icon(CustomIcons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(CustomIcons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(CustomIcons.location), label: ''),
          BottomNavigationBarItem(icon: Icon(CustomIcons.profile), label: ''),
        ],
      ),
    );
  }

  Future<bool> myInterceptor(
      bool stopDefaultButtonEvent, RouteInfo info) async {
    final indexProvider = Provider.of<IndexProvider>(context, listen: false);

    if (widget.navigationShell.currentIndex == 0) {
      if (sectionANavigatorKey.currentState!.canPop()) {
        print("Home bye "); // Do some stuff.
        return false;
      } else {
        _counter++;

        if (_counter == 1) {
          await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Exit?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          context.pop();
                          _counter = 0;
                        },
                        child: const Text("cancel")),
                    TextButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: const Text("exit")),
                  ],
                );
              });
        } else {
          exit(0);
        }
        return true;
      }
    } else if (sectionBNavigatorKey.currentState != null &&
        sectionBNavigatorKey.currentState!.canPop() &&
        widget.navigationShell.currentIndex == 1) {
      if (kDebugMode) {
        print("B bye");
      } // Do some stuff.
      return false;
    } else if (sectionCNavigatorKey.currentState != null &&
        sectionCNavigatorKey.currentState!.canPop() &&
        widget.navigationShell.currentIndex == 2) {
      if (kDebugMode) {
        print("C bye");
      } // Do some stuff.
      return false;
    } else if (sectionDNavigatorKey.currentState != null &&
        sectionDNavigatorKey.currentState!.canPop() &&
        widget.navigationShell.currentIndex == 3) {
      if (kDebugMode) {
        print("D bye");
      } // Do some stuff.
      return false;
    } else if (rootNavigatorKey.currentState!.canPop()) {
      rootNavigatorKey.currentState!.pop();
      return false;
    } else {
      widget.navigationShell.goBranch(0);
      indexProvider.changeindex(0);
      if (kDebugMode) {
        print("nothing to pop, going to home screen back");
      }
      return true;
    }
  }

  void _onTap(BuildContext context, int index, IndexProvider indexProvider,
      AuthProvider authprov) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == indexProvider.selectedindex,
    );
    indexProvider.changeindex(index);
  }
}
