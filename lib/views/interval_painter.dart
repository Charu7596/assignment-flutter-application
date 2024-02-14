import 'dart:math';

import 'package:flutter/material.dart';

class IntervalPainter extends CustomPainter {
  final int availableSlot;
  final int index;

  IntervalPainter({required this.availableSlot, required this.index});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final double center = size.width / 2;
    final double radius = center - paint.strokeWidth / 2 - 5;
    final Rect rect = Rect.fromCircle(center: Offset(center, center), radius: radius);

    canvas.drawCircle(Offset(center, center), center - paint.strokeWidth / 2, paint);

    if (availableSlot > 0 && availableSlot <= 4) {
      final double sweepAngle = (pi * availableSlot / 2);
      
      final double startAngle = -pi / 2 + (pi * availableSlot / 4 - pi / 4);
      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
