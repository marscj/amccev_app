import 'package:app/app/common/widgets/pull_to_refresh.dart';
import 'package:app/package/wp/wordpress_api.dart';
import 'package:get/get.dart';

class NewsApiController extends GetxController with StateMixin<List<Post>> {
  final WordPressAPI api = WordPressAPI('amccev.com/wp-json');

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<Post>> fetchNews({int page = 1, int? per_page}) {
    return api.posts.fetch(args: {
      'format': 'standard',
      'status': 'publish',
      'page': page,
      'per_page': per_page ?? 20,
    }).then((value) {
      return value.data;
    });
  }
}

class NewsController extends GetxController with SmartRefreshController {
  final NewsApiController newsApiController = NewsApiController();

  @override
  void onRefresh() {
    refreshController.loadComplete();
  }

  @override
  void onLoading() {
    refreshController.refreshCompleted();
    if (hasMore) {
      refreshController.loadNoData();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
