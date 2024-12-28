import 'package:flutter/material.dart';

import '../manager/Smart_IrrigationState_componments.dart';

class SmartIrrigation extends StatefulWidget {
  SmartIrrigation({super.key});

  @override
  State<SmartIrrigation> createState() => SmartIrrigationState();
}

class SmartIrrigationState extends State<SmartIrrigation> {
  @override
  Widget build(BuildContext context) {

    return SmartIrrigationComponents  ();
  }
}
