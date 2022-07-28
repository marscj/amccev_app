import 'package:get_storage/get_storage.dart';

class UserStorage {
  static Map<String, dynamic>? get() {
    String? userId = GetStorage().read('userId');
    if (userId != null) {
      var storage = GetStorage(userId);
      return {
        'nickname': storage.read('nickname'),
        'lang': storage.read('lang'),
        'token': storage.read('token'),
      };
    }
    return null;
  }

  static void put(Map<String, dynamic> data) {
    String? userId = data['userId'];
    GetStorage().writeIfNull('userId', userId);

    if (userId != null) {
      var storage = GetStorage(userId);
      storage.writeIfNull('nickname', data['nickname']);
      storage.writeIfNull('lang', data['lang']);
      storage.writeIfNull('token', data['token']);
    }
  }
}
