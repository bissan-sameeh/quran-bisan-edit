class Surah {
  int? number;
  String? name;
  String? englishName;
  String? revelationType;
  int? numberOfAyahs;
  String? englishNameTranslation;

  Surah(
      {this.number,
      this.englishNameTranslation,
      this.englishName,
      this.name,
      this.revelationType,
      this.numberOfAyahs});
  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
        englishNameTranslation: json["englishNameTranslation"],
        englishName: json["englishName"],
        number: json["number"],
        name: json["name"],
        revelationType: json["revelationType"],
        numberOfAyahs: json["numberOfAyahs"]);
  }
}
