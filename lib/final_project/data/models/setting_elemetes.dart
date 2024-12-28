import 'package:flutter/material.dart';

class Profile_Elments{
    String? name;

    Profile_Elments({required this.name, required this.icondata});

  IconData? icondata;
  static List profilelist=<Profile_Elments>[
    Profile_Elments(name: "Privacy policy", icondata: Icons.security),
    Profile_Elments(name: "Help center",icondata:Icons.help_center),
    Profile_Elments(name:"Logout",icondata:Icons.logout),
  ];


}