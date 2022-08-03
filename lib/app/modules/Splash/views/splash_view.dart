import 'package:app/app/modules/splash/controllers/splash_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashView extends GetView<SplashService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Text(
                controller.welcomeStr[controller.activeStr.value],
                style: TextStyle(fontSize: 20),
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
