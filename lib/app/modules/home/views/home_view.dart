import 'package:app/common/extensions/extensions.dart';
import 'package:app/services/location_service.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/home_controller.dart';

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
                // pinned: true,
                // stretch: true,
                title: FutureBuilder<List<Placemark>>(
                  future: LocationService.instance.determinePosition(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data?.first.country ?? '').size(10);
                    }

                    if (snapshot.hasError) {
                      return Text('获取地址位置失败！').size(10);
                    }

                    return CupertinoActivityIndicator();
                  },
                ),
                actions: [
                  Badge(
                    padding: EdgeInsets.all(3),
                    position: BadgePosition(top: 12, end: 12),
                    badgeContent: Text('3').size(8),
                    child: IconButton(
                        onPressed: () {}, icon: Icon(FontAwesomeIcons.bell)),
                  )
                ],
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(children: [
                    Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                      width: 100,
                    ),
                  ]),
                ),
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
            ]),
          ),
        ),
      ).pull_to_refresh(controller, header: MaterialClassicHeader()),
    );
  }
}
