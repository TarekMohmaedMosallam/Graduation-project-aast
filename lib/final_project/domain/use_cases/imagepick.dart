import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../../presentation/pages/Alert/Alert.dart';

class ImagePicks {
  static Future<dynamic> pickImages(BuildContext context) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    return AlertType.warningAlert(alertBody: "No Image selected", alertType: "Error", context: context);
  }
}
