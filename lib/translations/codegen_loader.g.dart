// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "my_gallery": "My \nGallery",
  "login": "LOG IN",
  "login_success": "Login Successfully",
  "user_name": "User Name",
  "password": "Password",
  "submit": "SUBMIT",
  "enter_your_user_name": "Enter your user name",
  "enter_your_password": "Enter your password",
  "logout": "Logout",
  "upload": "Upload",
  "camera": "Camera",
  "gallery": "Gallery",
  "welcome": "Welcome",
  "image_uploaded_success": "Image Uploaded Successfully"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
