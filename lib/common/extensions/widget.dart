import 'package:flutter/material.dart';
import 'package:app/common/widgets/widgets.dart';

extension ExtensionWidget on Widget {
  Widget pull_to_refresh(
    MinxRefreshController controller, {
    Function()? onRefresh,
    Function()? onLoading,
  }) {
    return PullToRefresh(
      controller: controller,
      child: this,
    );
  }
}
