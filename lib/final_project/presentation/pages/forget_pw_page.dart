import 'package:final_project_gd/final_project/presentation/pages/Login_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import '../../domain/use_cases/account_process.dart';
import '../manager/compoents.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({Key? key}) : super(key: key);

  @override
  State<Forgetpassword> createState() => ForgetpasswordState();
}

class ForgetpasswordState extends State<Forgetpassword> {
  bool _hidden = true;
  late IconData _suffixIcon;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password reset link sent. Check your email.'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
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
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Container(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * 0.9,
                      child: Image.asset(
                        "asset/image/logo.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Enter your email and we will send you a password reset link',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
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
                    CustomButton(
                      text: 'Reset password', // Changed to "Sign Up"
                      textsize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      event: () {
                        passwordReset();
                      },
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'back to log in', // Changed to "Sign Up"
                      textsize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      event: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
