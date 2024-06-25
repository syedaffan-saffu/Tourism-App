import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLoginService {
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

class SharedPrefsStoreString {
  Future<void> storetext(String key, String text) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, text);
  }

  Future<String> gettext(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("expfield") != null) {
      return prefs.getString("expfield")!;
    } else {
      return "";
    }
  }

  Future<void> deletetext() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("expfield");
  }
}
