import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:xenous_app/home_screen.dart';
import 'package:xenous_app/wallet.dart';

import 'channel.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 7, 7, 1),
      body: PersistentTabView(
        context,
        screens: _screens(),
        decoration: NavBarDecoration(
            border:
                Border(top: BorderSide(color: Color.fromRGBO(17, 17, 17, 1)))),
        items: _items(),
        resizeToAvoidBottomInset: true,
        navBarHeight: 75,
        navBarStyle: NavBarStyle.style6,
        backgroundColor: Color.fromRGBO(7, 7, 7, 1),
      ),
    );
  }

  List<Widget> _screens() {
    return [HomeScreen(), Channel()];
  }

  List<PersistentBottomNavBarItem> _items() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Color.fromRGBO(37, 37, 37, 1)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.telegram),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Color.fromRGBO(37, 37, 37, 1)),
    ];
  }
}
