import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static String authKey = "auth_key";
  static String keyAccessToken="access_token";
  static String keyRefreshToken="refresh_token";
  static String keyTokenType="token_type";
  static String authToken ="auth_token";

  static Future<void> saveString(
    {
    required  String key,
    required String value,
    }
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
  static Future<String?> getString(
    {required String key}
  ) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  static Future<void> remove(
    String key,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}