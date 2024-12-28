import 'package:flutter/material.dart';

class AlertType {
  static void warningAlert({
    required String alertBody,
    required String alertType,
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Close"),
          ),
        ],
        title: Text(alertType),
        contentPadding: const EdgeInsets.all(8),
        content: Text(alertBody),
      ),
    );
  }


}