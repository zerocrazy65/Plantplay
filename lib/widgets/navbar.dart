import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/shopping/cart.dart';
import 'package:flutter_application_1/screens/shopping/favorite.dart';
import 'package:flutter_application_1/screens/shopping/store.dart';
import 'package:flutter_application_1/screens/shopping/user.dart';
import 'package:flutter_application_1/theme/style.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        const StorePage(),
        const FavoritePage(),
        const CartPage(),
        const UserInfoPage()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          inactiveIcon: const Icon(Icons.home_outlined),
          title: ("Home"),
          activeColorPrimary: ColorTheme.mainGreenColor,
          inactiveColorPrimary: ColorTheme.purpleColor,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite),
          inactiveIcon: const Icon(Icons.favorite_border),
          title: ("Favorite"),
          activeColorPrimary: ColorTheme.mainGreenColor,
          inactiveColorPrimary: ColorTheme.purpleColor,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_bag),
          inactiveIcon: const Icon(Icons.shopping_bag_outlined),
          title: ("Cart"),
          activeColorPrimary: ColorTheme.mainGreenColor,
          inactiveColorPrimary: ColorTheme.purpleColor,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.account_circle),
          inactiveIcon: const Icon(Icons.account_circle_outlined),
          title: ("Account"),
          activeColorPrimary: ColorTheme.mainGreenColor,
          inactiveColorPrimary: ColorTheme.purpleColor,
        )
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(
                0,
                -5,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0)
        ],
        borderRadius: BorderRadius.circular(28.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style13,
    );
  }
}
