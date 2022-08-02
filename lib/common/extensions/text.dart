import 'package:flutter/material.dart';

extension ExtensionText on Text {
  Widget size(double size) {
    return DefaultTextStyle(
      style: TextStyle(fontSize: size),
      child: this,
    );
  }

  Widget bold() {
    return DefaultTextStyle(
      style: TextStyle(fontWeight: FontWeight.bold),
      child: this,
    );
  }

  Widget color(c) {
    return DefaultTextStyle(
      style: TextStyle(color: c),
      child: this,
    );
  }
}
