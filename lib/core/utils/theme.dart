import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/core/utils/strings.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        // primarySwatch: AppColors.getLightMaterialColor(),
        fontFamily: AppFonts.segoe,
        colorScheme: const ColorScheme.light(primary: Colors.white),
        useMaterial3: true,
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primaryColor,
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 16.sp,
              color: AppColors.titleLarge,
              fontWeight: FontWeight.w700),
        ),
        tabBarTheme: const TabBarTheme(indicatorColor: AppColors.primaryColor),
        textTheme: TextTheme(
            titleLarge: TextStyle(
                fontSize: 30.sp,
                color: AppColors.titleLarge,
                fontWeight: FontWeight.w700),
            titleMedium: TextStyle(
                fontSize: 16.sp,
                color: AppColors.titleMedium,
                fontWeight: FontWeight.w700),
            /// for hint
            titleSmall: TextStyle(
              fontSize: 16.sp,
              color: AppColors.titleSmall,
              fontWeight: FontWeight.w600,
            ),
            /// for text button
            bodySmall: TextStyle(
              fontSize: 14.sp,
              color: AppColors.bodySmall,
              fontWeight: FontWeight.w400,
            ),
            bodyMedium: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.bodyMedium,
            ),
            labelSmall: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.labelSmall,
            ),
            labelMedium: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.labelMedium,
            ),
            displayMedium: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.displayMedium,
                fontFamily: AppFonts.segoe)),
        textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
        )),
        focusColor: AppColors.primaryColor,
        indicatorColor: AppColors.primaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(AppColors.buttonColor),
          padding: const MaterialStatePropertyAll(
              EdgeInsetsDirectional.symmetric(vertical: 10)),
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r))),
          enableFeedback: true,
          textStyle: MaterialStatePropertyAll(TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: AppFonts.segoe)),
          // textStyle: ,
        )),
        cardColor: AppColors.secondaryColor,
        hintColor: AppColors.hintColor,
        primaryColorLight: AppColors.primaryColor,
        primaryColorDark: Colors.black,
      );
}
