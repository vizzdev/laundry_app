import 'package:flutter/material.dart';
import 'package:laundry_app_laundry/Utils/shared_preferences.dart';

class CommonProvider extends ChangeNotifier {
  late String _token;
  late String _userId;

  String get token => _token;
  String get userId => _userId;
  late UserDefault userDefault;

  CommonProvider() {
    _token = "";
    _userId = "";
    userDefault = UserDefault();
    getUserDefault();
  }

  set setToken(String value) {
    _token = value;
    userDefault.setToken(value);
    notifyListeners();
  }

  set setUserId(String value) {
    _userId = value;
    userDefault.setUserId(value);
    notifyListeners();
  }

  getUserDefault() async {
    _token = await userDefault.getToken();
    _userId  =await userDefault.getUserId();
    notifyListeners();
  }
}
