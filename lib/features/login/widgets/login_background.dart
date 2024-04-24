import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/core/utils/app_extensions.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width * .9,
      width: context.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Transform.rotate(
                  angle: 90,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xffEB5757)),
                  ),
                ),
                const Spacer(),
                Stack(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffFFCD62)),
                    ),
                    PositionedDirectional(
                      width: 70,
                      height: 70,
                      top: 30,
                      end: 30,
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                            Colors.white.withOpacity(.4)),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffEB5757)),
            )
          ],
        ),
      ),
    );
  }
}
