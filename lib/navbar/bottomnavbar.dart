// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, use_key_in_widget_constructors, library_private_types_in_public_api, unused_field, dead_code, avoid_unnecessary_containers

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:integra_mobile/screens/beranda/screen_beranda.dart';
import 'package:integra_mobile/screens/notifications/screen_notifications.dart';
import 'package:integra_mobile/screens/profile/screen_profile.dart';
import 'package:integra_mobile/value/theme.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  final ScreenBeranda _screenBeranda = ScreenBeranda();
  // final ScreenActivity _screenActivity = ScreenActivity();
  // final RewardsPage _rewardsPage = RewardsPage();
  final ScreenNotifications _screenNotifications = ScreenNotifications();
  final ScreenProfile _screenProfile = ScreenProfile();

  Widget _showPage = ScreenBeranda();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _screenBeranda;
        break;
      // case 1:
      //   return _screenActivity;
      //   break;
      // case 2:
      //   return _rewardsPage;
      //   break;
      case 3:
        return _screenNotifications;
        break;
      case 4:
        return _screenProfile;
        break;
      default:
        return Container(
          child: Center(
            child: Text(
              'No Page',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        );
    }
  }

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 55.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.repeat,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.card_giftcard,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
        color: darkblue,
        buttonBackgroundColor: primaryGreen,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.decelerate,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedindex) {
          setState(() {
            _showPage = _pageChooser(tappedindex);
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
