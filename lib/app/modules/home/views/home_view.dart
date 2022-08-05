import 'package:app/app/common/widgets/carousel.dart';
import 'package:app/app/modules/home/controllers/home_controller.dart';
import 'package:app/app/common/extensions/extensions.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
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
        BannerView().sliver,
        SizedBox(height: 16).sliver,
        Text('Our Service')
            .s14
            .black
            .bold
            .container(h: 24, padding: EdgeInsets.symmetric(horizontal: 16))
            .sliver,
        ServiceView().sliver,
        SizedBox(height: 16).sliver,
        Text('Popular Services Center')
            .s14
            .black
            .bold
            .container(h: 24, padding: EdgeInsets.symmetric(horizontal: 16))
            .sliver,
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
        GFIconBadge(
          padding: EdgeInsets.zero,
          position: GFBadgePosition(top: 16, end: 12),
          counterChild: GFBadge(
            size: 20,
            text: '1',
            shape: GFBadgeShape.circle,
          ),
          child: IconButton(
              onPressed: () {
                Get.toNamed(Routes.GETWIDGET);
              },
              icon: Icon(Icons.support_agent)),
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
    return Container();
  }
}

class ServiceView extends StatelessWidget {
  final List<String> assetImg = [
    'lib/assets/images/red.png',
    'lib/assets/images/purple.png',
    'lib/assets/images/orange.png',
    'lib/assets/images/red.png',
  ];

  final List<Color> gradientColors = [
    const Color(0xffFFD633),
    const Color(0xFFFF8F33),
  ];

  @override
  Widget build(BuildContext context) {
    return GFXItemsCarousel(
      start: 16,
      end: 16,
      space: 6,
      itemHeight: 160,
      itemWidth: (MediaQuery.of(context).size.width - 16) * 0.45,
      children: assetImg
          .map(
            (url) => GFCard(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: gradientColors,
              ),
              margin: EdgeInsets.zero,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              content: Column(
                children: <Widget>[
                  Text(
                    'Title',
                    style: TextStyle(
                      color: GFColors.WHITE,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5, top: 10),
                    child: Text(
                      'GetWidget is an open source UI components ',
                      style: TextStyle(
                        fontSize: 10,
                        color: GFColors.LIGHT,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class BranchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
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
