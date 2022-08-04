import 'package:app/app/modules/home/controllers/home_controller.dart';
import 'package:app/app/common/extensions/extensions.dart';
import 'package:badges/badges.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (state) {},
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                pinned: true,
                stretch: true,
                // title: FutureBuilder<List<Placemark>>(
                //   future: LocationService.instance.determinePosition(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return Text(snapshot.data?.first.country ?? '')
                //           .size(12)
                //           .color(Colors.black);
                //     }

                //     if (snapshot.hasError) {
                //       return Text('获取地址位置失败！').size(10).color(Colors.black);
                //     }

                //     return CupertinoActivityIndicator();
                //   },
                // ),
                actions: [
                  Badge(
                    padding: EdgeInsets.all(3),
                    position: BadgePosition(top: 12, end: 12),
                    badgeContent: Text('3').s8(),
                    child: IconButton(
                        onPressed: () {}, icon: Icon(FontAwesomeIcons.bell)),
                  )
                ],
              ),
            ];
          },
          body: CustomScrollView(slivers: <Widget>[
            SliverToBoxAdapter(child: LogoView()),
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 16)),
            SliverToBoxAdapter(
              child: BannerView(),
            ),
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
          ]).paddingSymmetric(horizontal: 16),
        ),
      ).refresh(controller, header: MaterialClassicHeader()),
    );
  }
}

class LogoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogo().container();
    // Image.asset(
    //             'assets/images/logo.png',
    //             fit: BoxFit.cover,
    //             width: 100,
    //           ).container(),
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
            radius: 10);
      },
      itemCount: 3,
      viewportFraction: 0.8,
      scale: 0.95,
      pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(size: 5, activeSize: 8)),
    ).container(h: 150);
  }
}
