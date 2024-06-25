import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../sharedprefs/sharedprefs.dart';

class IndexProvider extends ChangeNotifier {
  int _selectedindex = 0;

  int get selectedindex => _selectedindex; //s

  void changeindex(int index) {
    _selectedindex = index;
    notifyListeners();
  }
}

class AuthProvider extends ChangeNotifier {
  final SharedPreferencesLoginService _prefsService;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  AuthProvider(this._prefsService) {
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

class IsarProvider extends ChangeNotifier {
  Isar? _isar;

  Isar? get isar => _isar;

  void isarUpdate(Isar? isarupdated) {
    _isar = isarupdated;
    notifyListeners();
  }
}
