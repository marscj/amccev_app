import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';

extension ExtensionAnimate on Widget {
  Widget fadeIn(
          {Duration duration = const Duration(milliseconds: 300),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeIn(duration: duration, delay: delay, child: this);
  Widget fadeInDown(
          {Duration duration = const Duration(milliseconds: 800),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeInDown(duration: duration, delay: delay, child: this);
  Widget fadeInDownBig(
          {Duration duration = const Duration(milliseconds: 1300),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeInDownBig(duration: duration, delay: delay, child: this);
  Widget fadeInUp(
          {Duration duration = const Duration(milliseconds: 800),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeInUp(duration: duration, delay: delay, child: this);
  Widget fadeInUpBig(
          {Duration duration = const Duration(milliseconds: 1300),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeInUpBig(duration: duration, delay: delay, child: this);
  Widget fadeInLeft(
          {Duration duration = const Duration(milliseconds: 800),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeInLeft(duration: duration, delay: delay, child: this);
  Widget fadeInLeftBig(
          {Duration duration = const Duration(milliseconds: 1300),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeInLeftBig(duration: duration, delay: delay, child: this);
  Widget fadeInRight(
          {Duration duration = const Duration(milliseconds: 800),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeInRight(duration: duration, delay: delay, child: this);
  Widget fadeInRightBig(
          {Duration duration = const Duration(milliseconds: 1200),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeInRightBig(duration: duration, delay: delay, child: this);

  Widget fadeOut(
          {Duration duration = const Duration(milliseconds: 300),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeOut(duration: duration, delay: delay, child: this);
  Widget fadeOutDown(
          {Duration duration = const Duration(milliseconds: 800),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeOutDown(duration: duration, delay: delay, child: this);
  Widget fadeOutDownBig(
          {Duration duration = const Duration(milliseconds: 1300),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeOutDownBig(duration: duration, delay: delay, child: this);
  Widget fadeOutUp(
          {Duration duration = const Duration(milliseconds: 800),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeOutUp(duration: duration, delay: delay, child: this);
  Widget fadeOutUpBig(
          {Duration duration = const Duration(milliseconds: 1300),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeOutUpBig(duration: duration, delay: delay, child: this);
  Widget fadeOutLeft(
          {Duration duration = const Duration(milliseconds: 800),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeOutLeft(duration: duration, delay: delay, child: this);
  Widget fadeOutLeftBig(
          {Duration duration = const Duration(milliseconds: 1300),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeOutLeftBig(duration: duration, delay: delay, child: this);
  Widget fadeOutRight(
          {Duration duration = const Duration(milliseconds: 800),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeOutRight(duration: duration, delay: delay, child: this);
  Widget fadeOutRightBig(
          {Duration duration = const Duration(milliseconds: 1200),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FadeOutRightBig(duration: duration, delay: delay, child: this);

  Widget bounceInDown(
          {Duration duration = const Duration(milliseconds: 1000),
          Duration delay = const Duration(milliseconds: 0)}) =>
      BounceInDown(duration: duration, delay: delay, child: this);
  Widget bounceInUp(
          {Duration duration = const Duration(milliseconds: 1000),
          Duration delay = const Duration(milliseconds: 0)}) =>
      BounceInUp(duration: duration, delay: delay, child: this);
  Widget bounceInLeft(
          {Duration duration = const Duration(milliseconds: 1000),
          Duration delay = const Duration(milliseconds: 0)}) =>
      BounceInLeft(duration: duration, delay: delay, child: this);
  Widget bounceInRight(
          {Duration duration = const Duration(milliseconds: 1000),
          Duration delay = const Duration(milliseconds: 0)}) =>
      BounceInRight(duration: duration, delay: delay, child: this);

  Widget elasticIn(
          {Duration duration = const Duration(milliseconds: 1000),
          Duration delay = const Duration(milliseconds: 0)}) =>
      ElasticIn(duration: duration, delay: delay, child: this);
  Widget elasticInDown(
          {Duration duration = const Duration(milliseconds: 1000),
          Duration delay = const Duration(milliseconds: 0)}) =>
      ElasticInDown(duration: duration, delay: delay, child: this);
  Widget elasticInUp(
          {Duration duration = const Duration(milliseconds: 1000),
          Duration delay = const Duration(milliseconds: 0)}) =>
      ElasticInUp(duration: duration, delay: delay, child: this);
  Widget elasticInLeft(
          {Duration duration = const Duration(milliseconds: 1000),
          Duration delay = const Duration(milliseconds: 0)}) =>
      ElasticInLeft(duration: duration, delay: delay, child: this);
  Widget elasticInRight(
          {Duration duration = const Duration(milliseconds: 1000),
          Duration delay = const Duration(milliseconds: 0)}) =>
      ElasticInRight(duration: duration, delay: delay, child: this);

  Widget slideInDown(
          {Duration duration = const Duration(milliseconds: 600),
          Duration delay = const Duration(milliseconds: 0)}) =>
      SlideInDown(duration: duration, delay: delay, child: this);
  Widget slideInUp(
          {Duration duration = const Duration(milliseconds: 600),
          Duration delay = const Duration(milliseconds: 0)}) =>
      SlideInUp(duration: duration, delay: delay, child: this);
  Widget slideInLeft(
          {Duration duration = const Duration(milliseconds: 600),
          Duration delay = const Duration(milliseconds: 0)}) =>
      SlideInLeft(duration: duration, delay: delay, child: this);
  Widget slideInRight(
          {Duration duration = const Duration(milliseconds: 600),
          Duration delay = const Duration(milliseconds: 0)}) =>
      SlideInRight(duration: duration, delay: delay, child: this);

  Widget flipInX(
          {Duration duration = const Duration(milliseconds: 800),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FlipInX(duration: duration, delay: delay, child: this);
  Widget flipInY(
          {Duration duration = const Duration(milliseconds: 800),
          Duration delay = const Duration(milliseconds: 0)}) =>
      FlipInY(duration: duration, delay: delay, child: this);

  Widget zoomIn(
          {Duration duration = const Duration(milliseconds: 500),
          Duration delay = const Duration(milliseconds: 0)}) =>
      ZoomIn(duration: duration, delay: delay, child: this);
  Widget zoomOut(
          {Duration duration = const Duration(milliseconds: 500),
          Duration delay = const Duration(milliseconds: 0)}) =>
      ZoomOut(duration: duration, delay: delay, child: this);

  Widget jelloIn(
          {Duration duration = const Duration(milliseconds: 800),
          Duration delay = const Duration(milliseconds: 0)}) =>
      JelloIn(duration: duration, delay: delay, child: this);

  Widget bounce(
          {Duration duration = const Duration(milliseconds: 1300),
          Duration delay = const Duration(milliseconds: 0)}) =>
      Bounce(duration: duration, delay: delay, child: this);
  Widget flash(
          {Duration duration = const Duration(milliseconds: 800),
          Duration delay = const Duration(milliseconds: 0)}) =>
      Flash(duration: duration, delay: delay, child: this);
  Widget pulse(
          {Duration duration = const Duration(milliseconds: 1000),
          Duration delay = const Duration(milliseconds: 0)}) =>
      Pulse(duration: duration, delay: delay, child: this);
  Widget swing(
          {Duration duration = const Duration(milliseconds: 1000),
          Duration delay = const Duration(milliseconds: 0)}) =>
      Swing(duration: duration, delay: delay, child: this);
  Widget spin(
          {Duration duration = const Duration(milliseconds: 1000),
          Duration delay = const Duration(milliseconds: 0)}) =>
      Spin(duration: duration, delay: delay, child: this);
  Widget spinPerfect(
          {Duration duration = const Duration(milliseconds: 1000),
          Duration delay = const Duration(milliseconds: 0)}) =>
      SpinPerfect(duration: duration, delay: delay, child: this);
  Widget dance(
          {Duration duration = const Duration(milliseconds: 800),
          Duration delay = const Duration(milliseconds: 0)}) =>
      Dance(duration: duration, delay: delay, child: this);
  Widget roulette(
          {Duration duration = const Duration(milliseconds: 3500),
          Duration delay = const Duration(milliseconds: 0)}) =>
      Roulette(duration: duration, delay: delay, child: this);
}
