import 'package:app/package/getwidget/main.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/getwidget_controller.dart';

class GetwidgetView extends GetView<GetwidgetController> {
  const GetwidgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}
