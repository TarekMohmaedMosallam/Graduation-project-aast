import 'package:final_project_gd/final_project/presentation/pages/HomePage.dart';
import 'package:final_project_gd/final_project/presentation/pages/Login_Page.dart';
import 'package:final_project_gd/final_project/presentation/pages/SignUp_Page.dart';
import 'package:flutter/material.dart';

import '../../presentation/manager/notificationcompontes.dart';
import '../../presentation/pages/help centerpage.dart';

class Navigations {
  static Backscannedcrops(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HelpCenterPage(),
    ));
  }

  static logintohome(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomePage(),
    ));
  }

  static signintohome(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginPage(),
    ));
  }
  static Signup(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignUpPage(),
    ));
  }
  static notifcationpage(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NotificationComponents(),
    ));
  }

}
