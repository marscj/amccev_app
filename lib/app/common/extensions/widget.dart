import 'dart:convert';
import 'package:app/app/common/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ExtensionWidget on Widget {
  Widget container({
    double? w,
    double? h,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Color? color,
    double radius = 0.0,
    BoxBorder? border,
    DecorationImage? image,
    Gradient? gradient,
    BoxShape shape = BoxShape.rectangle,
    List<BoxShadow>? shadow,
  }) {
    return Container(
        width: w,
        height: h,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: color,
          image: image,
          boxShadow: shadow,
          borderRadius: BorderRadius.circular(radius ?? 0),
          gradient: gradient,
          shape: shape,
        ),
        child: this);
  }

  Widget network_image(
    url, {
    double? w,
    double? h,
    BoxBorder? border,
    List<BoxShadow>? shadow,
    double radius = 0.0,
    Gradient? gradient,
    BoxShape shape = BoxShape.rectangle,
    BoxFit fit = BoxFit.cover,
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      width: w,
      height: h,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: fit),
          border: border,
          boxShadow: shadow,
          borderRadius: BorderRadius.circular(radius),
          gradient: gradient,
          shape: shape,
        ),
      ),
    );
  }

  Widget loadJson<T>(
          {required String assets, required AsyncWidgetBuilder<T> builder}) =>
      FutureBuilder<T>(
        future:
            rootBundle.loadString(assets).then((value) => jsonDecode(value)),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            return builder(context, snapshot);
          }
          return SizedBox.shrink();
        },
      );

  Widget refresh(
    RefreshMixin controller, {
    Widget? header,
  }) {
    return PullToRefresh(
      controller: controller,
      header: header,
      child: this,
    );
  }

  Widget sbox() {
    return SliverToBoxAdapter(
      child: this,
    );
  }
}

extension ExtensionText on Text {
  Text s96() => Text(data ?? '', style: style?.copyWith(fontSize: 96));
  Text s60() => Text(data ?? '', style: style?.copyWith(fontSize: 60));
  Text s48() => Text(data ?? '', style: style?.copyWith(fontSize: 48));
  Text s40() => Text(data ?? '', style: style?.copyWith(fontSize: 40));
  Text s34() => Text(data ?? '', style: style?.copyWith(fontSize: 34));
  Text s24() => Text(data ?? '', style: style?.copyWith(fontSize: 24));
  Text s18() => Text(data ?? '', style: style?.copyWith(fontSize: 18));
  Text s16() => Text(data ?? '', style: style?.copyWith(fontSize: 16));
  Text s14() => Text(data ?? '', style: style?.copyWith(fontSize: 14));
  Text s12() => Text(data ?? '', style: style?.copyWith(fontSize: 12));
  Text s10() => Text(data ?? '', style: style?.copyWith(fontSize: 10));
  Text s8() => Text(data ?? '', style: style?.copyWith(fontSize: 8));

  Text white() => Text(data ?? '', style: style?.copyWith(color: Colors.white));

  Text black() =>
      Text(data ?? '', style: style?.copyWith(color: Colors.black87));

  Text grey() => Text(data ?? '', style: style?.copyWith(color: Colors.grey));

  Text light() =>
      Text(data ?? '', style: style?.copyWith(fontWeight: FontWeight.w200));

  Text bold() =>
      Text(data ?? '', style: style?.copyWith(fontWeight: FontWeight.bold));
}

extension ExtensionContainer on Container {
  Widget height(height) {
    return Container();
  }
}
