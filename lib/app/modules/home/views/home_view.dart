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
        BranchView().sliver,
        SizedBox(height: 16).sliver,
        Text('News Center')
            .s14
            .black
            .bold
            .container(h: 24, padding: EdgeInsets.symmetric(horizontal: 16))
            .sliver,
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: PostView(),
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
      expandedHeight: 80,
      flexibleSpace: FlexibleSpaceBar(
          background: [
        SizedBox(
          height: MediaQuery.of(context).padding.top + kToolbarHeight,
        ),
        Text('Hi, Good Morinig').s14.black.bold,
      ]
              .col(crossAxisAlignment: CrossAxisAlignment.start)
              .paddingSymmetric(horizontal: 16)
              .container(color: Theme.of(context).scaffoldBackgroundColor)),
      // flexibleSpace: FlexibleSpaceBar(
      //     background: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      // )).container(
      //   gradient: LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     colors: [
      //       Colors.lightGreenAccent.shade700,
      //       Colors.lightGreenAccent.shade100,
      //     ],
      //   ),
      // ),
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
  final List<String> imageList = [
    'lib/assets/images/card5.png',
    'lib/assets/images/image.png',
    'lib/assets/images/image1.png',
    'lib/assets/images/image2.png',
    'lib/assets/images/card4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GFCarousel(
      autoPlay: true,
      hasPagination: true,
      viewportFraction: 1.0,
      activeIndicator: GFColors.SUCCESS,
      passiveIndicator: GFColors.DARK,
      height: 160,
      items: imageList
          .map(
            (url) => GFImageOverlay(
              height: 200,
              margin: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 30,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      'Title',
                      style: TextStyle(color: GFColors.WHITE),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: Text(
                        'GetWidget is an open source library that comes with pre-build 1000+ UI components. ',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: GFColors.LIGHT),
                      ),
                    )
                  ],
                ),
              ),
              image: AssetImage(url),
            ),
          )
          .toList(),
      onPageChanged: (index) {},
    );
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
      itemHeight: 120,
      itemWidth: (MediaQuery.of(context).size.width) * 0.29,
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
      itemHeight: 180,
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

class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
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
    );
  }
}
