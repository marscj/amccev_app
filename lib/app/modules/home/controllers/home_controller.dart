import 'package:app/app/common/widgets/pull_to_refresh.dart';
import 'package:app/app/modules/news/controllers/news_controller.dart';
import 'package:app/app/modules/root/controllers/root_controller.dart';
import 'package:app/package/wp/wordpress_api.dart';
import 'package:get/get.dart';

class HomeController extends RefreshBaseController<Post>
    with NewsAPIController {
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
  Future<List<Post>> onFetch() {
    return fetchNews(page: page, per_page: pageSize).then((value) {
      pageTotal = value.meta?.totalPages;
      return value.data;
    });
  }
}
