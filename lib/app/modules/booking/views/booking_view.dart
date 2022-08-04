import 'package:app/app/common/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  BookingView({Key? key}) : super(key: key);

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
    return GetBuilder<BookingController>(
      init: BookingController(),
      initState: (state) {},
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: const Text('BookingView'),
            centerTitle: true,
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
            ).pull_to_refresh(controller),
          )),
    );
  }
}
