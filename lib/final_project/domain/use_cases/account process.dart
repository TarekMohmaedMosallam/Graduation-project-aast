import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../presentation/pages/Alert/Alert.dart';
import 'Navigatation.dart';

class AccountProcess {
  static String? _firstName;

  static void setFirstName(String firstName) {
    _firstName = firstName;
  }

  static void callAuthAndPrintFirstName() {
    if (_firstName != null) {
      print("First name: $_firstName");
    } else {
      print("First name is not set.");
    }
  }

  static void Auth({
    required String firstname,
    required String password,
    required String confirmpassword,
    required String email,
    required BuildContext context,
  }) {
    if (password != confirmpassword) {
      return AlertType.warningAlert(
        alertBody: "Passwords do not match",
        alertType: "wrong",
        context: context,
      );
    }
    if (email.isEmpty) {
      return AlertType.warningAlert(
        alertBody: "Email must not be empty",
        alertType: "wrong",
        context: context,
      );
    } else if (password.isEmpty) {
      return AlertType.warningAlert(
        alertBody: "Password must not be empty",
        alertType: "wrong",
        context: context,
      );
    }

    if (confirmpassword.isEmpty) {
      return AlertType.warningAlert(
        alertBody: "Confirm password must not be empty",
        alertType: "wrong",
        context: context,
      );
    } else if (firstname.isEmpty) {
      return AlertType.warningAlert(
        alertBody: "First name must not be empty",
        alertType: "wrong",
        context: context,
      );
    }

    // Validate first name
    String? firstnameError = validateFirstName(firstname);
    if (firstnameError != null) {
      // Show an error dialog or return an error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid First Name"),
            content: Text(firstnameError),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    // Validate email
    String? emailError = validateEmail(email);
    if (emailError != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid Email"),
            content: Text(emailError),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    // Validate password
    String? passwordError = validatePassword(password);
    if (passwordError != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid Password"),
            content: Text(passwordError),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    // Proceed with the rest of your authentication logic here
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigations.logintohome(context);
    }).catchError((error) {
      print("Error ${error.toString()}");
    });
  }

  static String? validateFirstName(String firstname) {
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegExp.hasMatch(firstname)) {
      return "First name must contain only alphabets and no special characters.";
    }
    return null;
  }

  static String? validateEmail(String email) {
    if (email.contains(' ')) {
      return "Email must not contain spaces.";
    }

    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegExp.hasMatch(email)) {
      return "Enter a valid email address.";
    }

    return null;
  }

  static String? validatePassword(String password) {
    if (password.length < 8) {
      return "Password must be at least 8 characters long.";
    }

    final RegExp passwordRegExp =
    RegExp(r'^[a-zA-Z0-9!@#\$%^&*(),.?":{}|<>]+$');
    if (!passwordRegExp.hasMatch(password)) {
      return "Password contains invalid characters.";
    }

    return null;
  }

  static loginauth({
    required String password,
    required String email,
    required BuildContext context,
  }) {
    if (email.isEmpty || password.isEmpty) {
      return AlertType.warningAlert(
        alertBody: "Email and password must not be empty",
        alertType: "wrong",
        context: context,
      );
    }

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigations.logintohome(context);
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        String errorMessage;
        if (error.code == 'user-not-found' || error.code == 'wrong-password') {
          errorMessage = "Wrong email or password.";
        } else {
          //   errorMessage = "Wrong email or password.";
          errorMessage = " something went wrong .";
        }

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login Error"),
              content: Text(errorMessage),
              actions: <Widget>[
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
      print("Error ${error.toString()}");
    });
  }
}