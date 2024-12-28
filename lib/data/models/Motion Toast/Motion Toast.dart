import 'package:motion_toast/motion_toast.dart';
import 'package:flutter/material.dart';
import '../../../final_project/data/models/Warning Message.dart';

class Motiontoast {
  static void showWarnings({
    required BuildContext context,
    required double measurement,
    required Function(WarningMessage) saveWarning,
  }) {
    WarningMessage? message;
    if (measurement >= 100) {
      message = WarningMessage("Warning ⚠", "Soil temperature degree rate raised more than normal");
    } else if (measurement <= 50) {
      message = WarningMessage("Warning ⚠", "Soil moisture degree rate less than normal");
    } else {
      message = WarningMessage("Warning ⚠", "Soil temperature degree rate less than normal");
    }
    MotionToast.warning(
      title: Text(message.warningMessage.toString()),
      description: Text(message.warningMessageBody.toString()),
      toastDuration: Duration(seconds: 4),
    ).show(context);

    saveWarning(message);
    }
}
