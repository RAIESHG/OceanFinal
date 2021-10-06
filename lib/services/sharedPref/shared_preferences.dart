import 'dart:convert';

import 'package:ocean_publication/model/authResponse/authresponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ocean_publication/services/sharedPref/local_storage_strategy.dart';

class SharedPreferencesService extends LocalStorageStrategy {
  final SharedPreferences _pref;

  static SharedPreferencesService? _instance;
  static Future<SharedPreferencesService> getInstance() async {
    if (_instance == null) {
      _instance =
          SharedPreferencesService(pref: await SharedPreferences.getInstance());
    }
    return _instance!;
  }

  SharedPreferencesService({required SharedPreferences pref}) : _pref = pref;

  /// saves user data to local storage using shared preferences package
  ///
  @override
  Future<void> saveUser(AuthResponse userData) async {
    var map = userData.toMap();
    print(map);

    await _pref.remove("userProfile");
    var saveData = await _pref.setString("userProfile", jsonEncode(map));
    persistLogin();

    print(saveData ? "Saved" : "Couldnot save");
  }

  /// if rememberMe value is true then this will save the user data to local storage. otherwise not
  @override
  Future<void> persistLogin() async {
    await _pref.setBool("loggedIn", true);
  }

  @override
  Future<void> deleteSavedUser() async {
    await _pref.remove("userProfile");
    await _pref.setBool("loggedIn", false);
  }

  @override
  Future<bool> loginCheck() async {
    bool? loggedIn = _pref.getBool("loggedIn");
    return loggedIn ?? false;
  }

  @override
  Future<AuthResponse?>? getCachedUser() async {
    dynamic data;

    var savedData = _pref.getString("userProfile");

    data = savedData != null ? authResponseFromMap(savedData) : null;
    return data;
  }
}
