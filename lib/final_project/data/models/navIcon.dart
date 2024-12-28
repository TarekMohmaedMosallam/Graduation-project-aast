import 'package:final_project_gd/final_project/domain/entities/icon_part2_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NavIcon {
  static var navicon = [
    BottomNavigationBarItem(icon: Icon(Icon_part2.home_icon  ,),label:"home" ),
    BottomNavigationBarItem(icon: Icon(Icon_part2.icon__photo_camera),label:"camera" ),
    BottomNavigationBarItem(icon: Icon(Icon_part2.settingicon,),label: 'smart irrigation'),
  ];
}
