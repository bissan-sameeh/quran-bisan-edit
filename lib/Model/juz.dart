class JuzModel {
  final int juzNumber;
  final List<JuzAyahs> juzAyahs;

  JuzModel({required this.juzNumber, required this.juzAyahs});

  factory JuzModel.fromJson(Map<String, dynamic> json) {
    Iterable juzAyahs = json["data"]["ayahs"];
    List<JuzAyahs> juzAyahList =
        juzAyahs.map((e) => JuzAyahs.fromJson(e)).toList();
    return JuzModel(juzNumber: json["data"]["number"], juzAyahs: juzAyahList);
  }
}

class JuzAyahs {
  final String ayahsText;
  final int ayahsNumber;
  final String surahName;

  JuzAyahs(
      {required this.ayahsText,
      required this.ayahsNumber,
      required this.surahName});
  factory JuzAyahs.fromJson(Map<String, dynamic> json) {
    return JuzAyahs(
        ayahsText: json['text'],
        ayahsNumber: json["number"],
        surahName: json['surah']['name']);
  }
}
