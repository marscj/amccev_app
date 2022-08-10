import 'package:app/app/common/extensions/extensions.dart';
import 'package:app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  BookingView({Key? key}) : super(key: key);

  final List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          title: Text('News'),
          actions: [
            GFIconBadge(
              padding: EdgeInsets.zero,
              position: GFBadgePosition(top: 16, end: 12),
              counterChild: GFBadge(
                size: 20,
                text: '1',
                shape: GFBadgeShape.circle,
              ),
              child: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.GETWIDGET);
                  },
                  icon: Icon(Icons.support_agent)),
            )
          ],
        ),
        body: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('list item $index'),
                  );
                }, childCount: items.length),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.red,
                  height: 200,
                ),
              )
            ],
          ).refresh(controller),
        ));
  }
}
