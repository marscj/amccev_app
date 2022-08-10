import 'dart:convert';
import 'package:app/app/common/widgets/widgets.dart';
import 'package:app/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

extension ExtensionWidget on Widget {
  Widget container({
    double? w,
    double? h,
    Alignment? alignment,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Color? color,
    double radius = 0.0,
    BorderRadiusGeometry? borderRadius,
    BoxBorder? border,
    DecorationImage? image,
    Gradient? gradient,
    BoxShape shape = BoxShape.rectangle,
    List<BoxShadow>? shadow,
    BlendMode? backgroundBlendMode,
    BoxConstraints? constraints,
  }) {
    return Container(
        width: w,
        height: h,
        margin: margin,
        padding: padding,
        alignment: alignment,
        constraints: constraints,
        decoration: BoxDecoration(
          border: border,
          color: color,
          image: image,
          boxShadow: shadow,
          borderRadius: shape != BoxShape.rectangle
              ? null
              : borderRadius ?? BorderRadius.circular(radius),
          gradient: gradient,
          backgroundBlendMode: backgroundBlendMode,
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

  Widget refresh({Widget? header}) {
    return PullToRefresh(
      header: header,
      child: this,
    );
  }

  Widget material(
          {double elevation = 0.0,
          Color? color,
          Color? shadowColor,
          Color? surfaceTintColor,
          TextStyle? textStyle,
          BorderRadiusGeometry? borderRadius,
          ShapeBorder? shape,
          double radius = 0.0}) =>
      Material(
        type: MaterialType.card,
        elevation: elevation,
        color: color,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        textStyle: textStyle,
        // borderRadius: borderRadius ?? BorderRadius.circular(radius),
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
        child: this,
      );

  Widget positioned({
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) =>
      Positioned(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
          width: width,
          height: height,
          child: this);

  Widget gesture(GestureTapCallback? onPressed) =>
      GestureDetector(onTap: onPressed, child: this);

  Widget inkWell({GestureTapCallback? onPressed}) =>
      InkWell(onTap: onPressed, child: this);

  Widget get obx => Obx(() => this);

  Widget get expanded => Expanded(flex: 1, child: this);

  Widget get sliver => SliverToBoxAdapter(child: this);
}

extension ExtensionText on Text {
  void adf() {}
  Text get s96 => Text(data ?? '', style: style?.copyWith(fontSize: 96) ?? W96);
  Text get s60 => Text(data ?? '', style: style?.copyWith(fontSize: 60) ?? W60);
  Text get s48 => Text(data ?? '', style: style?.copyWith(fontSize: 48) ?? W48);
  Text get s40 => Text(data ?? '', style: style?.copyWith(fontSize: 40) ?? W40);
  Text get s34 => Text(data ?? '', style: style?.copyWith(fontSize: 34) ?? W34);
  Text get s24 => Text(data ?? '', style: style?.copyWith(fontSize: 24) ?? W24);
  Text get s18 => Text(data ?? '', style: style?.copyWith(fontSize: 18) ?? W18);
  Text get s16 => Text(data ?? '', style: style?.copyWith(fontSize: 16) ?? W16);
  Text get s14 => Text(data ?? '', style: style?.copyWith(fontSize: 14) ?? W14);
  Text get s12 => Text(data ?? '', style: style?.copyWith(fontSize: 12) ?? W12);
  Text get s10 => Text(data ?? '', style: style?.copyWith(fontSize: 10) ?? W10);
  Text get s8 => Text(data ?? '', style: style?.copyWith(fontSize: 8) ?? W8);

  Text get white => Text(data ?? '',
      style: style?.copyWith(color: Colors.white) ??
          TextStyle(color: Colors.white),
      maxLines: maxLines,
      overflow: overflow);

  Text get black => Text(data ?? '',
      style: style?.copyWith(color: Colors.black87) ??
          TextStyle(color: Colors.black87),
      maxLines: maxLines,
      overflow: overflow);

  Text get grey => Text(data ?? '',
      style:
          style?.copyWith(color: Colors.grey) ?? TextStyle(color: Colors.grey),
      maxLines: maxLines,
      overflow: overflow);

  Text get light => Text(data ?? '',
      style: style?.copyWith(fontWeight: FontWeight.w200) ??
          TextStyle(fontWeight: FontWeight.w200),
      maxLines: maxLines,
      overflow: overflow);

  Text get bold => Text(data ?? '',
      style: style?.copyWith(fontWeight: FontWeight.bold) ??
          TextStyle(fontWeight: FontWeight.bold),
      maxLines: maxLines,
      overflow: overflow);

  Text get single =>
      Text(data ?? '', style: style, maxLines: 1, overflow: overflow);

  Text get ellipsis => Text(data ?? '',
      style: style, maxLines: maxLines, overflow: TextOverflow.ellipsis);

  Text get clip => Text(data ?? '',
      style: style, maxLines: maxLines, overflow: TextOverflow.clip);

  Text get fade => Text(data ?? '',
      style: style, maxLines: maxLines, overflow: TextOverflow.fade);

  Text color(color) => Text(data ?? '',
      style: style?.copyWith(color: color) ?? TextStyle(color: color),
      maxLines: maxLines,
      overflow: overflow);

  Text lines(lines) =>
      Text(data ?? '', style: style, maxLines: lines, overflow: overflow);
}

extension ExtensionContainer on Container {
  Widget height(height) {
    return Container();
  }
}
