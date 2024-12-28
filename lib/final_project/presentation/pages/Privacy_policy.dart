// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:final_project_gd/final_project/data/models/values.dart';
import 'package:final_project_gd/final_project/presentation/manager/compoents.dart';
import 'package:final_project_gd/final_project/presentation/pages/Basic_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/our terms_privacy policy.dart';
import '../../domain/entities/image_values.dart';
import '../../domain/use_cases/Animation/Animate_route_transition.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:  Colors.white,
        leading:NewBackButton(event:(){
          print("dskdlasd");
        } ,) ,
      ),
      body: Container(
        decoration:BoxDecoration(
          image:DecorationImage(image: AssetImage(Imagesbac.whitebackground),
          fit:BoxFit.cover
          )
        ) ,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      Policy.privacypolicy,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
