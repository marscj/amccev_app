import 'package:app/app/modules/booking/controllers/booking_controller.dart';
import 'package:app/app/modules/home/controllers/home_controller.dart';
import 'package:app/app/modules/my/controllers/my_controller.dart';
import 'package:app/app/modules/news/controllers/news_controller.dart';
import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<BookingController>(
      () => BookingController(),
    );

    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
    Get.lazyPut<MyController>(
      () => MyController(),
    );
  }
}
