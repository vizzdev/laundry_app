import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool obscureText = true;
 

  set setobscureText(bool value) {
    obscureText = value;
    notifyListeners();
  }


}
