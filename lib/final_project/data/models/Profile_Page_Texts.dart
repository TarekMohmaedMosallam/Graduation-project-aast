import 'package:flutter/material.dart';

class Profile_Page_Texts {
  String? name;

  Profile_Page_Texts({required this.name, required this.icondata});

  IconData? icondata;
  static List profilelist = <Profile_Page_Texts>[
    Profile_Page_Texts(name: "Name", icondata: Icons.security),
    Profile_Page_Texts(name: "password", icondata: Icons.help_center),
  ];
}