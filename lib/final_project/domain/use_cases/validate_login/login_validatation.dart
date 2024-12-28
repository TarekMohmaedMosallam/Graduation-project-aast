import '../Navigatation.dart';
import 'package:flutter/material.dart';

class LoginValidation {
  static loginvalide({required BuildContext context, required String email, required String password}) {
    if (email == "ali" && password == "1234") {
      Navigations.logintohome(context);
    } else {
      print('Invalid credentials');
    }
  }
}
