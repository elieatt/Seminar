import 'dart:async';

import 'package:seminar/data/network_services/auth_ns.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final AuthNS _NS;
  AuthRepository(this._NS);
  Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    bool? result = prefs.getBool("firstStart");
    if (result != null && result == false) {
      return false;
    }
    return true;
  }

  Future<void> tutorialPassed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("firstStart", false);
    return;
  }

  Future<Map<String, dynamic>?> login(String userID, String password) async {
    Map<String, dynamic>? parsedResponse = await _NS.login("das", "das");
    await Future.delayed(const Duration(seconds: 2));

    return null;
  }
}
