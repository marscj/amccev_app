import 'package:app/app/modules/booking/views/booking_view.dart';
import 'package:app/app/modules/home/views/home_view.dart';
import 'package:app/app/modules/news/views/news_view.dart';
import 'package:app/app/modules/profile/views/profile_view.dart';
import 'package:app/package/persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: controller.persistentTabController,
        screens: [HomeView(), BookingView(), NewsView(), ProfileView()],
        items: [
          Tab(text: 'home'.tr, icon: Icon(FontAwesomeIcons.car)),
          Tab(text: 'booking'.tr, icon: Icon(FontAwesomeIcons.book)),
          Tab(text: 'news'.tr, icon: Icon(FontAwesomeIcons.newspaper)),
          Tab(text: 'my'.tr, icon: Icon(FontAwesomeIcons.user)),
        ]
            .map(
              (e) => PersistentBottomNavBarItem(
                icon: e.icon!,
                title: e.text,
                iconSize: 20,
                textStyle: TextStyle(fontSize: 10),
                activeColorPrimary: Theme.of(context).colorScheme.primary,
                inactiveColorPrimary: Colors.grey,
              ),
            )
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
