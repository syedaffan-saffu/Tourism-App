import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'backend/provider/providers.dart';
import 'utils/reusabs.dart';

class BottomBarPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const BottomBarPage({super.key, required this.navigationShell});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  late final IndexProvider indexprovider;
  @override
  void initState() {
    super.initState();
    final authProvider2 = Provider.of<AuthProvider2>(context, listen: false);
    authProvider2.loadLoginStatus();
    indexprovider = Provider.of<IndexProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontSize: 1.0),
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.navigationShell.currentIndex,
        showSelectedLabels: false,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) => _onTap(context, index),
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

  void _onTap(BuildContext context, int index) {
    indexprovider.changeindex(index);
    print("selected tab ${indexprovider.selectedindex}");
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
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
