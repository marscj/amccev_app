import 'package:app/app/common/widgets/refresh.dart';
import 'package:app/app/modules/root/controllers/root_controller.dart';

import 'package:get/get.dart';

class HomeController extends SmartRefreshController {
  final RootController rootController = Get.find<RootController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onLoading() {}

  @override
  void onRefresh() {}

  @override
  Future onFetch() {
    return Future.sync(() => null);
  }
}
