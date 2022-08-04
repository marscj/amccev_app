import 'package:app/app/common/widgets/pull_to_refresh.dart';
import 'package:app/app/modules/root/controllers/root_controller.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with RefreshMixin {
  final SwiperControl swiperControl = SwiperControl();
  final RootController rootController = Get.find<RootController>();

  final index = 0.obs;

  @override
  void onInit() {
    super.onInit();

    rootController.persistentTabController.addListener(() {
      index.value = rootController.persistentTabController.index;
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
