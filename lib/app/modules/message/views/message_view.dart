import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/message_controller.dart';

class MessageView extends GetView<MessageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      init: MessageController(),
      initState: (state) {},
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('BookingView'),
          centerTitle: true,
        ),
        body: Scaffold(),
      ),
    );
  }
}
