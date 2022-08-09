import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class RefreshBaseController<T> extends GetxController
    with StateMixin<T> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final _page = 1.obs;
  get page => this._page.value;
  set page(value) => this._page.value = value;

  final _pageSize = 20.obs;
  get pageSize => this._pageSize.value;
  set pageSize(value) => this._pageSize.value = value;

  final _pageTotal = 1.obs;
  get pageTotal => this._pageTotal.value;
  set pageTotal(value) => this._pageTotal.value = value;

  get hasMore => page < pageTotal;

  Future<T> onFetch();

  void onLoading() {
    if (hasMore) {
      refreshController.loadNoData();
    }
  }

  void onRefresh() {
    refreshController.resetNoData();
  }
}

class PullToRefresh extends StatelessWidget {
  PullToRefresh({
    Key? key,
    required this.child,
    required this.controller,
    this.header,
    this.enablePullDown = true,
    this.enablePullUp = false,
  }) : super(
          key: key,
        );

  final Widget child;
  final Widget? header;
  final RefreshBaseController controller;
  final bool enablePullDown;
  final bool enablePullUp;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      header: header ??
          WaterDropHeader(
              waterDropColor: Theme.of(context).colorScheme.primary),
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
      controller: controller.refreshController,
      onRefresh: controller.onRefresh,
      onLoading: controller.onLoading,
      child: child,
    );
  }
}
