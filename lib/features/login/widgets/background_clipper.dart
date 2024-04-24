import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyClipper extends CustomClipper<Path> {
  final double circleRadius;

  MyClipper({
    required this.circleRadius,
  });

  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    double radius=40.r;

    path.moveTo(width, 0);
    path.lineTo(width ,height);
    path.quadraticBezierTo(width,height-radius, width-radius, height-radius);

    path.quadraticBezierTo(circleRadius,height-radius, circleRadius, height-circleRadius);

    path.quadraticBezierTo(circleRadius,0, 0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ClipShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ClipShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
