import 'package:flutter/material.dart';
import 'package:quran/helpers/constants.dart';

import 'Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muslim Soul',
      theme: ThemeData(
          primarySwatch: Constants.kSwatchColor,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Pippins"),
      home: SplashScreen(),
    );
  }
}
