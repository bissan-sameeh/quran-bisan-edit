import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin navegetorHelper {
  void jump(
      {required BuildContext context,
      required Widget to,
      bool replace = false}) {
    if (replace) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => to,
          ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => to,
          ));
    }
  }
}
