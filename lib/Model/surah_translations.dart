class SurahTranslationList {
  final List<SurahTranslation> translationList;

  SurahTranslationList({required this.translationList});
  factory SurahTranslationList.fromJson(Map<String, dynamic> json) {
    Iterable translation = json["result"];
    List<SurahTranslation> surahTransList =
        translation.map((e) => SurahTranslation.fromJson(e)).toList();
    print("${surahTransList.length} rrrrrrr");
    return SurahTranslationList(translationList: surahTransList);
  }
}

class SurahTranslation {
  String? sura;
  String? aya;
  String? arabic_text;
  String? translation;

  SurahTranslation(
      {required this.sura,
      required this.aya,
      required this.arabic_text,
      required this.translation});
  factory SurahTranslation.fromJson(Map<dynamic, dynamic> json) {
    return SurahTranslation(
      sura: json['sura'],
      aya: json['aya'],
      arabic_text: json['arabic_text'],
      translation: json['translation'],
    );
  }
}
