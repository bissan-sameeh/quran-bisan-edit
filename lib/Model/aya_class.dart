class Ayah {
  final String? arText;
  final String? enText;
  final String? surEnName;
  final int? surNumber;

  Ayah({this.arText, this.enText, this.surEnName, this.surNumber});

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      arText: json['data'][0]['text'],
      enText: json['data'][2]['text'],
      surEnName: json['data'][0]['surah']['englishName'],
      surNumber: json['data'][0]['numberInSurah'],
    );
  }
}
