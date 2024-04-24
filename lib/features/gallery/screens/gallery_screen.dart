import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery/core/routing/routes.dart';
import 'package:my_gallery/core/utils/app_extensions.dart';
import 'package:my_gallery/core/utils/app_functions.dart';
import 'package:my_gallery/core/utils/app_icons.dart';
import 'package:my_gallery/core/utils/enums.dart';
import 'package:my_gallery/core/widgets/dialog_progress_indicator.dart';
import 'package:my_gallery/features/gallery/bloc/gallery_cubit.dart';
import 'package:my_gallery/features/gallery/widgets/custom_icon_button.dart';
import 'package:my_gallery/features/gallery/widgets/gallery_grid.dart';
import 'package:my_gallery/features/gallery/widgets/image_source_dialog.dart';
import 'package:my_gallery/features/login/widgets/user_image_widget.dart';
import 'package:my_gallery/translations/locale_keys.g.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GalleryCubit, GalleryState>(
      listener: _blocListener,
      child: Scaffold(
        backgroundColor: const Color(0xffDDCDFF),
        body: SafeArea(
          child: Container(
            color: Colors.white.withOpacity(.4),
            child: Column(
              children: [
                const UserInfoWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIconButton(
                      title: LocaleKeys.logout.tr(),
                      icon: AppIcons.logout,
                      iconColor: const Color(0xffC83B3B),
                      onPress:() => _onLogoutPressed(context),
                    ),
                    CustomIconButton(
                      title: LocaleKeys.upload.tr(),
                      icon: AppIcons.upload,
                      iconColor: const Color(0xffFFEB38),
                      onPress: ()=>_onUploadButtonPressed(context),
                    )
                  ],
                ),
                SizedBox(height: 20.h,),
                const Expanded(child: GalleryGrid())
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _blocListener(BuildContext context, GalleryState state) {
    if (state is LogoutLoading) {
      showDialog(
        context: context,
        builder: (context) => const DialogIndicator(),
      );
    } else if (state is LogoutSuccess) {
      context.pushAndRemove(Routes.login);
    } else if (state is UploadImageLoading) {
      context.pop();
      showDialog(
        context: context,
        builder: (context) => const DialogIndicator(),
      );
    } else if (state is UploadImageSuccess) {
      AppFunctions.showToast(message: LocaleKeys.image_uploaded_success.tr(), state: ToastStates.success);
      GalleryCubit.get(context).getMyGallery();
      context.pop();
    }
  }

  void _onLogoutPressed(BuildContext context){
    GalleryCubit.get(context).logout();
  }

  void _onUploadButtonPressed(BuildContext context){
    GalleryCubit cubit = GalleryCubit.get(context);
    showDialog(
      context: context,
      builder: (context) => ImageSourceDialog(
        pickFromCamera: () =>
            cubit.pickImage(ImageSource.camera),
        pickFromGallery: () =>
            cubit.pickImage(ImageSource.gallery),
      ),
    );
  }
}
