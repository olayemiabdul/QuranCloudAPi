import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:quranui/model/quranaudio.dart';
import 'package:quranui/model/surah.dart';

class ApiServices {
  //using this because sural is an array

  // final endPointurl = " http://api.alquran.cloud/v1/surah";
  // List<Ayah> surahlist = [];

  // Future<List<Ayah>> getSurah() async {
  //   Response surahRes = await http.get(Uri.parse(endPointurl));
  //   if (surahRes.statusCode == 200) {
  //     Map<String, dynamic> json = jsonDecode(surahRes.body);
  //     json['data'].forEach((element) {
  //       if (surahlist.length < 114) {\
  //         surahlist.add(Ayah.fromJson(element));
  //       }
  //     });
  //     print('${surahlist.length}');
  //     return surahlist;
  //   } else {
  //     throw ('check your connectivity');
  //   }
  // }

  // for jus

  Future<SurahText> getCompleteQuran() async {
    final endPointjusurlQuran =
        "http://api.alquran.cloud/v1/quran/quran-uthmani";
    final jusRes = await http.get(Uri.parse(endPointjusurlQuran));
    if (jusRes.statusCode == 200) {
      return SurahText.fromJson(json.decode(jusRes.body));
    } else {
      throw ('check your connectivity');
    }
  }

  Future<QuranAudio> getQuranAudioFile() async {
    final endPointQuranAudio = "http://api.alquran.cloud/v1/quran/ar.alafasy";
    final jusRes = await http.get(Uri.parse(endPointQuranAudio));
    if (jusRes.statusCode == 200) {
      return QuranAudio.fromJson(json.decode(jusRes.body));
    } else {
      throw ('check your connectivity');
    }
  }

  Future<SurahText> getQuraSurahFile() async {
    final endPointQuranAudio = "http://api.alquran.cloud/v1/quran/ar.alafasy";
    final jusRes = await http.get(Uri.parse(endPointQuranAudio));
    if (jusRes.statusCode == 200) {
      return SurahText.fromJson(json.decode(jusRes.body));
    } else {
      throw ('check your connectivity');
    }
  }

  List<SurahText> myModels = [];
  Future<List<SurahText>> getModel() async {
    final endPointQuranurl = "http://api.alquran.cloud/v1/quran/quran-uthmani";
    final jusRes = await http.get(Uri.parse(endPointQuranurl));

    myModels =
        (json.decode(jusRes.body)).map((i) => SurahText.fromJson(i)).toList();
    return myModels;
  }

  Future<List<Surahss>> getSurahverse() async {
    final Quranurl = "http://api.alquran.cloud/v1/quran/quran-uthmani";
    Response response = await http.get(Uri.parse(Quranurl));
    var rb = response.body;

    // store json data into list
    var abdlist = json.decode(rb) as List;

    // iterate over the list and map each object in list to Img by calling Img.fromJson
    List<Surahss> verses = abdlist.map((i) => Surahss.fromJson(i)).toList();

    print(verses.runtimeType); //returns List<Img>
    print(verses[0].runtimeType); //returns Img

    return verses;
  }
}
