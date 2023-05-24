import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screens/authentication/login.dart';
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
          StorePage(),
          FavoritePage(),
          CartPage(),
          UserInfoPage()
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
                icon: Icon(Icons.favorite),
                inactiveIcon: const Icon(Icons.favorite_border),
                title: ("Favorite"),
                activeColorPrimary: ColorTheme.mainGreenColor,
                inactiveColorPrimary: ColorTheme.purpleColor,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.shopping_bag),
                inactiveIcon: const Icon(Icons.shopping_bag_outlined),
                title: ("Cart"),
                activeColorPrimary: ColorTheme.mainGreenColor,
                inactiveColorPrimary: ColorTheme.purpleColor,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.account_circle),
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
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(28.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style13, // Choose the nav bar style with this property.
    );
  }
}

// class MainScreen extends StatelessWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }