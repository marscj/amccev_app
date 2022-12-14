import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get instance => Get.find();

  final isLoggedIn = false.obs;

  bool get isLoggedInValue => isLoggedIn.value;

  void login() {
    isLoggedIn.value = true;
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
