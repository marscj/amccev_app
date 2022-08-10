import 'package:app/app/common/extensions/extensions.dart';
import 'package:app/app/modules/home/views/home_view.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:app/package/wp/src/utils.dart';
import 'package:app/package/wp/wordpress_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            ToolbarView(title: 'NEWS'),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SpaceView(height: 20).sliver,
            NewsSliver(),
            SpaceView(height: 20).sliver,
          ],
        ).refresh(controller),
      ),
    );
  }
}

class NewsSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<NewsController>(
      init: NewsController(),
      initState: (state) {},
      builder: (controller) {
        return controller.obx((state) => PostListView(posts: state ?? []),
            onLoading: SizedBox.shrink().sliver,
            onEmpty: SizedBox.shrink().sliver,
            onError: ((error) => SizedBox.shrink().sliver));
      });
}

class PostListView extends StatelessWidget {
  final List<Post> posts;

  const PostListView({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return PostItemView(
          post: posts[index],
          isFirst: index == 0,
          isLast: index == posts.length - 1,
        ).fadeIn();
      }, childCount: posts.length),
    );

    //  return SliverFillRemaining(
    //       fillOverscroll: false,
    //       hasScrollBody: true,
    //       child: ListView.separated(
    //           itemBuilder: (context, index) => PostItemView(post: posts[index]),
    //           separatorBuilder: (context, index) => Divider(height: 1),
    //           itemCount: posts.length));
  }
}

class PostItemView extends StatelessWidget {
  const PostItemView(
      {Key? key, required this.post, this.isFirst = false, this.isLast = true})
      : super(key: key);

  final Post post;

  final bool isFirst;

  final bool isLast;

  bool get isThreeLineStye =>
      post.embedded != null && post.embedded!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: !isLast
              ? Border(
                  bottom: Divider.createBorderSide(context,
                      color: Theme.of(context).dividerColor))
              : null),
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.only(top: isFirst ? 0 : 10, bottom: 10),
      child:
          isThreeLineStye ? ThreeLineListWidget(post) : TwoLineListWidget(post),
    );
  }
}

class TwoLineListWidget extends StatelessWidget {
  const TwoLineListWidget(this.post, {Key? key}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // isThreeLine: true,
      // dense: true,
      title: Text(post.title ?? ''),
      contentPadding: EdgeInsets.zero,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Utils.renderHtml(post.content),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 5,
          ),
          Text(DateFormat('yyyy-MM-dd HH:mm')
                  .format(DateTime.parse(post.date ?? '')))
              .s10
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
      isThreeLine: false,
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: LeadingView(post.embedded!.first.medium!.sourceUrl),
      title: Text(post.title ?? ''),
      subtitle: Text(DateFormat('yyyy-MM-dd HH:mm')
              .format(DateTime.parse(post.date ?? '')))
          .s10,
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
