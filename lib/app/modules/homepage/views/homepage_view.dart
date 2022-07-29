import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomePageView extends GetView<HomepageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageController>(
      init: HomepageController(),
      initState: (state) {},
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('HomepageView'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'HomepageView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
