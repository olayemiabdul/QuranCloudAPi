// class Surahhh {
//   int? number;
//   String? name;
//   String? englishName;
//   String? englishNameTranslation;
//   int? numberOfAyahs;
//   String? revelationType;
//   Surahhh(
//       {required this.number,
//       required this.name,
//       required this.englishName,
//       required this.englishNameTranslation,
//       this.numberOfAyahs,
//       required this.revelationType});

//   factory Surahhh.fromJson(Map<String, dynamic> json) {
//     return Surahhh(
//       number: json['number'],
//       name: json['name'],
//       englishName: json['englishName'],
//       englishNameTranslation: json['englishNameTranslation'],
//       numberOfAyahs: json['numberOfAyahs'],
//       revelationType: json['revelationType'],
//     );
//   }
// }

// class SurahNew {
//   SurahNew({
//     required this.number,
//     required this.name,
//     required this.englishName,
//     required this.englishNameTranslation,
//     required this.revelationType,
//     required this.ayahs,
//   });

//   final int? number;
//   final String? name;
//   final String? englishName;
//   final String? englishNameTranslation;
//   final String? revelationType;
//   final List<Ayah> ayahs;

//   factory SurahNew.fromJson(Map<String, dynamic> json) {
//     return SurahNew(
//       number: json["number"],
//       name: json["name"],
//       englishName: json["englishName"],
//       englishNameTranslation: json["englishNameTranslation"],
//       revelationType: json["revelationType"],
//       ayahs: json["ayahs"] == null
//           ? []
//           : List<Ayah>.from(json["ayahs"]!.map((x) => Ayah.fromJson(x))),
//     );
//   }
// }

class SurahText {
  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  String revelationType;
  List<Ayahtext> ayahreviews;

  SurahText(
      {required this.number,
      required this.name,
      required this.englishName,
      required this.englishNameTranslation,
      required this.revelationType,
      required this.ayahreviews});

  factory SurahText.fromJson(Map<String, dynamic> json) {
    Iterable ayahreviews = json['surahs']['ayahs'];
    List<Ayahtext> ayahlist =
        ayahreviews.map((e) => Ayahtext.fromJson(e)).toList();
    return SurahText(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      revelationType: json['revelationType'],
      ayahreviews: json[ayahlist],
    );

    // ayahreviews = json['ayahreviews'] as List<dynamic>?;
    // // if the reviews are not missing
    // final List ayahreviews;
    // if (reviewsData != null) {
    //   ayahreviews = reviewsData
    //       .map((reviewData) => Ayahtext.fromJson(reviewData))
    //       // map() returns an Iterable so we convert it to a List
    //       .toList();
    // } else {
    //   ayahreviews = <Ayahtext>[];
  }
}

class Ayahtext {
  final int number;
  final String text;
  final String numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final bool sajda;
  Ayahtext(
      {required this.hizbQuarter,
      required this.juz,
      required this.manzil,
      required this.number,
      required this.numberInSurah,
      required this.page,
      required this.ruku,
      required this.sajda,
      required this.text});
  factory Ayahtext.fromJson(Map<String, dynamic> json) {
    return Ayahtext(
      hizbQuarter: json['hizbQuarterr'],
      juz: json['juz'],
      manzil: json['manzil'],
      number: json['number'],
      numberInSurah: json['numberInSurah'],
      page: json['page'],
      ruku: json['ruku'],
      sajda: json['sajda'],
      text: json['text'],
    );
  }
}

// class Surahss {
//   int? number;
//   String? name;
//   String? englishName;
//   String? englishNameTranslation;
//   String? revelationType;
//   List<Ayahss>? ayahs;

//   Surahss(
//       {this.number,
//       this.name,
//       this.englishName,
//       this.englishNameTranslation,
//       this.revelationType,
//       this.ayahs});

//   Surahss.fromJson(Map<String, dynamic> json) {
//     number = json['number'];
//     name = json['name'];
//     englishName = json['englishName'];
//     englishNameTranslation = json['englishNameTranslation'];
//     revelationType = json['revelationType'];
//     if (json['ayahs'] != null) {
//       ayahs = <Ayahss>[];
//       json['ayahs'].forEach((v) {
//         ayahs!.add(new Ayahss.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['number'] = this.number;
//     data['name'] = this.name;
//     data['englishName'] = this.englishName;
//     data['englishNameTranslation'] = this.englishNameTranslation;
//     data['revelationType'] = this.revelationType;
//     if (this.ayahs != null) {
//       data['ayahs'] = this.ayahs!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Ayahss {
//   int? number;
//   String? text;
//   int? numberInSurah;
//   int? juz;
//   int? manzil;
//   int? page;
//   int? ruku;
//   int? hizbQuarter;
//   bool? sajda;

//   Ayahss(
//       {this.number,
//       this.text,
//       this.numberInSurah,
//       this.juz,
//       this.manzil,
//       this.page,
//       this.ruku,
//       this.hizbQuarter,
//       this.sajda});

//   Ayahss.fromJson(Map<String, dynamic> json) {
//     number = json['number'];
//     text = json['text'];
//     numberInSurah = json['numberInSurah'];
//     juz = json['juz'];
//     manzil = json['manzil'];
//     page = json['page'];
//     ruku = json['ruku'];
//     hizbQuarter = json['hizbQuarter'];
//     sajda = json['sajda'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['number'] = this.number;
//     data['text'] = this.text;
//     data['numberInSurah'] = this.numberInSurah;
//     data['juz'] = this.juz;
//     data['manzil'] = this.manzil;
//     data['page'] = this.page;
//     data['ruku'] = this.ruku;
//     data['hizbQuarter'] = this.hizbQuarter;
//     data['sajda'] = this.sajda;
//     return data;
//   }
// }
class Surahss {
  Surahss({
    required this.surahs,
  });

  final List<Surah> surahs;

  factory Surahss.fromJson(Map<String, dynamic> json) {
    return Surahss(
      surahs: json["surahs"] == null
          ? []
          : List<Surah>.from(json["surahs"]!.map((x) => Surah.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "surahs": surahs.map((x) => x.toJson()).toList(),
      };
}

class Surah {
  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final List<Ayah> ayahs;

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json["number"],
      name: json["name"],
      englishName: json["englishName"],
      englishNameTranslation: json["englishNameTranslation"],
      revelationType: json["revelationType"],
      ayahs: json["ayahs"] == null
          ? []
          : List<Ayah>.from(json["ayahs"]!.map((x) => Ayah.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "revelationType": revelationType,
        "ayahs": ayahs.map((x) => x.toJson()).toList(),
      };
}

class Ayah {
  Ayah({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  final int? number;
  final String? text;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final dynamic? sajda;

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      number: json["number"],
      text: json["text"],
      numberInSurah: json["numberInSurah"],
      juz: json["juz"],
      manzil: json["manzil"],
      page: json["page"],
      ruku: json["ruku"],
      hizbQuarter: json["hizbQuarter"],
      sajda: json["sajda"],
    );
  }

  Map<String, dynamic> toJson() => {
        "number": number,
        "text": text,
        "numberInSurah": numberInSurah,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda,
      };
}

class SajdaClass {
  SajdaClass({
    required this.id,
    required this.recommended,
    required this.obligatory,
  });

  final int? id;
  final bool? recommended;
  final bool? obligatory;

  factory SajdaClass.fromJson(Map<String, dynamic> json) {
    return SajdaClass(
      id: json["id"],
      recommended: json["recommended"],
      obligatory: json["obligatory"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "recommended": recommended,
        "obligatory": obligatory,
      };
}
