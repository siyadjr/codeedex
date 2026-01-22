import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String tokenKey = 'auth_token';
  Future<void> saveToken(String token) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(tokenKey, token);
    // Implementation to save token locally
  }

  Future<String?> getToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(tokenKey);
    // Implementation to retrieve token from local storage
  }
}
