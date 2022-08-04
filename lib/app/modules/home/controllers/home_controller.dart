import 'package:app/app/common/widgets/pull_to_refresh.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with RefreshMixin {
  final SwiperControl swiperControl = SwiperControl();

  final times = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    repat();
  }

  void repat() async {
    Future.delayed(Duration(seconds: 4), () {
      times.value++;
      repat();
    });
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
