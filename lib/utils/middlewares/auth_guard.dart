import 'package:app/app/routes/app_pages.dart';
import 'package:app/services/auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthGuard extends GetMiddleware {
  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.hasToken
        ? null
        : const RouteSettings(name: Routes.SIGNIN);
  }
}
