import 'package:flutter/material.dart';

extension ExtensionListWidget on List<Widget> {
  Iterable<Widget> divider(
      {BuildContext? context, Color? color, Border? border}) {
    assert(color != null || context != null);

    if (isEmpty || length == 1) {
      return this;
    }

    Widget wrapTile(Widget child) {
      return DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          border: border ??
              Border(
                right: Divider.createBorderSide(context, color: color),
              ),
        ),
        child: child,
      );
    }

    return <Widget>[
      ...take(length - 1).map(wrapTile),
      last,
    ];
  }

  Widget row(
          {MainAxisAlignment? mainAxisAlignment,
          CrossAxisAlignment? crossAxisAlignment}) =>
      Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: this);

  Widget col(
          {MainAxisAlignment? mainAxisAlignment,
          CrossAxisAlignment? crossAxisAlignment}) =>
      Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: this);

  Widget stack({StackFit fit = StackFit.loose}) =>
      Stack(fit: fit, children: this);

  Widget warp({mainAxisSpacing, crossAxisSpacing}) => Wrap(
        children: this,
      );
}
