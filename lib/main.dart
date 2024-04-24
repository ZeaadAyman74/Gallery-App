import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_gallery/core/cache/cache_helper.dart';
import 'package:my_gallery/core/injection/di_container.dart';
import 'package:my_gallery/core/network/dio_helper.dart';
import 'package:my_gallery/core/routing/router.dart';
import 'package:my_gallery/core/routing/routes.dart';
import 'package:my_gallery/core/utils/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  DioHelper.init();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      path: 'assets/translations',
      // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: const MyGalleryApp()));
}

class MyGalleryApp extends StatelessWidget {
  const MyGalleryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Gallery',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.lightTheme(),
        onGenerateRoute: sl<AppRouter>().generateRoute,
        initialRoute: Routes.login,
        navigatorKey: sl<AppRouter>().navigatorKey,
      ),
    );
  }
}
