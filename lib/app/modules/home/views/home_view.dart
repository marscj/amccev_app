import 'package:app/config.dart';
import 'package:app/utils/http/myhttp.dart';
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
      body: Column(
        children: [
          Text(
            Env.config.appDomain,
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
              onPressed: () {
                MyHttp().get('/api.json').then((value) {});
              },
              child: Text("ll  asdf"))
        ],
      ),
    );
  }
}
