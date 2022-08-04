import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';

extension ExtensionAnimate on Widget {
  Widget fadeIn({Key? key}) => FadeIn(key: key, child: this);
  Widget fadeInDown({Key? key}) => FadeInDown(key: key, child: this);
  Widget fadeInDownBig({Key? key}) => FadeInDownBig(key: key, child: this);
  Widget fadeInUp({Key? key}) => FadeInUp(key: key, child: this);
  Widget fadeInUpBig({Key? key}) => FadeInUpBig(key: key, child: this);
  Widget fadeInLeft({Key? key}) => FadeInLeft(key: key, child: this);
  Widget fadeInLeftBig({Key? key}) => FadeInLeftBig(key: key, child: this);
  Widget fadeInRight({Key? key}) => FadeInRight(key: key, child: this);
  Widget fadeInRightBig({Key? key}) => FadeInRightBig(key: key, child: this);

  Widget fadeOut({Key? key}) => FadeOut(key: key, child: this);
  Widget fadeOutDown({Key? key}) => FadeOutDown(key: key, child: this);
  Widget fadeOutDownBig({Key? key}) => FadeOutDownBig(key: key, child: this);
  Widget fadeOutUp({Key? key}) => FadeOutUp(key: key, child: this);
  Widget fadeOutUpBig({Key? key}) => FadeOutUpBig(key: key, child: this);
  Widget fadeOutLeft({Key? key}) => FadeOutLeft(key: key, child: this);
  Widget fadeOutLeftBig({Key? key}) => FadeOutLeftBig(key: key, child: this);
  Widget fadeOutRight({Key? key}) => FadeOutRight(key: key, child: this);
  Widget fadeOutRightBig({Key? key}) => FadeOutRightBig(key: key, child: this);

  Widget bounceInDown({Key? key}) => BounceInDown(key: key, child: this);
  Widget bounceInUp({Key? key}) => BounceInUp(key: key, child: this);
  Widget bounceInLeft({Key? key}) => BounceInLeft(key: key, child: this);
  Widget bounceInRight({Key? key}) => BounceInRight(key: key, child: this);

  Widget elasticIn({Key? key}) => ElasticIn(key: key, child: this);
  Widget elasticInDown({Key? key}) => ElasticInDown(key: key, child: this);
  Widget elasticInUp({Key? key}) => ElasticInUp(key: key, child: this);
  Widget elasticInLeft({Key? key}) => ElasticInLeft(key: key, child: this);
  Widget elasticInRight({Key? key}) => ElasticInRight(key: key, child: this);

  Widget slideInDown({Key? key}) => SlideInDown(key: key, child: this);
  Widget slideInUp({Key? key}) => SlideInUp(key: key, child: this);
  Widget slideInLeft({Key? key}) => SlideInLeft(key: key, child: this);
  Widget slideInRight({Key? key}) => SlideInRight(key: key, child: this);

  Widget flipInX({Key? key}) => FlipInX(key: key, child: this);
  Widget flipInY({Key? key}) => FlipInY(key: key, child: this);

  Widget zoomIn({Key? key}) => ZoomIn(key: key, child: this);
  Widget zoomOut({Key? key}) => ZoomOut(key: key, child: this);

  Widget jelloIn({Key? key}) => JelloIn(key: key, child: this);

  Widget bounce({Key? key}) => Bounce(key: key, child: this);
  Widget flash({Key? key}) => Flash(key: key, child: this);
  Widget pulse({Key? key}) => Pulse(key: key, child: this);
  Widget swing({Key? key}) => Swing(key: key, child: this);
  Widget spin({Key? key}) => Spin(key: key, child: this);
  Widget spinPerfect({Key? key}) => SpinPerfect(key: key, child: this);
  Widget dance({Key? key}) => Dance(key: key, child: this);
  Widget roulette({Key? key}) => Roulette(key: key, child: this);
}
