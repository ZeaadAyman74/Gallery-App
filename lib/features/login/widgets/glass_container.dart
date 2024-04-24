import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer(
      {super.key,
      required this.child,
      this.width,
       this.height,
      required this.radius,
      required this.borderColor});

  final double? width;
  final double? height;
  final double radius;
  final Color borderColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          height: height,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.2),
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: borderColor)),
          child: child,
        ),
      ),
    );
  }
}
