import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';
import 'package:market_ecommerce/views/screens/feeds_page.dart';
import 'package:market_ecommerce/views/screens/home_page.dart';
import 'package:market_ecommerce/views/screens/notification_page.dart';
import 'package:market_ecommerce/views/screens/profile_page.dart';

class PageSwitcher extends StatefulWidget {
  const PageSwitcher({super.key});

  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  int _selectIndex = 0;

  void _handleItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomePage(),
        FeedsPage(),
        NotificationPage(),
        ProfilePage()
      ][_selectIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: AppColor.primarySoft, width: 2))),
        child: BottomNavigationBar(onTap: _handleItemTapped, items: [
          BottomNavigationBarItem(
              icon: (_selectIndex == 0)
                  ? SvgPicture.asset(AppRelativePath.homeActiveIcon)
                  : SvgPicture.asset(AppRelativePath.homeIcon),
              label: ""),
          BottomNavigationBarItem(
              icon: (_selectIndex == 1)
                  ? SvgPicture.asset(AppRelativePath.catActiveIcon)
                  : SvgPicture.asset(AppRelativePath.catIcon),
              label: ""),
          BottomNavigationBarItem(
              icon: (_selectIndex == 2)
                  ? SvgPicture.asset(AppRelativePath.notfiActiveIcon)
                  : SvgPicture.asset(AppRelativePath.notfiIcon),
              label: ""),
          BottomNavigationBarItem(
              icon: (_selectIndex == 3)
                  ? SvgPicture.asset(AppRelativePath.profileActiveIcon)
                  : SvgPicture.asset(AppRelativePath.profileIcon),
              label: ""),
        ]),
      ),
    );
  }
}
