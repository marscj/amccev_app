import 'package:flutter/cupertino.dart';
import 'package:html/parser.dart' show parse;

/// A class of useful utilities
///
/// `[logger]` is used for better console logs
///
/// `[renderHtml]` is used to parse any `html` string
class Utils {
  static String renderHtml(String? html) => parse(html).body!.text;

  static Color getColor(String colors) {
    var item = colors.split(',');
    // print(item);
    return Color.fromRGBO(int.parse(item[0].replaceAll('"', '')),
        int.parse(item[1]), int.parse(item[2]), double.parse(item[3].replaceAll('"', '')));
  }
}
