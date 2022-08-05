import 'package:get/get.dart';

import '../controllers/getwidget_controller.dart';

class GetwidgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetwidgetController>(
      () => GetwidgetController(),
    );
  }
}
