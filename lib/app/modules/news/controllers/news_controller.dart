import 'package:app/app/common/widgets/pull_to_refresh.dart';
import 'package:app/package/wp/wordpress_api.dart';
import 'package:get/get.dart';

class NewsController extends GetxController with RefreshMixin {
  final WordPressAPI api = WordPressAPI('mecloudlab.com');

  final _page_num = 1.obs;
  get page_num => this._page_num.value;
  set page_num(value) => this._page_num.value = value;

  final _meta = WPMeta(totalPages: 1).obs;
  get meta => this._meta.value;
  set meta(value) => this._meta.value = value;

  final Rx<List<Post>> _posts = Rx<List<Post>>([]);
  get posts => this._posts.value;
  set posts(value) => this._posts.value = value;

  Future<List<Post>> fetchPost({int? page, int? per_page}) {
    return api.posts
        .fetch(
            args: {
      '_embed': '',
      'format': 'standard',
      'status': 'publish',
      'page': page ?? 1,
      'per_page': per_page ?? 20,
      'lang': Get.locale?.languageCode ?? 'zh',
    }..removeWhere((key, value) => value == null))
        .then((value) {
      meta = value.meta;

      return value.data;
    });
  }

  void onRefresh() {
    fetchPost().then((data) {
      posts = data;
      page_num = 1;
    }).whenComplete(() {
      refreshController.resetNoData();
      refreshController.refreshCompleted();
    });
  }

  void onLoading() {
    if (page_num < meta.totalPages) {
      fetchPost(page: ++page_num).then((data) {
        posts?.addAll(data);

        //去重
        var ids = posts!.map((e) => e.id).toSet();
        posts!.retainWhere((x) => ids.remove(x.id));

        refresh();
      }).whenComplete(() {
        refreshController.loadComplete();
      });
    } else {
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
