import 'package:app/services/location_service.dart';
import 'package:app/common/persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PersistentTabController? persistentTabController =
      PersistentTabController();

  // final LocationService locationService = Get.find<LocationService>();

  @override
  void onInit() {
    super.onInit();
  }

  void fetchLocation() async {
    // var posion = await locationService.determinePosition();
    // print(posion);
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
