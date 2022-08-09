import 'package:app/app/common/widgets/pull_to_refresh.dart';

class MessageController extends RefreshBaseController {
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
  Future<List> onFetch() {
    // TODO: implement onFetch
    throw UnimplementedError();
  }
}
