// class AAyah {
//   AAyah({
//     required this.number,
//     required this.text,
//     required this.numberInSurah,
//     required this.juz,
//     required this.manzil,
//     required this.page,
//     required this.ruku,
//     required this.hizbQuarter,
//     required this.sajda,
//   });

//   final int? number;
//   final String? text;
//   final int? numberInSurah;
//   final int? juz;
//   final int? manzil;
//   final int? page;
//   final int? ruku;
//   final int? hizbQuarter;
//   final dynamic? sajda;

//   factory AAyah.fromJson(Map<String, dynamic> json) {
//     return AAyah(
//       number: json["number"],
//       text: json["text"],
//       numberInSurah: json["numberInSurah"],
//       juz: json["juz"],
//       manzil: json["manzil"],
//       page: json["page"],
//       ruku: json["ruku"],
//       hizbQuarter: json["hizbQuarter"],
//       sajda: json["sajda"],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "number": number,
//         "text": text,
//         "numberInSurah": numberInSurah,
//         "juz": juz,
//         "manzil": manzil,
//         "page": page,
//         "ruku": ruku,
//         "hizbQuarter": hizbQuarter,
//         "sajda": sajda,
//       };
// }

// class NewQuranP {
//   NewQuranP({
//     required this.ayahs,
//   });

//   final List<Ayah> ayahs;

//   factory NewQuranP.fromJson(Map<String, dynamic> json) {
//     return NewQuranP(
//       ayahs: json["ayahs"] == null
//           ? []
//           : List<Ayah>.from(json["ayahs"]!.map((x) => Ayah.fromJson(x))),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "ayahs": ayahs.map((x) => x?.toJson()).toList(),
//       };
// }

// class Ayah {
//   Ayah({
//     this.number = 0,
//     this.text = '',
//     this.numberInSurah = 0,
//     this.juz = 0,
//     this.manzil = 0,
//     this.page = 0,
//     this.ruku = 0,
//     this.hizbQuarter = 0,
//     this.sajda = false,
//     this.name = '',
//     this.englishName = '',
//     this.englishNameTranslation = '',
//     this.revelationType = '',
//     this.numberz = 0,
//   });

//   final int number;
//   final String text;
//   final int numberInSurah;
//   final int juz;
//   final int manzil;
//   final int page;
//   final int ruku;
//   final int hizbQuarter;
//   final bool sajda;
//   final String name;
//   final String englishName;
//   final String englishNameTranslation;
//   final String revelationType;
//   final int numberz;

//   factory Ayah.fromJson(Map<String, dynamic> json) {
//     return Ayah(
//       number: json["number"],
//       text: json["text"],
//       numberInSurah: json["numberInSurah"],
//       juz: json["juz"],
//       manzil: json["manzil"],
//       page: json["page"],
//       ruku: json["ruku"],
//       hizbQuarter: json["hizbQuarter"],
//       sajda: json["sajda"],
//       name: json["name"],
//       englishName: json["englishName"],
//       englishNameTranslation: json["englishNameTranslation"],
//       revelationType: json["revelationType"],
//       numberz: json["numberz"],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "number": number,
//         "text": text,
//         "numberInSurah": numberInSurah,
//         "juz": juz,
//         "manzil": manzil,
//         "page": page,
//         "ruku": ruku,
//         "hizbQuarter": hizbQuarter,
//         "sajda": sajda,
//         "name": name,
//         "englishName": englishName,
//         "englishNameTranslation": englishNameTranslation,
//         "revelationType": revelationType,
//         "numberz": numberz,
//       };
// }

class Product {

  String id;
  String code;
  String name;
  String description;
  String image;
  int price;
  String category;
  int quantity;
  String inventoryStatus;
  int rating;

  Product({this.id = "",
      this.code = "",
      this.name = "",
      this.description = "",
      this.image = "",
      this.price = 0,
      this.category = "",
      this.quantity = 0,
      this.inventoryStatus = "",
      this.rating = 0});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      category: json['category'],
      quantity: json['quantity'],
      inventoryStatus: json['inventoryStatus'],
      rating: json['rating']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['category'] = this.category;
    data['quantity'] = this.quantity;
    data['inventoryStatus'] = this.inventoryStatus;
    data['rating'] = this.rating;
    return data;
  }

}