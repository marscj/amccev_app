import 'package:app/config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Env.config.appTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          Env.config.appDomain,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
