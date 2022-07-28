import 'dart:convert';

import 'package:app/services/auth_service.dart';
import 'package:app/utils/http/myhttp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'app/routes/app_pages.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

void main() async {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );

  //初始化 dio
  (MyHttp().transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

  //初始化闪屏
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(Duration(seconds: 1))
      .then((value) => FlutterNativeSplash.remove());

  //初始化缓存
  await GetStorage.init();

  //路由守护
  await Get.putAsync(() => AuthService().init());

  //禁止横屏
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    ));
  });
}
