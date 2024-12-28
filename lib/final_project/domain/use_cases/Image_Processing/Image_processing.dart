import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickers {
  static Future<File?> ImageGallery() async {
    XFile? xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (xFile != null) {
      return File(xFile.path);
    }
    return null;
  }
  static Future<File?> ImageCamera() async {
    XFile? xFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (xFile != null) {
      return File(xFile.path);
    }
    return null;
  }

}
