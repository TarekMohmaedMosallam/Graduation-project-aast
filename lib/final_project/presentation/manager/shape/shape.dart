import 'dart:math';
import 'package:flutter/material.dart';

class SemiCircleProgress extends CustomPainter {
  final double value;
  final bool isTemp;
  final Color col;

  SemiCircleProgress(this.value, this.isTemp, this.col);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {
    int maximumValue = isTemp ? 50 : 100;

    Paint outerCircle = Paint()
      ..strokeWidth = 14
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Paint progressArc = Paint()
      ..strokeWidth = 14
      ..color = col // Use the provided color 'col' for the progress arc
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height);
    double radius = min(size.width / 2, size.height) - 14;

    // Draw the base circle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi,
      false,
      outerCircle,
    );

    // Draw the progress arc
    double angle = pi * (value / maximumValue);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      angle,
      false,
      progressArc,
    );
  }
}
