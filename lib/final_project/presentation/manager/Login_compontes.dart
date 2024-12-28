// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/famous_icon.dart';

class LoginComponts {
  static Widget emailtextfield(
      {String x = "Email", var iconData = Icons.message}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var localwidth = constraints.maxWidth;
        var localhight = constraints.maxWidth;
        return Container(
          width: localwidth * 0.9,
          height: localhight * 0.2,
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: Color(0xffF0F0F0),
              filled: true,
              prefixIcon: Icon(iconData),
              focusedBorder: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(width: 2, color: Color(0xffF0F0F0)),
              ),
              disabledBorder: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(24),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffF0F0F0)),
              ),
              enabledBorder: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(24),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffF0F0F0)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 11,
                  horizontal:
                      30), // Add this line where you set input decoration
              hintText: x,
              hintStyle: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget passwordtextfield(
      {String x = "Password", var icondata = Icons.lock}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var localwidth = constraints.maxWidth;
        var localhight = constraints.maxWidth;
        return Container(
          width: localwidth * 0.9,
          height: localhight * 0.2,
          child: TextFormField(
            obscureText: true, // Use hidden state variable to obscure text
            decoration: InputDecoration(
              prefixIcon: Icon(icondata),
              fillColor: Color(0xffF0F0F0),
              filled: true,
              focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(width: 2, color: Color(0xffF0F0F0)),
              ),
              disabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(width: 2, color: Color(0xffF0F0F0)),
              ),
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(width: 2, color: Color(0xffF0F0F0)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 11, horizontal: 30),
              hintText: x,
              hintStyle: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget signinbtn() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff325A3E),
        fixedSize: Size(288, 52),
      ),
      child: Text(
        "sign in",
        style: GoogleFonts.kanit(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  static Widget facebookbutton() {
    return LayoutBuilder(
      builder: (context, constraints) {
        var localwidth = constraints.maxWidth;
        var localhight = constraints.maxWidth;
        return InkWell(
          child: CircleAvatar(
            backgroundColor: Color(0xff325A3E),
            child: Image.asset(ContectIcon.facebookicon),
          ),
          onTap: () {},
        );
      },
    );
  }

  static Widget googleicon() {
    return LayoutBuilder(
      builder: (context, constraints) {
        var localwidth = constraints.maxWidth;
        var localhight = constraints.maxWidth;
        return InkWell(
          child: Container(
              width: 40,
              height: 45,
              child: Image.asset(
                ContectIcon.gmail,
                fit: BoxFit.fill,
              )),
          onTap: () {},
        );
      },
    );
  }
}
