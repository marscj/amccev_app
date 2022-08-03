import 'package:app/app/modules/home/controllers/home_controller.dart';
import 'package:app/common/widgets/pull_to_refresh.dart';

import 'package:get/get.dart';

class HomepageController extends GetxController with RefreshMixin {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    Get.find<HomeController>().fetchLocation();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }

  @override
  void onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }
}
