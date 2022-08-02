import 'package:flutter/material.dart';

extension ExtensionText on dynamic {
  Widget size(double size) {
    assert(this != Widget);
    return this is DefaultTextStyle
        ? DefaultTextStyle.merge(
            child: this.child,
            style: TextStyle(fontSize: size).merge(this.style))
        : DefaultTextStyle(child: this, style: TextStyle(fontSize: size));
  }

  Widget bold() {
    assert(this != Widget);
    return this is DefaultTextStyle
        ? DefaultTextStyle.merge(
            child: this.child,
            style: TextStyle(fontWeight: FontWeight.bold).merge(this.style))
        : DefaultTextStyle(
            child: this, style: TextStyle(fontWeight: FontWeight.bold));
  }

  Widget color(c) {
    assert(this != Widget);
    return this is DefaultTextStyle
        ? DefaultTextStyle.merge(
            child: this.child, style: TextStyle(color: c).merge(this.style))
        : DefaultTextStyle(child: this, style: TextStyle(color: c));
  }
}
