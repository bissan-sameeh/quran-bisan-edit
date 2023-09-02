import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/Screens/qari_screen.dart';
import 'package:quran/Screens/home_screen0.dart';
import 'package:quran/Screens/prayer_screen.dart';
import 'package:quran/Screens/quran_screen.dart';
import 'package:quran/helpers/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedItem = 0;
  final List<Widget> _widgetList = [
    const HomeScreen(),
    const QuranScreen(),
    const QariScreen(),
    const PrayerScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: _widgetList[_selectedItem],
            bottomNavigationBar: ConvexAppBar(
              height: 70,
              items: [
                TabItem(
                    icon: Image.asset(
                      "assets/images/home.png",
                      color: Colors.white,
                    ),
                    title: 'Home'),
                TabItem(
                    icon: Image.asset(
                      "assets/images/holyQuran.png",
                      color: Colors.white,
                    ),
                    title: 'Quran'),
                TabItem(
                    icon: Image.asset(
                      "assets/images/audio.png",
                      color: Colors.white,
                      height: 30,
                    ),
                    title: 'Audio'),
                TabItem(
                    icon: Image.asset(
                      "assets/images/mosque.png",
                      color: Colors.white,
                    ),
                    title: 'Prayer'),
              ],
              initialActiveIndex: 0,
              onTap: update,
              backgroundColor: Constants.KPrimary,
              activeColor: Constants.KPrimary,
            )));
  }

  void update(int index) {
    setState(() {
      _selectedItem = index;
    });
  }
}
