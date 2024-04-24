import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/core/utils/colors.dart';
import 'package:my_gallery/core/utils/images.dart';
import 'package:my_gallery/features/gallery/widgets/image_source_button.dart';
import 'package:my_gallery/features/login/widgets/glass_container.dart';
import 'package:my_gallery/translations/locale_keys.g.dart';

class ImageSourceDialog extends StatelessWidget {
  const ImageSourceDialog(
      {super.key, required this.pickFromCamera, required this.pickFromGallery});

  final VoidCallback pickFromGallery;
  final VoidCallback pickFromCamera;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 2,
      backgroundColor: Colors.transparent,
      child: GlassContainer(
          radius: 30.r,
          borderColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageSourceButton(
                  title: LocaleKeys.gallery.tr(),
                  color: AppColors.primaryColor,
                  imagePath: AppImages.gallery,
                  onPress: pickFromGallery,
                ),
                SizedBox(
                  height: 30.h,
                ),
                ImageSourceButton(
                  title: LocaleKeys.camera.tr(),
                  color: AppColors.secondaryColor,
                  imagePath: AppImages.camera,
                  onPress: pickFromCamera,
                ),
              ],
            ),
          )),
    );
  }
}
