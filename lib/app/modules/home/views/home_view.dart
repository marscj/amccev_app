import 'package:app/app/modules/booking/views/booking_view.dart';
import 'package:app/app/modules/cart/views/cart_view.dart';
import 'package:app/app/modules/homepage/views/homepage_view.dart';
import 'package:app/app/modules/profile/views/profile_view.dart';
import 'package:app/app/modules/shop/views/shop_view.dart';
import 'package:app/common/persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'home_tab.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: controller.persistentTabController,
        screens: [
          HomePageView(),
          BookingView(),
          ShopView(),
          CartView(),
          ProfileView()
        ],
        items: [
          HomeTab('tabs_home'.tr, FontAwesomeIcons.carBattery),
          HomeTab('tabs_booking'.tr, FontAwesomeIcons.bookOpen),
          HomeTab('tabs_shop'.tr, FontAwesomeIcons.bagShopping),
          HomeTab('tabs_cart'.tr, FontAwesomeIcons.cartShopping),
          HomeTab('tabs_my'.tr, FontAwesomeIcons.user),
        ]
            .map((e) => PersistentBottomNavBarItem(
                  icon: Icon(e.icon),
                  title: e.title,
                  iconSize: 20,
                  textStyle: TextStyle(fontSize: 10),
                  activeColorPrimary: Theme.of(context).colorScheme.primary,
                  inactiveColorPrimary: Colors.grey,
                ))
            .toList(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: false, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        // screenTransitionAnimation: ScreenTransitionAnimation(
        //   // Screen transition animation on change of selected tab.
        //   animateTabTransition: true,
        //   curve: Curves.ease,
        //   duration: Duration(milliseconds: 200),
        // ),
        navBarStyle:
            NavBarStyle.simple, // Choose the nav bar style with this property.
      ),
    );
  }
}
