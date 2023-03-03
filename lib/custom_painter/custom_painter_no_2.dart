import 'dart:math';

import 'package:flutter/material.dart';

class MyCustomPainterNo2 extends CustomPainter {
  final DateTime dateTime;
  MyCustomPainterNo2(this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    final double height = size.height;
    final double width = size.width;
    final double centerHeight = height / 2;
    final double centerWidth = width / 2;
    final Offset center = Offset(centerWidth, centerHeight);

    // Number of Rotations
    const int numberOfRotation = 60;

    // Radiuses
    final radius = min(width, height) / 2;

    // Tickers
    final double secTickersWidth = radius * 0.005;
    final double minTickersWidth = radius * 0.015;
    final double hourTickersWidth = radius * 0.025;

    final Offset minTikerLength = Offset(0, -radius * 0.95 /* Decrese to increse length */);
    final Offset hoursTikerLength = Offset(0, -radius * 0.9 /* Decrese to increse length */);
    // Date
    final double dateFontSize = radius * 0.065;
    final Offset dateOffset = Offset(radius * 0.4, 0);
    final Offset dateRectOffset = Offset(radius * 0.535, radius * 0.03);
    final dateRectSize = Size(radius * 0.3, radius * 0.1);

    // Rotating Angle Of Canvaus
    const angleInRad = (2 * pi) / numberOfRotation;

    // Paints
    final Paint backgroundPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = radius * 0.03
      ..style = PaintingStyle.stroke;
    final Paint minTickPaint = Paint()
      ..color = Colors.black87
      ..strokeWidth = minTickersWidth;
    final Paint hoursTickPaint = Paint()
      ..color = Colors.black87
      ..strokeWidth = hourTickersWidth;
    final Paint hourNeedelPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = hourTickersWidth
      ..strokeCap = StrokeCap.round;
    final Paint minNeedelPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = minTickersWidth
      ..strokeCap = StrokeCap.round;
    final Paint secNeedelPaint = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = secTickersWidth
      ..strokeCap = StrokeCap.round;
    final Paint needelBasePaint = Paint()..color = Colors.redAccent;

    // Draw Background
    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.translate(centerWidth, centerHeight);
    canvas.save();
    int hour = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;

    for (var i = 0; i < numberOfRotation; i++) {
      // Check is Hour
      if (i % 5 == 0) {
        canvas.drawLine(Offset(0, -radius), hoursTikerLength, hoursTickPaint);
      } else {
        canvas.drawLine(Offset(0, -radius), minTikerLength, minTickPaint);
      }
      if (hour == i / 5 && i % 5 == 0) {
        canvas.drawLine(Offset.zero, Offset(0, -radius * 0.65), hourNeedelPaint);
      }
      if (dateTime.minute == i) {
        canvas.drawLine(Offset.zero, Offset(0, -radius * 0.75), minNeedelPaint);
      }
      if (dateTime.second == i) {
        canvas.drawLine(Offset.zero, Offset(0, -radius * 0.85), secNeedelPaint);
      }
      canvas.rotate(angleInRad);
    }
    canvas.restore();

    // Printing DATE
    canvas.drawRect(
        Rect.fromCenter(center: dateRectOffset, height: dateRectSize.height, width: dateRectSize.width),
        Paint()
          ..strokeWidth = radius * 0.005
          ..style = PaintingStyle.stroke);
    final textSpan = TextSpan(
        text: '${dateTime.day}/${dateTime.month}/${dateTime.year}',
        style: TextStyle(color: Colors.black, fontSize: dateFontSize, fontWeight: FontWeight.bold));
    final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: radius);
    textPainter.paint(canvas, dateOffset);

    // Draw Ceneter Needle Base
    canvas.drawCircle(Offset.zero, radius * 0.035, needelBasePaint);
  }

  @override
  bool shouldRepaint(MyCustomPainterNo2 oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MyCustomPainterNo2 oldDelegate) => true;
}
