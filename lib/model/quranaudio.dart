class QuranAudio {
  QuranAudio({
    required this.code,
    required this.status,
    required this.data,
  });

  final int? code;
  final String? status;
  final Data? data;

  factory QuranAudio.fromJson(Map<String, dynamic> json) {
    return QuranAudio(
      code: json["code"],
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.surahs,
    required this.edition,
  });

  final List<Surah> surahs;
  final Edition? edition;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      surahs: json["surahs"] == null
          ? []
          : List<Surah>.from(json["surahs"]!.map((x) => Surah.fromJson(x))),
      edition:
          json["edition"] == null ? null : Edition.fromJson(json["edition"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "surahs": surahs.map((x) => x.toJson()).toList(),
        "edition": edition?.toJson(),
      };
}

class Edition {
  Edition({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
  });

  final String? identifier;
  final String? language;
  final String? name;
  final String? englishName;
  final String? format;
  final String? type;

  factory Edition.fromJson(Map<String, dynamic> json) {
    return Edition(
      identifier: json["identifier"],
      language: json["language"],
      name: json["name"],
      englishName: json["englishName"],
      format: json["format"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "language": language,
        "name": name,
        "englishName": englishName,
        "format": format,
        "type": type,
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
    required this.audio,
    required this.audioSecondary,
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
  final String? audio;
  final List<String> audioSecondary;
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
      audio: json["audio"],
      audioSecondary: json["audioSecondary"] == null
          ? []
          : List<String>.from(json["audioSecondary"]!.map((x) => x)),
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
        "audio": audio,
        "audioSecondary": audioSecondary.map((x) => x).toList(),
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
