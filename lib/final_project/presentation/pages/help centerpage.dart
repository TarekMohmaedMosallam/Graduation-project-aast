import 'package:final_project_gd/final_project/presentation/pages/Setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../manager/compoents.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return LayoutBuilder(builder: (context, constraints) {
      double localwidth = constraints.maxWidth;
      double localheight = constraints.maxHeight;
      return Scaffold(
          body: SafeArea(
              child: Column(children: [
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.18,
                  child: Row(
                    children: [
                      SizedBox(
                        height: localheight * 0.08,
                      ),
                      NewBackButton(event: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => Settiing()));
                      }),
                      Fontinter(
                        text: "Frequently Asked\n Questions",
                        textsize: 30,
                        fontweight: FontWeight.w600,
                        color: Colors.black,
                        checkunderline: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: localheight * 0.08,
                ),
                HelpCenterList(),
              ])));
    });
  }
}
