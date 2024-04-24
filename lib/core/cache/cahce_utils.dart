import 'package:my_gallery/core/cache/cache_helper.dart';
import 'package:my_gallery/core/cache/cache_keys.dart';

class CacheUtils {
  static Future<void>setToken(String token)async{
  await  CacheHelper.putData(key: CacheKeys.token, value: token);
  }

  static String? getToken(){
    return CacheHelper.getData(key: CacheKeys.token);
  }
  static Future<void>deleteToken()async{
    await CacheHelper.removeValue(key: CacheKeys.token);
  }
  static Future<void>setUserId(String userId)async{
    await  CacheHelper.putData(key: CacheKeys.userId, value: userId);
  }
  static String? getUserId(){
    return CacheHelper.getData(key: CacheKeys.userId);
  }
  static Future<void>deleteUserId()async{
    await CacheHelper.removeValue(key: CacheKeys.userId);
  }
  static Future<void>setUserName(String userName)async{
    await  CacheHelper.putData(key: CacheKeys.userName, value: userName);
  }
  static String? getUserName(){
    return CacheHelper.getData(key: CacheKeys.userName);
  }
  static Future<void>deleteUserName()async{
    await CacheHelper.removeValue(key: CacheKeys.userName);
  }
  static bool isLoggedIn(){
   return CacheHelper.getData(key: CacheKeys.userName)==null?false:true;
  }

}