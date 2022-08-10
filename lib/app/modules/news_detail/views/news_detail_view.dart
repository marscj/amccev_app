import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/news_detail_controller.dart';

class NewsDetailView extends GetView<NewsDetailController> {
  const NewsDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          children: [
            Html(
                data: '<h2> ${controller.post.title!} </h2>'
                    '<h6 style="color: grey;"> ${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(controller.post.date ?? ''))}  </h6>'),
            Html(data: '${controller.post.content}')
          ],
        ),
      )),
    );
  }
}
