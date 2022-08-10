import 'package:app/app/common/widgets/pull_to_refresh.dart';
import 'package:app/app/modules/news/controllers/news_controller.dart';
import 'package:app/app/modules/root/controllers/root_controller.dart';

import 'package:get/get.dart';

class HomeController extends SmartRefreshController {
  final RootController rootController = Get.find<RootController>();
  final NewsController newsController = NewsController();

  final index = 0.obs;

  @override
  void onInit() {
    super.onInit();

    rootController.persistentTabController.addListener(() {
      index.value = rootController.persistentTabController.index;
    });

    newsController.append(() => newsController.fetchNews);
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
    // TODO: implement onFetch
    throw UnimplementedError();
  }
}
