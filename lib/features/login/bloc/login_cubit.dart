import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gallery/core/cache/cahce_utils.dart';
import 'package:my_gallery/core/injection/di_container.dart';
import 'package:my_gallery/core/network/connection.dart';
import 'package:my_gallery/core/network/dio_helper.dart';
import 'package:my_gallery/core/network/end_points.dart';
import 'package:my_gallery/core/utils/strings.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) =>
      BlocProvider.of<LoginCubit>(context);

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    /// there is a problem with new flutter version
    // if (await sl<InternetStatus>().checkConnectivity()) {
      try {
        final response = await DioHelper.postData(path: EndPoints.login, data: {
          'email': email,
          'password': password,
        });
        if (response.statusCode == 200) {
          await cacheUserData(response.data['user']['name'],
              response.data['user']['id'].toString(), response.data['token']);
          emit(LoginSuccess());
        }
      } catch (error) {
        emit(LoginError('Email or Password are wrong'));
      }
    // } else {
    //   emit(LoginError(AppStrings.checkInternet));
    // }
  }

  Future<void> cacheUserData(String name, String id, String token) async {
    CacheUtils.setUserName(name);
    CacheUtils.setUserId(id);
    CacheUtils.setToken(token);
  }
}
