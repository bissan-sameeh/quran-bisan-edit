import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/Screens/onboardin_screen.dart';

import '../helpers/navigetor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with navegetorHelper {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      jump(context: context, to: const OnBoardingScreen(), replace: true);
    });
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
