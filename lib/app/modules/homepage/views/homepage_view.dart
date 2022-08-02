import 'package:app/common/extensions/extensions.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/homepage_controller.dart';

class HomePageView extends GetView<HomepageController> {
  HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageController>(
      init: HomepageController(),
      initState: (state) {},
      builder: (controller) => Scaffold(
        backgroundColor: Colors.transparent,
        body: NestedScrollView(
          headerSliverBuilder: (root, innerBoxIsScrolled) {
            return <Widget>[
              // SliverAppBar(
              //   foregroundColor: Colors.white,
              //   pinned: true,
              //   stretch: true,
              //   expandedHeight: 230.0,
              //   title: Row(children: [
              //     Image.asset(
              //       'assets/images/logo.png',
              //       width: 80,
              //     ),
              //     SizedBox(
              //       width: 5,
              //     ),
              //     Text('AMCCEV')
              //   ]),
              //   actions: [
              //     Badge(
              //       padding: EdgeInsets.all(3),
              //       position: BadgePosition(top: 12, end: 12),
              //       badgeContent: Text('3').size(8),
              //       child: IconButton(
              //           onPressed: () {}, icon: Icon(FontAwesomeIcons.bell)),
              //     )
              //   ],
              //   flexibleSpace: FlexibleSpaceBar(
              //     background: Image.network(
              //       'https://www.amccev.com/wp-content/uploads/2021/11/image-rtv-11-copyright.jpg',
              //       fit: BoxFit.fitHeight,
              //     ),
              //   ),
              // ),

              SliverPersistentHeader(
                pinned: true,
                delegate: SliverCustomHeaderDelegate(
                    title: '哪吒之魔童降世',
                    collapsedHeight: kToolbarHeight,
                    expandedHeight: 230,
                    paddingTop: MediaQuery.of(context).padding.top,
                    coverImgUrl:
                        'https://www.amccev.com/wp-content/uploads/2021/11/image-rtv-11-copyright.jpg'),
              ),
            ];
          },
          body: Builder(builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: CustomScrollView(slivers: <Widget>[
                SliverGrid.count(
                  crossAxisCount: 4,
                  children: List.generate(8, (index) {
                    return Container(
                      color: Colors.primaries[index % Colors.primaries.length],
                      alignment: Alignment.center,
                      child: Text(
                        '$index',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  }).toList(),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((content, index) {
                    return Container(
                      height: 85,
                      alignment: Alignment.center,
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: Text(
                        '$index',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  }, childCount: 25),
                ),
              ]).pull_to_refresh(controller, header: MaterialClassicHeader()),
            );
          }),
        ),
      ),
    );
  }
}

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String coverImgUrl;
  final String title;
  String statusBarMode = 'dark';

  SliverCustomHeaderDelegate({
    required this.collapsedHeight,
    required this.expandedHeight,
    required this.paddingTop,
    required this.coverImgUrl,
    required this.title,
  });

  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void updateStatusBarBrightness(shrinkOffset) {
    if (shrinkOffset - expandedHeight > kToolbarHeight &&
        this.statusBarMode == 'dark') {
      this.statusBarMode = 'light';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ));
    } else if (shrinkOffset - expandedHeight <= kToolbarHeight &&
        this.statusBarMode == 'light') {
      this.statusBarMode = 'dark';
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ));
    }
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= kToolbarHeight) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    this.updateStatusBarBrightness(shrinkOffset);
    return SizedBox(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SizedBox(child: Image.network(this.coverImgUrl, fit: BoxFit.cover)),
          Positioned(
            left: 0,
            top: this.maxExtent / 2,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    Color(0x90000000),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: AppBar(
                title: Text(
                  title,
                  style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                      color: makeStickyHeaderTextColor(shrinkOffset, false)),
                ),
                backgroundColor: this.makeStickyHeaderBgColor(shrinkOffset),
                foregroundColor: makeStickyHeaderTextColor(shrinkOffset, false),
                actions: [
                  Badge(
                    padding: EdgeInsets.all(3),
                    position: BadgePosition(top: 12, end: 12),
                    badgeContent: Text('3').size(8),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.bell,
                        color:
                            this.makeStickyHeaderTextColor(shrinkOffset, true),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
