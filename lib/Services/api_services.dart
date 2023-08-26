import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as https;

import '../Model/aya_class.dart';

class ApiServices {
  Future<Ayah> getAyaOfDay() async {
    String url =
        "http://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall";
    final https.Response response = await https.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("kkk");
      return ayahFromJson(response.body);
    } else {
      throw Exception("Field to connect with api");
    }
  }

  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }
}
