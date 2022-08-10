import 'package:app/package/persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  final PersistentTabController persistentTabController =
      PersistentTabController();

  final index = 0.obs;

  @override
  void onInit() {
    super.onInit();

    persistentTabController.addListener(() {
      index.value = persistentTabController.index;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
