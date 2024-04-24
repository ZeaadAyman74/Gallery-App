import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/core/utils/app_extensions.dart';
import 'package:my_gallery/core/widgets/custom_button.dart';
import 'package:my_gallery/core/widgets/my_progress.dart';
import 'package:my_gallery/features/login/bloc/login_cubit.dart';
import 'package:my_gallery/features/login/widgets/custom_login_button.dart';
import 'package:my_gallery/features/login/widgets/custom_text_field.dart';
import 'package:my_gallery/features/login/widgets/glass_container.dart';
import 'package:my_gallery/translations/locale_keys.g.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late String email, password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginCubit get cubit => LoginCubit.get(context);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: context.width * .95,
      radius: 30.r,
      borderColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                LocaleKeys.login.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomTextField(
                hint: LocaleKeys.user_name.tr(),
                fillColor: Colors.white,
                onSave: (value) => email = value!.trim(),
                validator: _validateEmail,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                hint: LocaleKeys.password.tr(),
                obSecure: true,
                fillColor: Colors.white,
                onSave: (value) => password = value!.trim(),
                validator: _validatePassword,
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomLoginButton(
                  onPress: _onLoginButtonPressed,
                  child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) => state is LoginLoading
                          ? const MyProgress()
                          : ButtonText(
                              title: LocaleKeys.submit.tr(),
                            )))
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginButtonPressed() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      cubit.login(email: email, password: password);
    }
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return LocaleKeys.enter_your_user_name.tr();
    } else {
      return null;
    }
  }

  String? _validatePassword(value) {
    if (value!.isEmpty) {
      return LocaleKeys.enter_your_password.tr();
    } else {
      return null;
    }
  }
}
