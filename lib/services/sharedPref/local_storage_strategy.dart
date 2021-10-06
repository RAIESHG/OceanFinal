import 'package:ocean_publication/model/authResponse/authresponse.dart';
import 'package:ocean_publication/services/sharedPref/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageStrategy {
  

   
  /// saves user data to local storage using shared preferences package
  Future<void> saveUser(AuthResponse userData);

  /// if rememberMe value is true then this will save the user data to local storage. otherwise not
  Future<void> persistLogin();

  Future<void> deleteSavedUser();
  Future<bool> loginCheck();
  Future<AuthResponse?>? getCachedUser();
  // Future<bool> setString({required String key, required String val});
  // String? getString({required String key});

  // Future<bool> setJWT({required String token});

  // String? getJWT();

  // Future<bool> clearJWT();
  // Future<bool> setUser({required List<String> userDetails});
  // Future<bool> clearUser();
  // List<String>? getUser();
  // List<CartResponse> getSavedCart();
  // Future<bool> saveCart({required List<CartResponse> cartObjectList});
}
