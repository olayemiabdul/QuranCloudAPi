import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quranui/model/listTileclass.dart';
import 'package:http/http.dart' as http;
import 'package:quranui/model/quranaudio.dart';
import 'package:quranui/model/surah.dart';

import 'package:quranui/services/NetworkServices.dart';

class NewSurahScreen extends StatefulWidget {
  const NewSurahScreen({super.key});

  @override
  State<NewSurahScreen> createState() => _NewSurahScreenState();
}

class _NewSurahScreenState extends State<NewSurahScreen> {
  ApiServices surahApi = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: surahApi.getSurahverse(),
            //OR  use this for future:ayahDetails but futurebuilder<List<QuranAudio>>
            builder:
                (BuildContext context, AsyncSnapshot<List<Surahss>> snapshot) {
              if (snapshot.hasData) {
                List<Surahss>? olayemi = snapshot.data;
                print(olayemi!.length);
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: olayemi.length,
                      itemBuilder: (context, index) {
                        return Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //Text(olayemi[index].name.toString()),

                                      // Text(olayemi[index]
                                      //     .englishName
                                      //     .toString())
                                      Text(olayemi[index]
                                          .surahs[index]
                                          .name
                                          .toString())
                                    ],
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Text(olayemi[index]
                                            .surahs[index]
                                            .englishName
                                            .toString()),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                            "- ${olayemi[index].surahs[index].number} verses")
                                      ],
                                    ),
                                  ),
                                  leading: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                    child: Text(
                                      olayemi[index]
                                          .surahs[index]
                                          .revelationType
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  trailing: Text(
                                    olayemi[index]
                                        .surahs[index]
                                        .englishNameTranslation
                                        .toString(),
                                  ),
                                  // onTap: () {
                                  //   Navigator.push(context,
                                  //       MaterialPageRoute(builder: ((context) {
                                  //     return SurahTile(
                                  //       surahDetails: olayemi[index],
                                  //     );
                                  //   })));
                                  // }),
                            ),
                          ),),
                        );
                      }),
                );
              }
              return Center(
                child: Text('hello, keep trying'),
              );
            }),
      ),
    );
  }
}
