import 'package:app/app/common/gfx/card.dart';
import 'package:app/app/common/gfx/carousel.dart';
import 'package:app/app/modules/home/controllers/home_controller.dart';
import 'package:app/app/common/extensions/extensions.dart';
import 'package:app/app/modules/news/views/news_view.dart';
import 'package:app/app/modules/root/controllers/root_controller.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          ToolbarView(title: 'AMCCEV SERVICES'),
        ];
      },
      body: CustomScrollView(slivers: <Widget>[
        SpaceView(
          height: 16,
        ).sliver,
        BannerView().sliver,
        SpaceView().sliver,
        TitleView('Our Service').sliver,
        ServiceView(),
        SpaceView().sliver,
        // TitleView('Center Branch').sliver,
        // BranchView().sliver,
        BranchMapView().sliver,
        SpaceView().sliver,
        TitleView('News').sliver,
        NewsSliver(),
        SpaceView(
          height: 32,
        ).sliver,
      ]).refresh(controller),
    ));
  }
}

class ToolbarView extends StatelessWidget {
  final String title;

  const ToolbarView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      floating: true,
      leading: LogoView(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(title).s14.bold,
      leadingWidth: 80,
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
      expandedHeight: 0,
      flexibleSpace: FlexibleSpaceBar(
          background: SizedBox.shrink().container(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
            Colors.lightGreenAccent.shade700,
            Colors.lightGreenAccent.shade100,
          ]))),
    );
  }
}

class LogoView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Image.asset(
          key: ValueKey('${controller.index}'),
          'assets/images/logo.png',
          fit: BoxFit.contain,
        ).elasticInLeft(key: ValueKey('${controller.index}')));
  }
}

class BannerView extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/bg_1.jpg',
    'assets/images/bg_1.jpg',
    'assets/images/bg_1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return GFXCarousel(
      autoPlay: true,
      hasPagination: true,
      activeIndicator: GFColors.SUCCESS,
      passiveIndicator: GFColors.WHITE,
      viewportFraction: 1.0,
      pagerSize: 4,
      activeSize: 6,
      height: 140,
      items: imageList
          .map((url) => SizedBox.expand().container(
              margin: EdgeInsets.only(left: 16, right: 16),
              radius: 4,
              image:
                  DecorationImage(image: AssetImage(url), fit: BoxFit.cover)))
          .toList(),
      onPageChanged: (index) {},
    );
  }
}

class BranchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width - 32) * 0.45;

    return GFXItemsCarousel(
        start: 16,
        end: 16,
        space: 6,
        itemHeight: itemWidth * 1.2,
        itemWidth: itemWidth,
        children: [
          ItemCardView(
            url: 'assets/images/branch_1.jpg',
            title: 'Al Quoz'.toUpperCase(),
            subtitle: 'Dubai',
          ),
          ItemCardView(
            url: 'assets/images/branch_2.jpg',
            title: 'Industrial City'.toUpperCase(),
            subtitle: 'Dubai',
          ),
          ItemCardView(
            url: 'assets/images/branch_3.jpg',
            title: 'Umm Ramool'.toUpperCase(),
            subtitle: 'Dubai',
          ),
          ItemCardView(
            url: 'assets/images/branch_4.jpg',
            title: 'Abu Dhabi'.toUpperCase(),
          ),
          ItemCardView(
            url: 'assets/images/branch_5.jpg',
            title: 'Sharjah'.toUpperCase(),
          ),
          ItemCardView(
            url: 'assets/images/branch_6.jpg',
            title: 'Ras Al-Khaimah'.toUpperCase(),
          ),
          ItemCardView(
            url: 'assets/images/branch_7.jpg',
            title: 'Fujairah'.toUpperCase(),
          ),
          ItemCardView(
            url: 'assets/images/branch_8.jpg',
            title: 'Al Ain'.toUpperCase(),
          ),
        ]);
  }
}

class BranchMapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      [
        Icon(
          FontAwesomeIcons.mapLocation,
          color: Colors.white,
        ),
        ListTile(
          dense: true,
          title: Text('Center Branch').s14.white.bold,
          trailing: TextButton(
              onPressed: () {}, child: Text('Detail').color(Colors.white)),
        ).expanded
      ].row().container(
          color: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.only(left: 16),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4), topRight: Radius.circular(4))),
      SizedBox(height: 10),
      Image.asset(
        'assets/images/branch_map.jpg',
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ).container(margin: EdgeInsets.only(left: 16, right: 16, bottom: 16))
    ]
        .col()
        .material(elevation: 1, radius: 4, color: Colors.white)
        .container(padding: EdgeInsets.symmetric(horizontal: 16));
  }
}

class ServiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverLayoutBuilder(
        builder: (context, constraints) {
          return SliverGrid.count(
            crossAxisCount: 3,
            childAspectRatio:
                (constraints.crossAxisExtent / 3 - 10) / (140 - 10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              ItemView(
                icon: Icon(FontAwesomeIcons.trophy),
                title: Text('Warranty'),
              ),
              ItemView(
                icon: Icon(FontAwesomeIcons.carOn),
                title: Text('Inspection'),
              ),
              ItemView(
                icon: Icon(FontAwesomeIcons.carBurst),
                title: Text('Repair'),
              )
            ].map((e) => e.container(color: Colors.white, radius: 10)).toList(),
          );
        },
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverLayoutBuilder(
        builder: (context, constraints) {
          return SliverGrid.count(
            crossAxisCount: 2,
            childAspectRatio:
                (constraints.crossAxisExtent / 2 - 10) / (250 - 10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              ProductItemView(
                url:
                    'https://www.amccev.com/wp-content/uploads/2022/08/3.3-180kW-all-in-one-DUAL-gun-DC-charger-European-standard-min-1.png',
                title:
                    '180kW All-in-One dual-Gun DC Charger (China Standard + European Standard)',
              ),
            ].map((e) => e.container(color: Colors.white, radius: 10)).toList(),
          );
        },
      ),
    );
  }
}

class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
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
    );
  }
}

class SpaceView extends StatelessWidget {
  final double height;

  const SpaceView({super.key, this.height = 16});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: this.height);
  }
}

class TitleView extends StatelessWidget {
  final double height;
  final String title;
  final Alignment alignment;

  TitleView(this.title,
      {super.key, this.alignment = Alignment.centerLeft, this.height = 24});

  @override
  Widget build(BuildContext context) {
    return Text(title).s14.black.bold.container(
        h: 24,
        padding: EdgeInsets.symmetric(horizontal: 16),
        alignment: alignment);
  }
}

class ItemView extends StatelessWidget {
  final Icon icon;
  final Text title;

  ItemView({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return [
      IconTheme(
          data: IconThemeData(size: 24, color: Colors.lightGreen),
          child: icon.container(
              color: Color.fromARGB(16, 81, 243, 194),
              shape: BoxShape.circle,
              padding: EdgeInsets.all(20))),
      SizedBox(
        height: 12,
      ),
      title.s12.bold.black,
    ]
        .col(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center)
        .material(elevation: 1, radius: 10, color: Colors.white);
  }
}

class ItemCardView extends StatelessWidget {
  final String url;
  final String title;
  final String? subtitle;

  const ItemCardView({
    Key? key,
    required this.url,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFXCard(
      showOverlayImage: true,
      imageOverlay: AssetImage(url),
      boxFit: BoxFit.cover,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(title).s14.black.bold.single.clip,
          SizedBox(height: 6),
          Text(subtitle ?? '').s12.black.clip
        ],
      )
          .container(
              alignment: Alignment.center,
              color: Colors.white,
              w: double.infinity,
              h: 60,
              radius: 10,
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.symmetric(horizontal: 16))
          .container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(vertical: 20),
          )
          .gesture(() {
        Get.toNamed(Routes.WEBPAGE);
      }),
    );
  }
}

class ProductItemView extends StatelessWidget {
  final String url;
  final String title;

  ProductItemView({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return GFXCard(
      showImage: true,
      image: CachedNetworkImage(imageUrl: url),
      boxFit: BoxFit.cover,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title).s14.black.bold.lines(1).clip,
          SizedBox(height: 6),
          Text('199 AED').s12.color(Colors.red)
        ],
      ).container(padding: EdgeInsets.symmetric(horizontal: 8)),
    );
  }
}
