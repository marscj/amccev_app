import 'package:app/app/routes/app_pages.dart';
import 'package:app/services/auth_service.dart';
import 'package:get/get.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    // you can do whatever you want here
    // but it's preferable to make this method fast
    // await Future.delayed(Duration(milliseconds: 500));

    if (!AuthService.instance.isLoggedInValue) {
      final newRoute = Routes.LOGIN_THEN(route.location!);
      return GetNavConfig.fromRoute(newRoute);
    }
    return await super.redirectDelegate(route);
  }
}

class EnsureNotAuthedMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    if (AuthService.instance.isLoggedInValue) {
      //NEVER navigate to auth screen, when user is already authed
      return null;

      //OR redirect user to another screen
      //return GetNavConfig.fromRoute(Routes.PROFILE);
    }
    return await super.redirectDelegate(route);
  }
}
