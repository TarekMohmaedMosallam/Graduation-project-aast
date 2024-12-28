import 'package:final_project_gd/final_project/presentation/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../manager/Homepage_compontes.dart';
import '../manager/compoents.dart';

class Settiing extends StatefulWidget {
   Settiing({super.key});

  @override
  State<Settiing> createState() => _Settiing();
}

class _Settiing extends State<Settiing> {
  int thirdicon=3;
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    int count = 0;
    return LayoutBuilder(
      builder: (context, constraints) {
        double localwidth = constraints.maxWidth;
        double localhight = constraints.maxHeight;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  width: screenWidth * double.infinity / 100,
                  height: screenHeight * 0.18,
                  child: Row(
                    children: [
                      SizedBox(
                        height: localhight * 8,
                      ),
                      NewBackButton(event: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      }),
                      SizedBox(
                        width: localwidth * 0.14,
                      ),
                      Fontinter(
                          text: "Settings",
                          textsize: 25,
                          fontweight: FontWeight.w600,
                          color: Colors.black,
                          checkunderline: false),
                      SizedBox(
                        width: localwidth * 0.14,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: localhight * 0.08,
                ),
                CustomListProject(),
              ],
            ),
          ),
          bottomNavigationBar: Button_navigation_bar(initialIndex:2 ,)
        );
      },
    );
  }
}
