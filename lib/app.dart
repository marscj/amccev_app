import 'dart:ui' as ui;
import 'package:app/storage/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

class AppController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = ui.window.locale;
    var lang = UserStorage.get()?['lang'];

    return GetBuilder<AppController>(
      init: AppController(),
      initState: (state) {},
      builder: (context) {
        return GetMaterialApp(
          title: 'app_name'.tr,
          initialRoute: AppPages.INITIAL,
          translationsKeys: AppTranslation.translations,
          locale: lang == null ? locale : Locale(lang),
          fallbackLocale: Locale('zh'),
          getPages: AppPages.routes,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
