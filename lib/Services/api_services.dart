import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as https;
import 'package:quran/Model/juz.dart';

import '../Model/aya_class.dart';
import '../Model/quari.dart';
import '../Model/surah_class.dart';
import '../Model/surah_translations.dart';

class ApiServices {
  List<Surah> list = [];
  Future<Ayah> getAyaOfDay() async {
    String url =
        "http://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall";
    print("sss +${random(1, 6237)}");
    final https.Response response = await https.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("kkk");
      return Ayah.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Field to connect with api");
    }
  }

  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  Future<List<Surah>> getSurah() async {
    String url = "http://api.alquran.cloud/v1/surah";
    final https.Response response = await https.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      json['data'].forEach((element) {
        if (list.length < 114) {
          list.add(Surah.fromJson(element));
        }
      });
      return list;
    } else {
      throw Exception("Cannot get surah");
    }
  }

  Future<JuzModel> getJuzz(int index) async {
    String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani";
    final response = await https.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("kkk");
      print(JuzModel.fromJson(json.decode(response.body)).juzNumber);
      print(
          JuzModel.fromJson(json.decode(response.body)).juzAyahs[1].surahName);
      // print((response.body));
      return JuzModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Field to load api");
    }
  }

  Future<SurahTranslationList> getTranslation(int index) async {
    String url =
        "https://quranenc.com/api/v1/translation/sura/english_saheeh/$index";
    final response = await https.get(Uri.parse(url));
    print(response.statusCode);
    print(
        "ll ${SurahTranslationList.fromJson(jsonDecode(response.body)).translationList.length}");
    return SurahTranslationList.fromJson(jsonDecode(response.body));
  }

  List<Qari> qariList = [];
  Future<List<Qari>> getQariList() async {
    final url = "https://quranicaudio.com/api/qaris";
    final response = await https.get(Uri.parse(url));
    // return qariFromJson(response.body);
    // Iterable list=jsonDecode(response.body);
    // list.map((e) => Qari.fromJson(e)).toList();
    jsonDecode(response.body).forEach((element) {
      if (qariList.length < 20) qariList.add(Qari.fromJson(element));
    });

    qariList.sort((a, b) => a.name!.compareTo(b.name!));
    return qariList;
  }
}
