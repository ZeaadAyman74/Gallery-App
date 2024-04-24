import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSourceButton extends StatelessWidget {
  const ImageSourceButton(
      {super.key,
      required this.title,
      required this.color,
      required this.imagePath,
      required this.onPress});

  final Color color;
  final String imagePath;
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20.r)),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 40.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 27.sp, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
