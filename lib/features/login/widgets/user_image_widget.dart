import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/core/cache/cahce_utils.dart';
import 'package:my_gallery/core/utils/app_extensions.dart';
import 'package:my_gallery/core/utils/strings.dart';
import 'package:my_gallery/features/login/widgets/background_clipper.dart';
import 'package:my_gallery/translations/locale_keys.g.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 15.w,top: 15.h),
            child: Text(
              "${LocaleKeys.welcome.tr()} ${CacheUtils.getUserName()!}",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ),
        ClipPath(
          clipper: MyClipper(circleRadius: 100),
          child: Container(
            padding: EdgeInsetsDirectional.only(
                top: context.height * .04,
                end: context.width * .04,

            ),
            alignment: Alignment.topRight,
            width: context.width * .55,
            height: context.height * .22,
            decoration: const BoxDecoration(
              color: Color(0xffDDCDFF),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35.w),
              child: CachedNetworkImage(
                imageUrl: AppStrings.image,
                height: 70.w,
                width: 70.w,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                fadeInDuration: const Duration(milliseconds: 500),
                fadeInCurve: Curves.easeInOut,
                errorWidget: (context, url, error) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.error_outline,
                    color: Colors.black,
                  ),
                ),
                placeholder: (context, url) => Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
