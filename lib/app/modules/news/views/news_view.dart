import 'package:app/app/routes/app_pages.dart';
import 'package:app/package/wp/src/utils.dart';
import 'package:app/package/wp/wordpress_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  NewsView({Key? key}) : super(key: key);

  final List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    controller.refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    items.add((items.length + 1).toString());
    controller.refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      init: NewsController(),
      initState: (state) {},
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text('BookingView'),
            centerTitle: true,
          ),
          body: Scaffold(
            body: Obx(() => SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: ClassicHeader(),
                controller: controller.refreshController,
                onRefresh: () => controller.onRefresh(),
                onLoading: () => controller.onLoading(),
                child: CustomScrollView(
                  slivers: [
                    PostListView(
                      posts: controller.posts ?? [],
                    )
                  ],
                ))),
          )),
    );
  }
}

class PostListView extends StatelessWidget {
  final List<Post> posts;

  const PostListView({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return PostItemView(post: posts[index]);
    }, childCount: posts.length));

    // SliverFillRemaining(
    //     fillOverscroll: false,
    //     hasScrollBody: true,
    //     child: ListView.separated(
    //         itemBuilder: (context, index) => PostItemView(post: posts[index]),
    //         separatorBuilder: (context, index) => Divider(height: 1),
    //         itemCount: posts.length));
  }
}

class PostItemView extends StatelessWidget {
  const PostItemView({Key? key, required this.post}) : super(key: key);

  final Post post;

  bool get isThreeLineStye =>
      post.embedded != null && post.embedded!.isNotEmpty;

  bool get isVideoStyle => post.metaBox != null;

  // bool get isVideo => post.content!.contains('iframe');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 0.5))),
      padding: EdgeInsets.symmetric(vertical: 15),
      child: isVideoStyle
          ? VideoListWidget(post)
          : isThreeLineStye
              ? ThreeLineListWidget(post)
              : TwoLineListWidget(post),
    );
  }
}

class VideoListWidget extends StatelessWidget {
  const VideoListWidget(this.post, {Key? key}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          title: Text(post.title ?? ''),
        ),
        CachedNetworkImage(
            imageUrl: post.embedded!.first.medium!.sourceUrl ?? '',
            imageBuilder: (context, imageProvider) => Stack(
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Container(
                          height: 150,
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(0)))),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.play_arrow,
                          size: 80,
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.NEWS_DETAIL,
                              arguments: {'post': post});
                        },
                      ),
                    )
                  ],
                ),
            errorWidget: (_, url, error) => Container(
                  height: 50,
                  child: Icon(
                    Icons.image,
                    size: 50,
                  ),
                )),
        Text(DateFormat('yyyy-MM-dd HH:mm')
            .format(DateTime.parse(post.date ?? '')))
      ],
    ));
  }
}

class TwoLineListWidget extends StatelessWidget {
  const TwoLineListWidget(this.post, {Key? key}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      dense: true,
      title: Text(post.title ?? ''),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Utils.renderHtml(post.content),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),
          Text(DateFormat('yyyy-MM-dd HH:mm')
              .format(DateTime.parse(post.date ?? '')))
        ],
      ),
      onTap: () => Get.toNamed(Routes.NEWS_DETAIL, arguments: {'post': post}),
    );
  }
}

class ThreeLineListWidget extends StatelessWidget {
  const ThreeLineListWidget(this.post, {Key? key}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      dense: true,
      leading: LeadingView(post.embedded!.first.medium!.sourceUrl),
      title: Text(post.title ?? ''),
      subtitle: Text(DateFormat('yyyy-MM-dd HH:mm')
          .format(DateTime.parse(post.date ?? ''))),
      onTap: () => Get.toNamed(Routes.NEWS_DETAIL, arguments: {'post': post}),
    );
  }
}

class LeadingView extends StatelessWidget {
  const LeadingView(this.url, {Key? key}) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return url != null
        ? CachedNetworkImage(
            imageUrl: url!,
            placeholder: (context, url) => Icon(Icons.image),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: Get.mediaQuery.size.width * 0.2,
            fit: BoxFit.cover,
          )
        : SizedBox();
  }
}
