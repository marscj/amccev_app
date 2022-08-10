import 'package:app/app/common/widgets/refresh.dart';

class MessageController extends SmartRefreshController {
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
