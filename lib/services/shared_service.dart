import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPrefHelper _prefsInstance = SharedPrefHelper._init();
  SharedPreferences? _sharedPreferences; //

  // SharedPrefHelper._privateConstructor();
  static SharedPrefHelper get prefInstance => _prefsInstance;

  SharedPrefHelper._init() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static Future createInstance() async {
    // ignore: prefer_conditional_assignment
    if (prefInstance._sharedPreferences == null) {
      prefInstance._sharedPreferences = await SharedPreferences.getInstance();
    }
    return;
  }

  bool checkExists(String key) {
    var result = _sharedPreferences?.getString(key.toString());
    if (result == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> setString(String key, String value) async {
    await _sharedPreferences?.setString(key, value);
  }

  String? getString(String key) {
    return _sharedPreferences?.getString(key);
  }

  void remove(String key) {
    _sharedPreferences?.remove(key.toString());
  }
}
