import 'package:app/app/common/widgets/refresh.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyController extends SmartRefreshController {
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

  @override
  Future onFetch() {
    // TODO: implement onFetch
    throw UnimplementedError();
  }
}
