import 'dart:ui' as ui;
import 'package:app/app/modules/splash/controllers/splash_service.dart';
import 'package:app/services/auth_service.dart';
import 'package:app/services/location_service.dart';
import 'package:app/storage/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/modules/splash/views/splash_view.dart';
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
          initialBinding: BindingsBuilder(() {
            Get.put(AuthService());
            Get.put(SplashService());
            // Get.put(LocationService());
          }),
          initialRoute: AppPages.INITIAL,
          builder: (context, child) {
            return FutureBuilder<void>(
              key: ValueKey('initFuture'),
              future: Get.find<SplashService>().init(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return child ?? SizedBox.shrink();
                }
                return SplashView();
              },
            );
          },
          translationsKeys: AppTranslation.translations,
          locale: lang == null ? locale : Locale(lang),
          fallbackLocale: Locale('en'),
          getPages: AppPages.routes,
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.lightGreen,
                accentColor: Colors.greenAccent),
            appBarTheme: AppBarTheme(),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
