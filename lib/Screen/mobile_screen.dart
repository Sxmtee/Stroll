import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:taskone/Common/Utils/color.dart';
import 'package:taskone/Common/Utils/stroll_icon_icons.dart';
import 'package:taskone/Features/Home/screens/home_screen.dart';

class MobileScreen extends StatefulWidget {
  static const routeName = "/Mobile-screen";
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  List<Widget> items = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (currentIndex != 0) {
          setState(() {
            currentIndex = 0;
          });
          didPop = false;
        }
        didPop = true;
      },
      child: Scaffold(
        body: items[currentIndex],
        bottomNavigationBar: AnimatedBottomNavigationBar(
          activeIndex: currentIndex,
          backgroundColor: Colors.black,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          activeColor: AppColors.primaryColor,
          inactiveColor: AppColors.white,
          elevation: 20,
          shadow: Shadow(color: AppColors.black),
          splashColor: AppColors.primaryColor,
          splashSpeedInMilliseconds: 500,
          gapLocation: GapLocation.none,
          icons: const [
            StrollIcon.heart,
            StrollIcon.flame,
            StrollIcon.chat,
            StrollIcon.person,
          ],
        ),
      ),
    );
  }
}
