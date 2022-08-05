import 'package:app/app/modules/home/controllers/home_controller.dart';
import 'package:app/app/common/extensions/extensions.dart';
import 'package:badges/badges.dart';
import 'package:card_swiper/card_swiper.dart';
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
          body: CustomScrollView(slivers: <Widget>[
        ToolbarView(),
        SizedBox(height: 16).sliver,
        BannerView().paddingSymmetric(horizontal: 16).sliver,
        SizedBox(height: 16).sliver,
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: ServiceView(),
        ),
        SizedBox(height: 16).sliver,
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: BranchView(),
        )
      ]).refresh(controller, header: MaterialClassicHeader())),
    );
  }
}

class ToolbarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      leading: LogoView(),
      title: Text('AMCCEV SERVICES').s14.bold,
      actions: [
        Badge(
          padding: EdgeInsets.all(4),
          position: BadgePosition(top: 16, end: 12),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.support_agent)),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
          background: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      )).container(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.lightGreenAccent.shade700,
            Colors.lightGreenAccent.shade100,
          ],
        ),
      ),
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

class BranchView extends StatelessWidget {
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
