import 'package:final_project_gd/final_project/presentation/pages/Basic_Page.dart';
import 'package:final_project_gd/final_project/presentation/pages/HomePage.dart';
import 'package:final_project_gd/final_project/presentation/pages/Privacy_policy.dart';
import 'package:final_project_gd/final_project/presentation/pages/help%20centerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/Imagetest.dart';
import '../../data/models/Profile_Page_Texts.dart';
import '../../data/models/setting_elemetes.dart';
import '../../domain/entities/help center.dart';
import '../pages/Help center 2.dart';
import '../pages/crop details.dart';
import '../pages/forget_pw_page.dart';
import 'Homepage_compontes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.textsize,
    required this.color,
    required this.fontWeight,
      this.event,
  });

  final String text;
  final double textsize;
  final Color color;
  final FontWeight fontWeight;
  final event;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: event,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff325A3E),
        fixedSize: Size(288, 52),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: textsize,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.iconData,
    required this.text,
    required this.fontweight,
    required this.textsize,
    required this.hidden,
    required this.iconcolor, required this.textcontroller,

  });

  final IconData iconData;
  final String text;
  final FontWeight fontweight;
  final double textsize;
  final bool hidden;
  final Color iconcolor;
   final TextEditingController textcontroller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var localWidth = constraints.maxWidth;
        return Container(
          width: localWidth * 0.9,
          child: TextFormField(
            controller: textcontroller,
            obscureText: hidden,
            decoration: InputDecoration(
              fillColor: Color(0xffF0F0F0),
              filled: true,
              prefixIcon: Icon(
                iconData,
                color: iconcolor,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xffF0F0F0)),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xffF0F0F0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xffF0F0F0)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 11, horizontal: 30),
              hintText: text,
              hintStyle: GoogleFonts.inter(
                fontSize: textsize,
                fontWeight: fontweight,
              ),
            ),
          ),
        );
      },
    );
  }
}

class Fontinter extends StatelessWidget {
  const Fontinter({
    Key? key,
    required this.text,
    required this.textsize,
    required this.fontweight,
    this.color = Colors.black,
    required this.checkunderline,
  }) : super(key: key);

  final String text;
  final double textsize;
  final FontWeight fontweight;
  final Color color;
  final bool checkunderline;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: textsize,
        fontWeight: fontweight,
        color: color,
        decoration: checkunderline ? TextDecoration.underline : null,
      ),
    );
  }
}

class ButtonCricle extends StatelessWidget {
  ButtonCricle({
    super.key,
    required this.color,
    required this.iconimage,
  });

  final Color color;
  final String iconimage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: CircleAvatar(
        backgroundColor: color,
        child: Image.asset(iconimage),
      ),
      onTap: () {},
    );
  }
}

class MessageText extends StatelessWidget {
  const MessageText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: const <TextSpan>[
          TextSpan(
              text: 'By signing you agree to our ',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff325A3E))),
          TextSpan(
              text: 'term of use \n  ',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey)),
          TextSpan(
              text: '                    and privacy notice',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey)),
        ],
      ),
    );
  }
}

class Poppins extends StatelessWidget {
  Poppins({
    Key? key,
    required this.text,
    required this.textsize,
    required this.fontweight,
    required this.color,
    required this.checkunderline,
  }) : super(key: key);

  final String text;
  final double textsize;
  final FontWeight fontweight;
  final Color color;
  final bool checkunderline;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: textsize,
        fontWeight: fontweight,
        color: color,
        decoration: checkunderline ? TextDecoration.underline : null,
      ),
    );
  }
}

class NewBackButton extends StatelessWidget {
  NewBackButton({super.key, this.event});
  final event;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return InkWell(
      child: Container(
        width: screenWidth * 0.2,
        height: screenheight * 0.2,
        child: Image.asset("asset/newbuttonicon_finalmodel.png"),
      ),
      onTap: event,
    );
  }
}

class CustomListProject extends StatelessWidget {
  const CustomListProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double localwidth = constraints.maxWidth;
          double localhight = constraints.maxHeight;
          return ListView.builder(
            physics: ScrollPhysics(),
            itemCount: Profile_Elments.profilelist.length,
            itemBuilder: (context, index) {
              return InkWell(
                  child: Column(
                    children: [
                      Container(
                        width: localwidth * 0.8,
                        height: localhight * 0.17,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffC3FDB8),
                          boxShadow: [
                            BoxShadow(color: Colors.black, offset: Offset(1, 1))
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              color:Color(0xff325A3E),
                              Profile_Elments.profilelist[index].icondata,
                              size: 32,
                            ), // Using icondata directly
                            SizedBox(width: 25),
                            Poppins(
                                text: Profile_Elments.profilelist[index].name,
                                textsize: 24,
                                fontweight: FontWeight.normal,
                                color: Colors.black,
                                checkunderline: false), // Display the name
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 13.1,
                      ),
                    ],
                  ),
                  onTap: () {
                    if (index == 0) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PrivacyPolicy()));
                    } else if (index == 1) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HelpCenterPage()));
                    } else if (index == 2) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Basic_Page()));
                    }
                  });
            },
          );
        },
      ),
    );
  }
}

