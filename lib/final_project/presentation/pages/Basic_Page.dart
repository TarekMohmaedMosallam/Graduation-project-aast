import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../manager/Basic_compontes.dart';

class Basic_Page extends StatefulWidget {
  const Basic_Page({Key? key}) : super(key: key);

  @override
  State<Basic_Page> createState() => _Basic_PageState();
}

class _Basic_PageState extends State<Basic_Page> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenHeight = MediaQuery.of(context).size.height;
            double screenWidth = MediaQuery.of(context).size.width;
            double localheight = constraints.maxHeight;
            double localwidth = constraints.maxWidth;
            return Column(
              children: [
                Container(
                    width: screenWidth * 0.9,
                    child: Image.asset("asset/image/logo.png")),
                // SizedBox(height: screenHeight * 0.2),
                Container(
                    width: localwidth * 0.5,
                    child: Image.asset(
                      "asset/ic_email_submit_logo.jpg",
                      fit: BoxFit.fill,
                    )),
                SizedBox(height: screenHeight * 0.2),
                Buttons.loginbutton(context),
                Buttons.registerButton(context),
                SizedBox(
                  height: 11,
                ),
                SizedBox(
                  height: 8,
                ),
                Pt.test()
              ],
            );
          },
        ),
      ),
    );
  }
}
