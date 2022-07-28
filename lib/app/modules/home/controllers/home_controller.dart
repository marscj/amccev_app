import 'package:app/common/persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  late PersistentTabController persistentTabController;

  @override
  void onInit() {
    super.onInit();

    persistentTabController = PersistentTabController();
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
