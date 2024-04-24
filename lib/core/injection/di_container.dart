import 'package:get_it/get_it.dart';
import 'package:my_gallery/core/network/error_model.dart';
import 'package:my_gallery/core/routing/router.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // Connectivity
    // sl.registerLazySingleton<InternetStatus>(() => InternetStatus(sl()));
    // sl.registerLazySingleton<Connectivity>(() => Connectivity());

    // Utils
    sl.registerLazySingleton<AppRouter>(() => AppRouter(),);

    //Error Handling
    sl.registerLazySingleton<ErrorModel>(() => const ErrorModel());
  }
}
