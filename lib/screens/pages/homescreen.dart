// ignore_for_file: avoid_unnecessary_containers, unused_field
import 'package:expensify/screens/pages/expense_page.dart';
import 'package:expensify/screens/pages/statistic_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  late PersistentTabController _controller;

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      ExpensePage(),
      StatisticScreen(),
      Container(child: const Center(child: Text("Third page"))),
      Container(child: const Center(child: Text("Fourth page"))),
      Container(child: const Center(child: Text("Fifth page"))),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_filled),

        activeColorPrimary: Colors.greenAccent,
        inactiveColorPrimary: CupertinoColors.activeOrange,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.auto_graph),

        activeColorPrimary: Colors.greenAccent,
        inactiveColorPrimary: CupertinoColors.activeOrange,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add, color: Colors.black),

        activeColorPrimary: Colors.greenAccent,
        inactiveColorPrimary: CupertinoColors.activeOrange,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),

        activeColorPrimary: Colors.greenAccent,
        inactiveColorPrimary: CupertinoColors.activeOrange,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),

        activeColorPrimary: Colors.greenAccent,
        inactiveColorPrimary: CupertinoColors.activeOrange,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Colors.grey.shade200,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.linear,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style16,
    );
  }
}
