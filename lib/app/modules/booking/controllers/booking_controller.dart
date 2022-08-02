import 'package:app/common/widgets/pull_to_refresh.dart';
import 'package:get/get.dart';

class BookingController extends GetxController with RefreshMixin {
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
    refreshController.loadComplete();
  }

  @override
  void onRefresh() {
    refreshController.refreshCompleted();
  }
}
