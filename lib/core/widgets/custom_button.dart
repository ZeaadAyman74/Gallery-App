import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    required this.width,
    this.height,
    this.buttonStyle,
    required this.onPress,
  });
  final Widget child;
  final double width;
  final double? height;
  final ButtonStyle? buttonStyle;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height?? 50.h,
      width: width,
      child: ElevatedButton(
        onPressed: onPress,
        style:buttonStyle?? Theme.of(context).elevatedButtonTheme.style,
        child: child,
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText({super.key, required this.title,this.textStyle });
  final String title;
final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:textStyle?? TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500),
    );
  }
}
