import 'package:flutter/material.dart';

/// All name colors according to https://chir.ag/projects/name-that-color
class AppColors {
  const AppColors();

static const _moonRaker=Color(0xffEFD8F9);
static  const _solitude=Color(0xffEBF6FF);
static const _tundora=Color(0xff4A4A4A);
static const _malibu=Color(0xff7BB3FF);


  /// text colors
  static const titleLarge = _tundora;
  static Color titleMedium = _tundora;
  static Color titleSmall = _tundora;
  static const bodySmall = _tundora;
  static const bodyMedium = _tundora;
  static Color labelSmall = _tundora;
  static Color labelMedium = _tundora;
  static Color displayMedium = _tundora;


  /// material color
  static MaterialColor getLightMaterialColor() {
    return MaterialColor(const Color(0xffEFD8F9).value, const <int, Color>{
      50: _moonRaker,
      100: _moonRaker,
      200: _moonRaker,
      300: _moonRaker,
      400: _moonRaker,
      500: _moonRaker,
      600: _moonRaker,
      700: _moonRaker,
      800: _moonRaker,
      900: _moonRaker,
    });
  }


  static const primaryColor=_moonRaker;
  static const secondaryColor=_solitude;
  static Color hintColor=_tundora;
  static const buttonColor=_malibu;
}
