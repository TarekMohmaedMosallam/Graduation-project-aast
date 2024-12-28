import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../presentation/manager/Homepage_compontes.dart';
class ClickEvent {
  static String signup({required String username, required String Password}) {
    if (username == "tarek" || Password == "1234") {
      print( "Weclome");
    }
    else{
      print("Cant sign up");
    }
    return "";
  }
  static Future<void> openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              ImageCapturePage(imageFile: File(pickedFile.path)),
        ),
      );
    } else {
      print('No image selected.');
    }
  }
}
