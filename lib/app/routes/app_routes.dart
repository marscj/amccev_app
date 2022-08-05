part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SIGNIN = _Paths.SIGNIN;
  static const BOOKING = _Paths.BOOKING;
  static const SETTING = _Paths.SETTING;
  static const PROFILE = _Paths.PROFILE;
  static const SHOP = _Paths.SHOP;
  static const CART = _Paths.CART;
  static const MY = _Paths.MY;
  static const NOTICE = _Paths.NOTICE;
  static const MESSAGE = _Paths.MESSAGE;
  static const NEWS = _Paths.NEWS;

  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$SIGNIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static const BOOKING_DETAILS = _Paths.BOOKING + _Paths.BOOKING_DETAILS;
  static const ROOT = _Paths.ROOT;
  static const GETWIDGET = _Paths.GETWIDGET;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SIGNIN = '/signin';
  static const BOOKING = '/booking';
  static const SETTING = '/setting';
  static const PROFILE = '/profile';
  static const SHOP = '/shop';
  static const CART = '/cart';
  static const MY = '/my';
  static const NOTICE = '/notice';
  static const MESSAGE = '/message';
  static const NEWS = '/news';
  static const BOOKING_DETAILS = '/:booking-details';
  static const ROOT = '/root';
  static const GETWIDGET = '/getwidget';
}
