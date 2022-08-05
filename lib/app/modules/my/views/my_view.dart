import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_controller.dart';

class MyView extends GetView<MyController> {
  const MyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      init: MyController(),
      initState: (state) {},
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('MyView'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            'MyView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
