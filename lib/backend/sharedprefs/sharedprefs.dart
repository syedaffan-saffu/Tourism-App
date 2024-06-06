import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _keyIsLoggedIn = 'isLoggedIn';

  Future<void> setUserLoggedIn(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, isLoggedIn);
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }
}
