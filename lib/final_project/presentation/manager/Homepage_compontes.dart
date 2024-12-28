// ignore_for_file: unused_local_variable, must_be_immutable





import 'package:final_project_gd/final_project/domain/entities/Cols.dart';
import 'package:final_project_gd/final_project/presentation/pages/HomePage.dart';
import 'package:final_project_gd/final_project/presentation/pages/Setting.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../../data/models/navIcon.dart';
import '../../domain/use_cases/Action.dart';



class FaceioneCricler extends StatefulWidget {
  FaceioneCricler({super.key, required this.vh, required this.vw});
  final double vh;
   final double vw;


  @override
  _FaceioneCriclerState createState() => _FaceioneCriclerState();
}

class _FaceioneCriclerState extends State<FaceioneCricler> {

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenhight = MediaQuery.of(context).size.height;
    return Container(
      width: screenwidth * widget.vw * .3,
      height: screenhight * widget.vh * .3,
      padding: EdgeInsets.only(left: 15),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child:  Icon(Icons.account_circle,size: 80,) ,
      ),
    );
  }
}
class CustomIcon extends StatelessWidget {
   CustomIcon({super.key, required this.customicon,this.event});
  final IconData customicon;
   var event;


  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    var screenwidth = MediaQuery.of(context).size.height;
    var screenhight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        left: 30,
      ),
      child: IconButton(
          style: ButtonStyle(),
          onPressed: event,
          icon: Icon(
            customicon,
            size: 35,
            color: Cols.col2,
          )),
    );
  }
}

class ContIcon extends StatelessWidget {
  ContIcon(
      {super.key,
      required this.widthscreen,
      required this.heightscreen,
      required this.icons,
      this.event});
  final double widthscreen;
  final double heightscreen;
  final IconData icons;
  var event;

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.height;
    var screenhight = MediaQuery.of(context).size.height;
    return InkWell(
      child: Container(
        width: screenwidth * widthscreen / 100,
        height: screenhight * heightscreen / 100,
        color: Cols.col1,
        child: Icon(
          icons,
          size: 80,
          color: Cols.col2,
        ),
      ),
      onTap: event,
    );
  }
}

class Button_navigation_bar extends StatefulWidget {
  Button_navigation_bar({super.key, required this.initialIndex});
  final int initialIndex;

  @override
  _Button_navigation_bar createState() => _Button_navigation_bar();
}

class _Button_navigation_bar extends State<Button_navigation_bar> {
   late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: NavIcon.navicon,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        selectedItemColor: Color(0xff325A3E),
        unselectedItemColor: Color(0xffA5AFA8), // Color for unselected items
        onTap: (index) async {
          setState(() {
            currentIndex = index;
            if (index == 2)   Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Settiing()));


            if (index == 1) {
              ClickEvent.openCamera(
                  context); // Open camera when camera icon is tapped
            }  if (index == 0) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage()),
              );
          }});

          });
  }
}

class ImageCapturePage extends StatelessWidget {
  final File imageFile;

  ImageCapturePage({required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Capture'),
      ),
      body: Center(
        child: Image.file(imageFile),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Cols.col3,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
