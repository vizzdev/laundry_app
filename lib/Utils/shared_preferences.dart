import 'package:shared_preferences/shared_preferences.dart';

class UserDefault {
  static const tokenkey = "tokenkey";
  static const userIdKey = "userIdKey";

  setToken(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(tokenkey, value);
  }

  getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(tokenkey) ?? "";
  }

  setUserId(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userIdKey, value);
  }

  getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userIdKey) ?? "";
  }
}
