import 'package:app/app/common/widgets/pull_to_refresh.dart';
import 'package:app/package/wp/wordpress_api.dart';
import 'package:get/get.dart';

abstract class A extends GetxController {}

class B {}

mixin C {}

class E extends RefreshBaseController with B, C {
  @override
  void onLoading() {
    // TODO: implement onLoading
  }

  @override
  void onRefresh() {
    // TODO: implement onRefresh
  }
}

class NewsAPIController<T> {
  final WordPressAPI api = WordPressAPI('amccev.com/wp-json');

  final _page_num = 1.obs;
  get page_num => this._page_num.value;
  set page_num(value) => this._page_num.value = value;

  final _meta = WPMeta(totalPages: 1).obs;
  get meta => this._meta.value;
  set meta(value) => this._meta.value = value;

  final Rx<List<Post>> _posts = Rx<List<Post>>([]);
  get posts => this._posts.value;
  set posts(value) => this._posts.value = value;

  bool get isNoMore => page_num >= meta.totalPages;

  Future<List<Post>> fetchPost({int? page, int? per_page}) {
    return api.posts
        .fetch(
            args: {
      '_embed': '',
      'format': 'standard',
      'status': 'publish',
      'page': page ?? 1,
      'per_page': per_page ?? 20,
      // 'lang': Get.locale?.languageCode ?? 'zh',
    }..removeWhere((key, value) => value == null))
        .then((value) {
      meta = value.meta;

      return value.data;
    });
  }

  Future<void> onPostRefresh() {
    return fetchPost().then((data) {
      posts = data;
      page_num = 1;
    });
  }

  Future<void> onPostLoading() {
    return fetchPost(page: ++page_num).then((data) {
      posts?.addAll(data);

      //去重
      var ids = posts!.map((e) => e.id).toSet();
      posts!.retainWhere((x) => ids.remove(x.id));
    });
  }
}

class NewsController extends RefreshBaseController<List<Post>>
    with NewsAPIController {
  @override
  void onRefresh() {
    refreshController.resetNoData();
    onPostLoading();
    refreshController.loadComplete();
  }

  @override
  void onLoading() {
    onPostRefresh();
    refreshController.refreshCompleted();
    if (isNoMore) {
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
