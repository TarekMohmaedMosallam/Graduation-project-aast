import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/use_cases/Navigatation.dart';
import '../../domain/use_cases/account process.dart';
import '../manager/compoents.dart';
import 'forget_pw_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _hidden = true; // Use meaningful variable name
  late IconData _suffixIcon;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset:
        false, // This line prevents resizing to avoid the on-screen keyboard
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var localwidth = constraints.maxWidth;
            var localhight = constraints.maxWidth;

            return SingleChildScrollView(
              child: Container(
                child: SafeArea(
                  child: Container(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: screenWidth * 0.9,
                          child: Image.asset(
                            "asset/image/logo.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 250),
                          child: Fontinter(
                            text: 'Sign in',
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
                          text: 'Email',
                          iconData: Icons.email,
                          fontweight: FontWeight.w400,
                          textsize: 14,
                          hidden: false,
                          iconcolor: Color(0xff325A3E),
                          textcontroller: emailController,
                        ),
                        SizedBox(height: 20),
                        Padding(padding: EdgeInsets.only(bottom: 10)),
                        CustomTextField(
                          text: 'Password',
                          iconData: Icons.lock_outline,
                          fontweight: FontWeight.w400,
                          textsize: 14,
                          hidden: true, // Set to true for password fields
                          iconcolor: Color(0xff325A3E),
                          textcontroller: passwordController,
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 200),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Forgetpassword()));
                            },
                            child: Fontinter(
                              text: "forget password?",
                              textsize: 14,
                              fontweight: FontWeight.w400,
                              color: Color.fromARGB(255, 19, 94, 41),
                              checkunderline: false,
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        CustomButton(
                          text: 'Sign in', // Changed to "Sign Up"
                          textsize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          event: () {
                            AccountProcess.loginauth(
                                password: passwordController.text,
                                email: emailController.text,
                                context: context,);

                          },
                        ),
                        SizedBox(height: 20),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Fontinter(
                              text: "Don’t have an account ",
                              textsize: 12,
                              color: Color(0xff999999),
                              fontweight: FontWeight.normal,
                              checkunderline: false,
                            ),
                            InkWell(
                              child: Fontinter(
                                text: "Sign up",
                                textsize: 12,
                                color: Color(0xff325A3E),
                                fontweight: FontWeight.normal,
                                checkunderline: true,
                              ),
                              onTap: () {
                                Navigations.Signup(context);
                              },
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        MessageText(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}