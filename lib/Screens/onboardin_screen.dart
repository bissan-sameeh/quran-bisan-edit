import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quran/Screens/main_screen.dart';
import 'package:quran/helpers/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/navigetor.dart';
import 'home_screen0.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with navegetorHelper {
  late bool alreadyUser;
  void setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyUser", true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Read Quran",
            bodyWidget: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Customize your reading view,read in multiple language,listen in multiple audio",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            image: Center(child: Image.asset("assets/images/quran.png")),
          ),
          PageViewModel(
            title: "Prayer Alerts",
            bodyWidget: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose Your adhan,which prayer to be notified of and how often",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            image: Center(child: Image.asset("assets/images/prayer.png")),
          ),
          PageViewModel(
            title: "Build better habits",
            bodyWidget: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Make Islamic practices of your daily life in a way that best suits your life",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            image: Center(child: Image.asset("assets/images/zakat.png")),
          ),
        ],
        showNextButton: true,
        showSkipButton: true,
        showDoneButton: true,
        skip: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
        ),
        next: const Icon(Icons.navigate_next),
        done: const Text("Done",
            style:
                TextStyle(fontWeight: FontWeight.w700, color: Colors.black26)),
        onDone: () {
          // On Done button pressed

          jump(context: context, to: const MainScreen());
        },
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.secondary,
          color: Constants.KPrimary,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    ));
  }
}
