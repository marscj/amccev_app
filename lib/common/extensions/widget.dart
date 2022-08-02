import 'package:flutter/material.dart';
import 'package:app/common/widgets/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

extension ExtensionWidget on Widget {
  Widget pull_to_refresh(
    RefreshController controller, {
    Function()? onRefresh,
    Function()? onLoading,
  }) {
    return PullToRefresh(
      controller: controller,
      onLoading: onLoading,
      onRefresh: onRefresh,
      child: this,
    );
  }
}
