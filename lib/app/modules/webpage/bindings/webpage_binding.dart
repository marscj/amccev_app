import 'package:get/get.dart';

import '../controllers/webpage_controller.dart';

class WebpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebpageController>(
      () => WebpageController(),
    );
  }
}
