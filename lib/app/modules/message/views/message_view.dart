import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/message_controller.dart';

class MessageView extends GetView<MessageController> {
  MessageView({Key? key}) : super(key: key);

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
    return GetBuilder<MessageController>(
      init: MessageController(),
      initState: (state) {},
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text('BookingView'),
            centerTitle: true,
          ),
          body: Scaffold(
            body: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: WaterDropHeader(),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus? mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = Text("pull up load");
                  } else if (mode == LoadStatus.loading) {
                    body = CupertinoActivityIndicator();
                  } else if (mode == LoadStatus.failed) {
                    body = Text("Load Failed!Click retry!");
                  } else if (mode == LoadStatus.canLoading) {
                    body = Text("release to load more");
                  } else {
                    body = Text("No more Data");
                  }
                  return SizedBox(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              controller: controller.refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: CustomScrollView(
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
              ),
            ),
          )),
    );
  }
}
