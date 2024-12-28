import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../domain/use_cases/account process.dart';
import '../manager/compoents.dart';


import '../../domain/use_cases/Navigatation.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool secureText = true;
  late TextEditingController fristname;
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController confrompassword;

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenHeight = MediaQuery.of(context).size.height;
            double screenWidth = MediaQuery.of(context).size.width;

            return Column(
              children: [
                Container(
                  width: screenWidth * 0.7,
                  child: Image.asset(
                    "asset/image/logo.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 199),
                  child: Fontinter(
                    text: 'Sign up',
                    textsize: 35,
                    fontweight: FontWeight.w600,
                    color: Colors.black,
                    checkunderline: false,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(right: 100),
                  child: Fontinter(
                    text: "use your email and password",
                    textsize: 18,
                    fontweight: FontWeight.w400,
                    color: Color(0xffA5AFA8),
                    checkunderline: false,
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  text: 'Frist name',
                  iconData: Icons.person_outline,
                  fontweight: FontWeight.w400,
                  textsize: 14,
                  hidden: false,
                  iconcolor: Color(0xff325A3E),
                  textcontroller: fristname,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  text: 'Email',
                  iconData: Icons.email,
                  fontweight: FontWeight.w400,
                  textsize: 14,
                  hidden: false,
                  iconcolor: Color(0xff325A3E),
                  textcontroller: email,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  text: 'Password',
                  iconData: Icons.lock_outline,
                  fontweight: FontWeight.w400,
                  textsize: 14,
                  hidden: true, // Set to true for password fields
                  iconcolor: Color(0xff325A3E),
                  textcontroller: password,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  text: 'Confrom Password',
                  iconData: Icons.lock_outline,
                  fontweight: FontWeight.w400,
                  textsize: 14,
                  hidden: true, // Set to true for password fields
                  iconcolor: Color(0xff325A3E),
                  textcontroller: confrompassword,
                ),
                SizedBox(height: 25),
                CustomButton(
                  text: 'Sign Up', // Changed to "Sign Up"
                  textsize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

                  event: () {

                    AccountProcess.Auth(
                      password: password.text,
                      confirmpassword: confrompassword.text,
                      email: email.text,
                      context: context, firstname: fristname.text,
                    );

                  },
                ),
                SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Fontinter(
                      text: "have already an account ",
                        textsize: 16,
                      color: Color(0xff999999),
                      fontweight: FontWeight.normal,
                      checkunderline: false,
                    ),
                    InkWell(
                      child: Fontinter(
                        text: "Log In",
                        textsize: 12,
                        color: Color(0xff325A3E),
                        fontweight: FontWeight.normal,
                        checkunderline: true,
                      ),
                      onTap: () {
                        Navigations.signintohome(context);
                      },
                    )
                  ],
                ),
                SizedBox(height: 10),
                MessageText(),
              ],
            );
          },
        ),
      ),
    );
  }
}
