import 'package:flutter/material.dart';
import 'dart:math' as math;

class SemicircleDownward extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    paint.color = const Color(0xffDADAE5);

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      -math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
