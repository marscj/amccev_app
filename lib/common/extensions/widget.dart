import 'package:flutter/material.dart';
import 'package:app/common/widgets/widgets.dart';

extension ExtensionWidget on Widget {
  Widget pull_to_refresh(
    RefreshMixin controller, {
    Widget? header,
  }) {
    return PullToRefresh(
      controller: controller,
      header: header,
      child: this,
    );
  }
}
