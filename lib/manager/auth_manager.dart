import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  Future<bool> loggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    var loggedIn = prefs.getBool('loggedIn') ?? false;
    return loggedIn;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('loggedIn', false);
  }
}
