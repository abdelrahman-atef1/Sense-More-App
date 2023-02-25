import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:sense_more/app_router.dart';
import 'package:sense_more/business_logic/cubit/home_cubit/home_cubit.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/presentation/screens/home_screen.dart';
import 'package:sense_more/presentation/screens/menu_screen.dart';
import 'package:sense_more/presentation/screens/messages_screen.dart';
import 'package:sense_more/presentation/screens/search_screen.dart';
import 'package:sense_more/presentation/screens/statistics_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    Key? key,
  }) : super(key: key);
  final PersistentTabController controller =
      PersistentTabController(initialIndex: 0);
  final List<Widget> buildScreens = [
    const HomeScreen(),
    const StatisticsScreen(),
    const MessagesScreen(),
    const SearchScreen(),
    const MenuScreen(),
    // const ProfileScreen(),
  ];
  final List<PersistentBottomNavBarItem> navBarsItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: ColorManager.primary,
      inactiveColorPrimary: ColorManager.disabled,
      routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          onGenerateRoute: AppRouter.generateRoute),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.chart_pie),
      title: ("Statistics"),
      activeColorPrimary: ColorManager.primary,
      inactiveColorPrimary: ColorManager.disabled,
      routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          onGenerateRoute: AppRouter.generateRoute),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.chat_bubble_text),
      title: ("Messages"),
      activeColorPrimary: ColorManager.primary,
      inactiveColorPrimary: ColorManager.disabled,
      routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          onGenerateRoute: AppRouter.generateRoute),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.search),
      title: ("Search"),
      activeColorPrimary: ColorManager.primary,
      inactiveColorPrimary: ColorManager.disabled,
      routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          onGenerateRoute: AppRouter.generateRoute),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.profile_circled),
      title: ("Profile"),
      activeColorPrimary: ColorManager.primary,
      inactiveColorPrimary: ColorManager.disabled,
      routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          onGenerateRoute: AppRouter.generateRoute),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return PersistentTabView(
            context,
            controller: controller,
            screens: buildScreens,
            items: navBarsItems,
            confineInSafeArea: true,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style12,
          );
        },
      ),
    );
  }
}
