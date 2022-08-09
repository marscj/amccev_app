import 'package:app/app/common/widgets/pull_to_refresh.dart';

class MyController extends RefreshBaseController {
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
