import 'package:app/common/persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:app/services/location_service.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  final PersistentTabController? persistentTabController =
      PersistentTabController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetchLocation();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchLocation() async {
    var positon = await LocationService().determinePosition();
    print(positon);
  }
}
