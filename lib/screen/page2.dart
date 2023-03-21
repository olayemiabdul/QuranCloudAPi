import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quranui/screen/qurandetailsPage.dart';
import 'package:quranui/services/Newclass.dart';

class myPage2 extends StatefulWidget {
  const myPage2({super.key});

  @override
  State<myPage2> createState() => _myPage2State();
}

class _myPage2State extends State<myPage2> {
  List surahtext = [];
  Future<void> loadSurah() async {
    final response = await rootBundle.loadString('assets/uthmanitext.json');
    final sdata = await json.decode(response);
    print(sdata);

    setState(() {
      surahtext = sdata['surahs'];
    });
    //return sdata.map<NewQuranPages>(NewQuranPages.fromJson).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSurah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: loadSurah,
            child: Text('load surah'),
          ),
          if (surahtext.length > 0)
            Expanded(
              child: ListView.builder(
                  itemCount: 114,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.orange,
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(surahtext[index]["name"]),
                            SizedBox(width: 5),
                            Text(surahtext[index]["englishName"]),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text(surahtext[index]["englishNameTranslation"]),
                            SizedBox(width: 5),
                            Text(surahtext[index]["revelationType"]),
                          ],
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
                            surahtext[index]["number"].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        // trailing: Text(surahtext[index]["ayahs"][index]
                        //         ["numberInSurah"]
                        //     .toString()),
                      ),
                    );
                  }),
            )
          else
            Container(
              child: Text('load detais'),
            ),
        ],
      ),
    );
  }
}
