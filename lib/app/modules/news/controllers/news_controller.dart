import 'package:app/app/common/widgets/refresh.dart';
import 'package:app/package/wp/wordpress_api.dart';

class NewsController extends SmartRefreshController<List<Post>> {
  final WordPressAPI api = WordPressAPI('amccev.com/wp-json');

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  Future<List<Post>> onFetch() {
    return api.posts.fetch(args: {
      'format': 'standard',
      'status': 'publish',
      'page': page,
      'per_page': pageSize,
    }).then((value) {
      pageTotal = value.meta?.totalPages;
      return value.data;
    });
  }
}
