import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton(
      {super.key, required this.onPress, required this.child});

  final VoidCallback onPress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: ElevatedButton(
          onPressed: onPress,
          style: Theme.of(context).elevatedButtonTheme.style,
          child: child),
    );
  }
}

class ButtonTitle extends StatelessWidget {
  const ButtonTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // style: TextStyle(
      //   fontSize: 18.sp,
      //   fontWeight: FontWeight.bold,
      //   color: Colors.white,
      //   fontFamily: AppFonts.segoe),
    );
  }
}
