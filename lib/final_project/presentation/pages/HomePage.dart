// ignore_for_file: unused_local_variable

import 'package:final_project_gd/final_project/presentation/manager/compoents.dart';
import 'package:final_project_gd/final_project/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/Warning Message.dart';
import '../../domain/entities/icon_part2_icons.dart';
import '../../domain/entities/values.dart';
import '../../domain/use_cases/Navigatation.dart';
import '../manager/Homepage_compontes.dart';
import 'Smart_Irrigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int   countmessage= WarningMessage.warningmessagelist.length;
    WidgetsFlutterBinding.ensureInitialized();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: screenWidth * double.infinity / 100,
              height: screenHeight * 0.18,

              ///color: Colors.red,
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                  ),
              GestureDetector(
                onTap: () {
                  // Handle the tap event here
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
                },
                child: FaceioneCricler(
                  vw: .6,
                  vh: .3,
                ),
              ),










                SizedBox(
                    width: 200,
                  ),
                  Badge(
                    label:Text("${countmessage}" ,),
                    alignment:Alignment.center,
                    //backgroundColor:Colors.green ,
                    child: CustomIcon(customicon: (Icons.notifications),event:() {
                        Navigations.notifcationpage(context);
                      }, ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: screenWidth * 0.6,
              height: screenHeight * 0.2,
              color: Colors.green,
              child:Image.asset("asset/homebackgound.png",fit:BoxFit.cover ,) ,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Main Feature",
              style:
                  GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 39,
                ),
                Column(
                  children: [
                    ContIcon(
                        widthscreen: 16,
                        heightscreen: 16,
                        icons: Icon_part2.smart_irrigation,
                        event: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SmartIrrigation()));
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: Values_Strings.Smart_Irrigation,
                    ),
                  ],
                ),
                SizedBox(
                  width: 40,
                  ),
                Column(
                  children: [
                  ContIcon(
                        widthscreen: 16,
                        heightscreen: 16,
                        icons: Icon_part2.scan,
                        event: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScannedCrops()));
                        },
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: Values_Strings.Scanned_crops,
                    ),
                  ],
                ),
              ],
              // Button_navigation_bar()
            )
          ],
        ),
      ),
      bottomNavigationBar:Button_navigation_bar(initialIndex: 0,)
    );
  }
}
