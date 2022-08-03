import 'package:app/common/persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:app/common/widgets/pull_to_refresh.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with RefreshMixin {
  final PersistentTabController? persistentTabController =
      PersistentTabController();

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
