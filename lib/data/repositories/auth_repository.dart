import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    bool? result = prefs.getBool("firstStart");
    if (result != null && result == false) {
      return false;
    }
    return true;
  }

  static Future<void> tutorialPassed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("firstStart", false);
    return;
  }
}
