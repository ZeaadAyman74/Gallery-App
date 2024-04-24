import 'dart:ui';
import 'package:flutter/material.dart';

class CustomGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.black;
    canvas.drawVertices(
        Vertices(VertexMode.triangleFan, [
          Offset.zero,
          Offset(size.width, 0),
          Offset(size.width, size.height),
          Offset(0, size.height),
        ],colors: [
          const Color(0xffEA94D7),
          const Color(0xffC5AAFE),
          Colors.white,
          const Color(0xffFFDADA),
        ]),
        BlendMode.src,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
