import 'package:app/app/common/widgets/pull_to_refresh.dart';

class BookingController extends SmartRefreshController {
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
  void onLoading() {}

  @override
  void onRefresh() {}

  @override
  Future onFetch() {
    return Future.sync(() => null);
  }
}
