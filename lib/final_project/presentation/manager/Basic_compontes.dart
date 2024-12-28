// ignore_for_file: unnecessary_import, unused_local_variable

import 'dart:ui';

import 'package:final_project_gd/final_project/presentation/pages/HomePage.dart';
import 'package:final_project_gd/final_project/presentation/pages/Login_Page.dart';
import 'package:final_project_gd/final_project/presentation/pages/Privacy_policy.dart';
import 'package:final_project_gd/final_project/presentation/pages/SignUp_Page.dart';
import 'package:final_project_gd/final_project/presentation/pages/Term_widget.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/use_cases/Animation/Animate_route_transition.dart';

class Buttons {
  static Widget registerButton(BuildContext context) {
    return Transform.translate(
      offset:
          Offset(-5, -30), // Adjust these values to move the button up and left
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(SlideRight(page: SignUpPage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff325A3E),
          fixedSize: Size(288, 52),
        ),
        child: Text(
          "Sign up",
          style: GoogleFonts.inter(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static Widget loginbutton(context) {
    return Transform.translate(
      offset:
          Offset(-5, -50), // Adjust these values to move the button up and left
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(SlideRight(page: LoginPage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff325A3E),
          fixedSize: Size(288, 52),
        ),
        child: Text(
          "Log in",
          style: GoogleFonts.inter(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static Widget logintohome(context) {
    return Transform.translate(
      offset:
          Offset(-0, -0), // Adjust these values to move the button up and left
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(SlideRight(page: HomePage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff325A3E),
          fixedSize: Size(288, 52),
        ),
        child: Text(
          "Log in",
          style: GoogleFonts.inter(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Pt {
  static Widget test() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double localheight = constraints.maxHeight;
        double localwidth = constraints.maxWidth;
        return Container(
          alignment: Alignment.center,
          width: localwidth * 0.99,
          margin: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "By signing up, you agree to ",
                style: GoogleFonts.inter(fontSize: 12, color: Colors.black),
              ),
              InkWell(
                child: const Text(
                  'our terms ',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(SlideRight(page: const Term_Widget()));
                },
              ),
              Text(
                "& ",
                style: GoogleFonts.inter(fontSize: 12, color: Colors.black),
              ),
              InkWell(
                child: Text(
                  'privacy policy',
                  style: GoogleFonts.inter(
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(SlideRight(page: const PrivacyPolicy()));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
