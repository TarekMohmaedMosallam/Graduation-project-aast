// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../pages/Basic_Page.dart';
import '../pages/HomePage.dart';
import '../pages/Login_Page.dart';
import '../pages/NotificationsPage.dart';
import '../pages/Privacy_policy.dart';
import '../pages/Setting.dart';
import '../pages/Scanned crops.dart';
import '../pages/SignUp_Page.dart';
import '../pages/Smart_Irrigation.dart';
import '../pages/Term_widget.dart';
import '../pages/forget_pw_page.dart';
import '../pages/help centerpage.dart';
import '../pages/profile_page.dart';

class MangerUI extends StatefulWidget {
  MangerUI({Key? key}) : super(key: key);

  @override
  State<MangerUI> createState() => _MangerUIState();
}

class _MangerUIState extends State<MangerUI> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    List<Widget> list = [
      //0
      Basic_Page(),
      //1
      PrivacyPolicy(),
      //2
      SignUpPage(),
      //3
      LoginPage(),
      //4
      Term_Widget(),
      //5
      HomePage(),
      //6
      SmartIrrigation(),
      //7
      Settiing(),
      //8
      ScannedCrops(),
      //9
      HelpCenterPage(),
      //10
      NotificationsPage(),
      //11
      Forgetpassword(),
      // 12
      Profile()
    ];

    return list[0];
  }
}
