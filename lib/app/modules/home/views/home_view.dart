import 'package:app/app/modules/home/controllers/home_controller.dart';
import 'package:app/app/common/extensions/extensions.dart';
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
        BannerView().paddingSymmetric(horizontal: 16).sliver,
        SizedBox(height: 16).sliver,
        Text('Our Service')
            .s14
            .black
            .bold
            .container(h: 24, padding: EdgeInsets.symmetric(horizontal: 16))
            .sliver,
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: ServiceView().sliver,
        ),
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
        GFBadge(
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
    return Container();
  }
}

class ServiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
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
