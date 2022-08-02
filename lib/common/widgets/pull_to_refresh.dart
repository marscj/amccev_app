import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefresh extends StatelessWidget {
  PullToRefresh({
    Key? key,
    required this.child,
    required this.controller,
    this.onLoading,
    this.onRefresh,
  }) : super(key: key);

  final Widget child;
  final RefreshController controller;
  final Function()? onRefresh;
  final Function()? onLoading;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;

          if (mode == LoadStatus.idle) {
            body = Text('pull_up_load'.tr);
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text('load_failed'.tr);
          } else if (mode == LoadStatus.noMore) {
            body = Text('no_more_data'.tr);
          } else {
            body = Text("");
          }

          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: controller,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: child,
    );
  }
}
