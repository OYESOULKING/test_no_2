import 'dart:math';

import 'package:flutter/material.dart';

class MyCustomPainterNo1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    // Radiuses
    final faceRadius = min(width, height) / 2;
    final eyesRadius = faceRadius * 0.4;

    final center = Offset(width / 2, height / 2);

    final eyeDisplacementValue = faceRadius * 0.4;
    final eyeBallDisplacementValue = eyeDisplacementValue * 0.85;
    final mouthDisplacementValue = faceRadius * 0.3;
    final blashDiplacementValue = faceRadius * 0.5;

    // Left Side Centers
    final centerOfLeftEye = Offset(center.dx - eyeDisplacementValue, center.dy - eyeDisplacementValue);
    final centerOfLeftEyeBall = Offset(center.dx - eyeDisplacementValue, center.dy - eyeBallDisplacementValue);
    final centerOfLeftBlush = Offset(center.dx - blashDiplacementValue, center.dy);

    // Right Side Centers
    final centerOfRightEye = Offset(center.dx + eyeDisplacementValue, center.dy - eyeDisplacementValue);
    final centerOfRightEyeBall = Offset(center.dx + eyeDisplacementValue, center.dy - eyeBallDisplacementValue);
    final centerOfRightBlush = Offset(center.dx + blashDiplacementValue, center.dy);

    // Center Of Mouth
    final centerOfMouth = Offset(center.dx, center.dy + faceRadius * 0.2);

    // Paints
    final facePaint = Paint()..color = Colors.amber;
    final eyesPaint = Paint()..color = Colors.white;
    final blushPaint = Paint()..color = const Color.fromARGB(176, 229, 115, 115);
    final eyesBallPaint = Paint()..color = Colors.black;
    final mouthPaint = Paint()..color = Colors.black;

    // Draw Face
    canvas.drawCircle(center, faceRadius, facePaint);

    // Draw Left Eye
    canvas.drawOval(Rect.fromCenter(center: centerOfLeftEye, width: eyesRadius, height: eyesRadius * 0.7), eyesPaint);
    canvas.drawOval(Rect.fromCenter(center: centerOfLeftEyeBall, width: eyesRadius * 0.5, height: eyesRadius * 0.4), eyesBallPaint);
    canvas.drawOval(Rect.fromCenter(center: centerOfLeftEyeBall, width: eyesRadius * 0.15, height: eyesRadius * 0.15), eyesPaint);

    // Draw Left Blush
    canvas.drawOval(Rect.fromCenter(center: centerOfLeftBlush, width: eyesRadius * 0.75, height: eyesRadius * 0.6), blushPaint);

    // Draw Right Eye
    canvas.drawOval(Rect.fromCenter(center: centerOfRightEye, width: eyesRadius, height: eyesRadius * 0.7), eyesPaint);
    canvas.drawOval(Rect.fromCenter(center: centerOfRightEyeBall, width: eyesRadius * 0.5, height: eyesRadius * 0.4), eyesBallPaint);
    canvas.drawOval(Rect.fromCenter(center: centerOfRightEyeBall, width: eyesRadius * 0.15, height: eyesRadius * 0.15), eyesPaint);

    // Draw Right Blush
    canvas.drawOval(Rect.fromCenter(center: centerOfRightBlush, width: eyesRadius * 0.75, height: eyesRadius * 0.6), blushPaint);

    // Draw Mouth
    Path path = Path();
    path.moveTo(centerOfMouth.dx - mouthDisplacementValue, centerOfMouth.dy);
    path.quadraticBezierTo(centerOfMouth.dx, centerOfMouth.dy + mouthDisplacementValue, centerOfMouth.dx + mouthDisplacementValue, centerOfMouth.dy);
    path.close();
    canvas.drawPath(path, mouthPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
