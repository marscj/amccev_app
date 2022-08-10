import 'package:app/app/common/widgets/pull_to_refresh.dart';
import 'package:app/package/wp/wordpress_api.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NewsAPIController {
  final WordPressAPI api = WordPressAPI('amccev.com/wp-json');

  Future<WPResponse> fetchNews({int page = 1, int? per_page}) {
    return api.posts.fetch(args: {
      'format': 'standard',
      'status': 'publish',
      'page': page,
      'per_page': per_page ?? 20,
    });
  }
}

class NewsController extends GetxController
    with SmartRefreshController, NewsAPIController, StateMixin<List<Post>> {
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
