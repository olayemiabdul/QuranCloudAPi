import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quranui/screen/qurandetailsPage.dart';

import '../model/quranaudio.dart';

class myPage3 extends StatefulWidget {
  const myPage3({super.key});

  @override
  State<myPage3> createState() => _myPage3State();
}

class _myPage3State extends State<myPage3> {
  List surahtext = [];
  List<Surah> allPages = [];

  Future<void> readSurah() async {
    final String response = await rootBundle.loadString('assets/ayah.json');
    final sdata = await json.decode(response);
    var mylist = sdata["surahs"] as List<dynamic>;

    setState(() {
      //surahtext = sdata['surahs'];
      allPages = [];
      allPages = mylist.map((e) => Surah.fromJson(e)).toList();
    });
    //return sdata.map<NewQuranPages>(NewQuranPages.fromJson).toList();
  }
  // Future<List<QuranAudio>> readSurah() async {
  //   String abdullahi =
  //       await DefaultAssetBundle.of(context).loadString('assets/ayah.json');

  //   List abdullahiData = jsonDecode(abdullahi);

  //   List<QuranAudio> quran =
  //       abdullahiData.map((ola) => QuranAudio.fromJson(ola)).toList();
  //   return quran;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readSurah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ElevatedButton(
          //   onPressed: readSurah,
          //   child: Text('load surah'),
          // ),
          //if (filPages.length > 0)
          Expanded(
            child: FutureBuilder(
              future: readSurah(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return ListView.builder(
                  primary: false,
                    itemCount: allPages.length,
                    itemBuilder: (context, index) {
                      return Expanded(
                        child: Card(
                          color: Colors.orangeAccent,
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(allPages[index].englishName.toString()),
                                SizedBox(width: 5),
                                Text(
                                    "(- ${allPages[index].englishNameTranslation.toString()} )")
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(allPages[index].revelationType.toString()),
                                SizedBox(width: 5),
                                Text(
                                    "(- ${allPages[index].number.toString()} verses )")
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
                                allPages[index].number.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            trailing: Text(allPages[index].name.toString()),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return MyQuranPage(
                                  ayahdetails: allPages[index],
                                );
                              })));
                            },
                          ),
                        ),
                      );
                    });
              },
            ),
          )
          //else
          // Container(
          //   child: Text('load detais'),
          // ),
        ],
      ),
    );
  }
}
