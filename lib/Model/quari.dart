class Qari {
  String? name;
  String? path;
  String? forma;

  Qari({this.name, this.path, this.forma});
  factory Qari.fromJson(Map<String, dynamic> json) {
    return Qari(
      name: json['name'],
      path: json['relative_path'],
      forma: json['file_formats'],
    );
  }
}
// To parse this JSON data, do
//
//     final qari = qariFromJson(jsonString);
//
// import 'dart:convert';
//
// List<Qari> qariFromJson(String str) => List<Qari>.from(json.decode(str).map((x) => Qari.fromJson(x)));
//
// String qariToJson(List<Qari> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class Qari {
//   int? id;
//   String? name;
//   String? arabicName;
//   String? relativePath;
//   String? fileFormats;
//   int? sectionId;
//   bool? home;
//   String? description;
//   String? torrentFilename;
//   String? torrentInfoHash;
//   int? torrentSeeders;
//   int? torrentLeechers;
//
//   Qari({
//     this.id,
//     this.name,
//     this.arabicName,
//     this.relativePath,
//     this.fileFormats,
//     this.sectionId,
//     this.home,
//     this.description,
//     this.torrentFilename,
//     this.torrentInfoHash,
//     this.torrentSeeders,
//     this.torrentLeechers,
//   });
//
//   factory Qari.fromJson(Map<String, dynamic> json) => Qari(
//     id: json["id"],
//     name: json["name"],
//     arabicName: json["arabic_name"],
//     relativePath: json["relative_path"],
//     fileFormats: json["file_formats"],
//     sectionId: json["section_id"],
//     home: json["home"],
//     description: json["description"],
//     torrentFilename: json["torrent_filename"],
//     torrentInfoHash: json["torrent_info_hash"],
//     torrentSeeders: json["torrent_seeders"],
//     torrentLeechers: json["torrent_leechers"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "arabic_name": arabicName,
//     "relative_path": relativePath,
//     "file_formats": fileFormats,
//     "section_id": sectionId,
//     "home": home,
//     "description": description,
//     "torrent_filename": torrentFilename,
//     "torrent_info_hash": torrentInfoHash,
//     "torrent_seeders": torrentSeeders,
//     "torrent_leechers": torrentLeechers,
//   };
// }
//
