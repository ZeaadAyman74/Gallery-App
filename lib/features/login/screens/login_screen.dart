import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/core/routing/routes.dart';
import 'package:my_gallery/core/utils/app_extensions.dart';
import 'package:my_gallery/core/utils/app_functions.dart';
import 'package:my_gallery/core/utils/enums.dart';
import 'package:my_gallery/core/utils/images.dart';
import 'package:my_gallery/features/login/bloc/login_cubit.dart';
import 'package:my_gallery/features/login/widgets/custom_gradient_painter.dart';
import 'package:my_gallery/features/login/widgets/login_background.dart';
import 'package:my_gallery/features/login/widgets/login_form.dart';
import 'package:my_gallery/translations/locale_keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: _blocListener,
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: context.width,
            height: context.height,
            child: CustomPaint(
              painter: CustomGradientPainter(),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          AppImages.lovePicture,
                          height: 80,
                          width: 80,
                        )),
                    Text(
                        LocaleKeys.my_gallery.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 50.sp),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    const Stack(
                      children: [LoginBackground(), LoginForm()],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _blocListener(BuildContext context,LoginState state){
    if (state is LoginSuccess) {
      context.pushAndRemove(Routes.gallery);
      AppFunctions.showToast(message: LocaleKeys.login_success.tr(), state: ToastStates.success);
    } else if (state is LoginError) {
      AppFunctions.showToast(
          message: state.error, state: ToastStates.error);
    }
  }
}
