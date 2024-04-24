import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/features/gallery/widgets/loading_image_widget.dart';

class LoadingGrid extends StatelessWidget {
  const LoadingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.w,
        childAspectRatio: 1,
      ),
      itemCount: 15,
      itemBuilder: (context, index) => const LoadingImageWidget(),
    );
  }
}
