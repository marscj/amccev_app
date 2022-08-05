import 'package:app/app/modules/home/controllers/home_controller.dart';
import 'package:app/app/common/extensions/extensions.dart';
import 'package:badges/badges.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (state) {},
      builder: (controller) => Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                    0.0,
                    0.3,
                    0.3,
                  ],
                      colors: [
                    Colors.lightGreenAccent.shade700,
                    Colors.lightGreenAccent.shade100,
                    Colors.white,
                  ])),
              child: CustomScrollView(slivers: <Widget>[
                ToolbarView(),
                SizedBox(height: 16).sliver,
                BannerView().paddingSymmetric(horizontal: 16).sliver,
                SizedBox(height: 16).sliver,
                ServiceView(),
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
              ]).refresh(controller, header: MaterialClassicHeader()))),
    );
  }
}

class ToolbarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      // pinned: true,
      // stretch: true,
      shadowColor: Colors.transparent,
      title: LogoView(),

      actions: [
        Badge(
          padding: EdgeInsets.all(5),
          position: BadgePosition(top: 4, end: 4),
          badgeContent: Text('1').s8.white,
          child:
              IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.bell)),
        )
      ],
      expandedHeight: 130,
      flexibleSpace: FlexibleSpaceBar(
          background: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + kToolbarHeight,
          ),
          Text('Hi Jhon Smith ').s14.white.bold.paddingOnly(top: 8, left: 16),
          Text(
            'Good Moring',
          ).s18.white.bold.paddingOnly(top: 4, bottom: 8, left: 16),
        ],
      ).container(alignment: Alignment.topLeft)),
    );
  }
}

class LogoView extends GetView<HomeController> {
  LogoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Image.asset(
          key: ValueKey('${controller.index}'),
          'assets/images/logo.png',
          fit: BoxFit.contain,
          width: 100,
        ).fadeInLeft(key: ValueKey('${controller.index}')));
  }
}

class BannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        return Container().network_image(
            'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
            fit: BoxFit.cover,
            radius: 5);
      },
      itemCount: 3,
      viewportFraction: 1,
      scale: 0.95,
      pagination: SwiperPagination(
        builder: DotSwiperPaginationBuilder(size: 5, activeSize: 6),
      ),
    ).container(h: 150);
  }
}

class ServiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
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
    );
  }
}
