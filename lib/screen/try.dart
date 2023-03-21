// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:quranui/model/listTileclass.dart';
// import 'package:http/http.dart' as http;

// import 'package:quranui/model/surah.dart';

// import 'package:quranui/services/NetworkServices.dart';

// class NewSurahScreenP extends StatefulWidget {
//   const NewSurahScreenP({super.key});

//   @override
//   State<NewSurahScreenP> createState() => _NewSurahScreenPState();
// }

// class _NewSurahScreenPState extends State<NewSurahScreenP> {
//   ApiServices surahApi = ApiServices();
//   // Future<List<SurahN>> ayahDetails = getAyah();

//   // static Future<List<SurahN>> getAyah() async {
//   //   // final assetJson = DefaultAssetBundle.of(context);
//   //   // final data = await assetJson.loadString('assets/quranvalidator.json');
//   //   // final detail = json.decode(data);
//   //   // return detail.map<QuranAudio>(QuranAudio.fromJson).toList();
//   //   // var data =
//   //   //     await DefaultAssetBundle.of(context).loadString("json/parse.json");

//   //   // return userFromJson(data);
//   //   var url = 'http://api.alquran.cloud/v1/quran/ar.alafasy';
//   //   final response = await http.get(Uri.parse(url));
//   //   final data = json.decode(response.body);
//   //   return data.map<SurahN>(SurahN.fromJson).toList;

//   // }

//   Future<List<SurahText>> fetchPhotos(http.Client client) async {
//     final response = await client
//         .get(Uri.parse('http://api.alquran.cloud/v1/quran/ar.alafasy'));

//     // Use the compute function to run parsePhotos in a separate isolate.
//     return compute(parsePhotos, response.body);
//   }

// // A function that converts a response body into a List<Photo>.
//   List<SurahText> parsePhotos(String responseBody) {
//     final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//     return parsed.map<SurahText>((json) => SurahText.fromJson(json)).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: FutureBuilder<List<SurahText>>(
//             future: fetchPhotos(http.Client()),
//             //OR  use this for future:ayahDetails but futurebuilder<List<QuranAudio>>
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return MyListView(surahpost:ayh );
//               } else if (snapshot.hasError) {
//                 return const Center(
//                   child: Text('An error has occurred!'),
//                 );
//               }
//               return Center(
//                 child: Text('hello, keep trying'),
//               );
//             }),
//       ),
//     );
//   }
// }

// class MyListView extends StatelessWidget {
//   const MyListView({super.key, required this.surahpost});

//   final List<Surahss> surahpost;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         itemCount: surahpost.length,
//         itemBuilder: (context, index) {
//           return Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListTile(
//                     title: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //Text(olayemi[index].name.toString()),

//                         // Text(olayemi[index]
//                         //     .englishName
//                         //     .toString())
//                         Text(surahpost[index].englishName.toString())
//                       ],
//                     ),
//                     subtitle: Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Row(
//                         children: [
//                           Text(surahpost[index].name.toString()),
//                           SizedBox(
//                             width: 2,
//                           ),
//                           Text(
//                               "- ${surahpost[index].englishNameTranslation.toString()} verses")
//                         ],
//                       ),
//                     ),
//                     leading: Container(
//                       alignment: Alignment.center,
//                       height: 30,
//                       width: 40,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.black,
//                       ),
//                       child: Text(
//                         surahpost[index].revelationType.toString(),
//                         style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                     trailing: Text(surahpost[index].englishName.toString()),
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: ((context) {
//                         return SurahTile(
//                           surahDetails: surahpost[index],
//                         );
//                       })));
//                     }),
//               ),
//             ),
//           );
//         });
//   }
// }
