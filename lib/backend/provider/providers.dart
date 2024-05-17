import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}

class IndexProvider extends ChangeNotifier {
  int _selectedindex = 0;

  int get selectedindex => _selectedindex;

  void changeindex(int index) {
    _selectedindex = index;
    notifyListeners();
  }
}
