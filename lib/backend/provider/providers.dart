import 'package:flutter/material.dart';

import '../sharedprefs/sharedprefs.dart';

class IndexProvider extends ChangeNotifier {
  int _selectedindex = 0;

  int get selectedindex => _selectedindex; //s

  void changeindex(int index) {
    _selectedindex = index;
    notifyListeners();
  }
}

class AuthProvider2 extends ChangeNotifier {
  final SharedPreferencesService _prefsService;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  AuthProvider2(this._prefsService) {
    loadLoginStatus();
  }

  Future<void> loadLoginStatus() async {
    _isLoggedIn = await _prefsService.isUserLoggedIn();
    notifyListeners();
  }

  Future<void> login() async {
    _isLoggedIn = true;
    await _prefsService.setUserLoggedIn(true);
    notifyListeners();
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    await _prefsService.setUserLoggedIn(false);
    notifyListeners();
  }
}

class RoutesProvider extends ChangeNotifier {
  List<int> _count = [0, 0, 0, 0];
  List<int> get count => _count;

  void increment(int index) {
    _count[index]++;
  }

  void decrement(int index) {
    _count[index]--;
    notifyListeners();
  }
}
