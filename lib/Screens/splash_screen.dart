import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/Screens/onboardin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/navigetor.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with navegetorHelper {
  bool alreadyUsed = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        return jump(
            context: context,
            to: alreadyUsed ? const MainScreen() : const OnBoardingScreen());
      },
    );
  }

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    alreadyUsed = prefs.getBool("alreadyUser") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          const Center(
              child: Text(
            "Muslim Soul",
            style: TextStyle(color: Colors.black26, fontSize: 30),
          )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset("assets/images/islamic.png"))
        ],
      ),
    ));
  }
}
