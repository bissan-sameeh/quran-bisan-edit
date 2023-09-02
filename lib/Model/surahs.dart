import 'package:quran/Model/surah_class.dart';

class Surahs {
  List<Surah> surah;

  Surahs({required this.surah});

  factory Surahs.fromJson(Map<String, dynamic> json) {
    return Surahs(
      surah: json['data'],
    );
  }
}
