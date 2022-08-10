import 'package:app/app/common/widgets/pull_to_refresh.dart';
import 'package:app/package/wp/wordpress_api.dart';

class NewsController extends SmartRefreshController {
  final WordPressAPI api = WordPressAPI('amccev.com/wp-json');

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

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  Future onFetch() {
    // TODO: implement onFetch
    throw UnimplementedError();
  }
}