class ScannedCrops extends StatefulWidget {
  const ScannedCrops({super.key});

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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      }),
                      SizedBox(
                        width: localwidth * 0.14,
                      ),
                      Fontinter(
                        text: "scanned crops",
                        textsize: 25,
                        fontweight: FontWeight.w600,
                        color: Colors.black,
                        checkunderline: false,
                      ),
                      SizedBox(
                        width: localwidth * 0.14,
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

class ScannedCropsCompontes extends StatelessWidget {
  const ScannedCropsCompontes({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        double localWidth = constraints.maxWidth;
        double localHeight = constraints.maxHeight;

        return ListView.builder(
          physics: ScrollPhysics(),
          itemCount: Imagetest.list.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Column(
                children: [
                  Container(
                    width: localWidth * 0.9,
                    height: localHeight * 0.19,
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.04),
                      color: Color(0xffC3FDB8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(screenWidth * 0.1),

                          ),
                          child: Image.asset(
                            Imagetest.list[index].image.toString(),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.1),
                        Expanded(
                          child: Text(
                            '${Imagetest.list[index].name}\n${Imagetest.list[index].date}',
                            style: TextStyle(
                              fontSize: screenWidth * 0.055,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Crop_details(imagetest: Imagetest.list[index]),
                ));
              },
            );
          },
        );
      }),
    );
  }
}

class HelpCenterList extends StatelessWidget {
  HelpCenterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        double localwidth = constraints.maxWidth;
        double localheight = constraints.maxHeight;
        return ListView.builder(
          physics: ScrollPhysics(),
          itemCount: HelpCenter.helpcenterlist.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Column(
                children: [
                  Container(
                    width: localwidth * 0.9,
                    height: localheight * 0.19,
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffC3FDB8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Poppins(
                      text: HelpCenter.helpcenterlist[index].problemname
                          .toString(),
                      textsize: 20,
                      fontweight: FontWeight.w400,
                      color: Colors.black,
                      checkunderline: false,
                    ),
                  ),
                  SizedBox(height: 13.1),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Helpcenter2(
                      helpcenter: HelpCenter.helpcenterlist[index],
                    )));
              },
            );
          },
        );
      }),
    );
  }
}

class CustomListProfile extends StatefulWidget {
  const CustomListProfile({Key? key}) : super(key: key);

  @override
  State<CustomListProfile> createState() => CustomListProfileState();
}

class CustomListProfileState extends State<CustomListProfile> {
  bool secureText = true;
  late TextEditingController fristname;
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController confrompassword;
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
    fristname = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    confrompassword = TextEditingController();
  }

  @override
  void dispose() {
    fristname.dispose();
    password.dispose();
    email.dispose();
    confrompassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double localwidth = constraints.maxWidth;
          double localhight = constraints.maxHeight;
          return ListView.builder(
            physics: ScrollPhysics(),
            itemCount: Profile_Page_Texts.profilelist.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Column(
                  children: [
                    Container(
                      width: localwidth * 0.8,
                      height: localhight * 0.17,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffC3FDB8),
                        boxShadow: [
                          BoxShadow(color: Colors.black, offset: Offset(1, 1))
                        ],
                      ),
                      child: Row(
                        children: [
                          if (index == 0)
                            Padding(
                              padding:
                              const EdgeInsets.only(),
                              child: Row(
                                children: [
                                  Icon(
                                    Profile_Page_Texts.profilelist[index].icondata,
                                    size: 32,
                                  ),
                                  Text("      ${currentUser.email!}"),
                                ],
                              ),
                            ),
                          if (index != 0) SizedBox(width: 80),
                          // Icon(
                          //   Profile_Page_Texts.profilelist[index].icondata,
                          //   size: 32,
                          // ),
                          SizedBox(width: 25),
                          if (index != 0)
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 1.0,
                                  right: 1.0), // Adjust these values as needed
                              child: Poppins(
                                text:
                                Profile_Page_Texts.profilelist[index].name,
                                textsize: 24,
                                fontweight: FontWeight.normal,
                                color: Colors.black,
                                checkunderline: false,
                              ),
                            ),
                          SizedBox(width: 25),
                          // if (index == 0)
                          //   Padding(
                          //     padding:
                          //         const EdgeInsets.only(top: 8.0, left: 10.0),
                          //     child:
                          //       text:
                          //           Profile_Page_Texts.profilelist[index].name,
                          //     ),
                          //   ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 13.1,
                    ),
                  ],
                ),
                onTap: () {
                  if (index == 1) {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Forgetpassword()));
                    });
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
