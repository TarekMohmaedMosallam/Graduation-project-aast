import 'package:flutter/material.dart';
import '../../data/models/Imagetest.dart';
import '../manager/crop_details_compontes.dart';

class Crop_details extends StatelessWidget {
  final Imagetest imagetest;

  Crop_details({super.key, required this.imagetest});

  @override
  Widget build(BuildContext context) {
    return ShowCropdetials(imagetest: imagetest,);
  }
}
