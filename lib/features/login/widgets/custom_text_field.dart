import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/core/utils/colors.dart';
import 'package:my_gallery/core/utils/strings.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
        required this.hint,
        this.fillColor,
        this.controller,
        this.onSave,
        this.validator,
        this.autoFills,
        this.maxLines = 1,
        this.inputType,
        this.prefixIcon,
        this.obSecure = false});
  final String hint;
  final Color? fillColor;
  final int? maxLines;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final bool obSecure;
  final void Function(String?)? onSave;
  final String? Function(String?)? validator;
  final Iterable<String>? autoFills;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Theme.of(context).indicatorColor,
      keyboardType: inputType ?? TextInputType.text,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          filled: true,
          fillColor: Theme.of(context).cardColor,
          border: _border(),
          enabledBorder: _border(),
          focusedBorder: _border(),
          disabledBorder: _border(),
          prefixIcon: prefixIcon,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontFamily: AppFonts.segoe,
            color: AppColors.titleLarge,
          )),
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 16.sp, fontWeight: FontWeight.w600, letterSpacing: .8),
      onSaved: onSave,
      validator: validator,
      autofillHints: autoFills,
    );
  }
  OutlineInputBorder _border() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(22)),
        borderSide: BorderSide(color: Colors.transparent));
  }
}

