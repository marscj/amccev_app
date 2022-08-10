import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/notice_controller.dart';

class NoticeView extends GetView<NoticeController> {
  NoticeView({Key? key}) : super(key: key);

  final List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    controller.refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    items.add((items.length + 1).toString());
    controller.refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoticeController>(
      init: NoticeController(),
      initState: (state) {},
      builder: (controller) => Scaffold(),
    );
  }
}
