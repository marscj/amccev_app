import 'package:app/app/common/widgets/carousel.dart';
import 'package:app/app/modules/home/controllers/home_controller.dart';
import 'package:app/app/common/extensions/extensions.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        TitleView(
          'Good Morning!',
        ).sliver,
        BannerView().sliver,
        SpaceView().sliver,
        TitleView('Our Service').sliver,
        ServiceView(),
        SpaceView().sliver,
        TitleView('Popular Services Center').sliver,
        BranchView().sliver,
        SpaceView().sliver,
        TitleView('News Center').sliver,
        PostView()
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

// class ServiceView extends StatelessWidget {
//   final List<String> assetImg = [
//     'lib/assets/images/red.png',
//     'lib/assets/images/purple.png',
//     'lib/assets/images/orange.png',
//     'lib/assets/images/red.png',
//   ];

//   final List<Color> gradientColors = [
//     const Color(0xffFFD633),
//     const Color(0xFFFF8F33),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return GFXItemsCarousel(
//       start: 16,
//       end: 16,
//       space: 6,
//       itemHeight: 120,
//       itemWidth: (MediaQuery.of(context).size.width) * 0.29,
//       children: assetImg
//           .map(
//             (url) => GFCard(
//               gradient: LinearGradient(
//                 begin: FractionalOffset.topCenter,
//                 end: FractionalOffset.bottomCenter,
//                 colors: gradientColors,
//               ),
//               margin: EdgeInsets.zero,
//               borderRadius: const BorderRadius.all(Radius.circular(4)),
//               content: Column(
//                 children: <Widget>[
//                   Text(
//                     'Title',
//                     style: TextStyle(
//                       color: GFColors.WHITE,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(right: 5, top: 10),
//                     child: Text(
//                       'GetWidget is an open source UI components ',
//                       style: TextStyle(
//                         fontSize: 10,
//                         color: GFColors.LIGHT,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           )
//           .toList(),
//     );
//   }
// }

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
        .container(color: Colors.white, radius: 10);
  }
}
