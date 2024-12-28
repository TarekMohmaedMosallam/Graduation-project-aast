import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../manager/compoents.dart';
import 'package:final_project_gd/final_project/presentation/pages/Basic_Page.dart';
import '../../domain/use_cases/Animation/Animate_route_transition.dart';
class ScannedCrops extends StatefulWidget {
   ScannedCrops({super.key});

  @override
  State<ScannedCrops> createState() => _ScannedCropsState();
}

class _ScannedCropsState extends State<ScannedCrops> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(
      builder: (context, constraints) {
        double localwidth = constraints.maxWidth;
        double localheight = constraints.maxHeight;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: <Widget>[
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
                            .push(SlideRight(page: Basic_Page()));
                      }),
                      SizedBox(
                        width: 40,
                      ),
                      Fontinter(
                        text: "Scanned crops",
                        textsize: 25,
                        fontweight: FontWeight.w600,
                        color: Colors.black,
                        checkunderline: false,
                      ),
                      SizedBox(
                        width: localwidth * 0.12,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: localheight * 0.08,
                ),
                ScannedCropsCompontes(),
              ],
            ),
          ),
        );
      },
    );
  }
}
