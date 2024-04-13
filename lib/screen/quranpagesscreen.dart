import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quranui/model/quranpages.dart';


class quranPages extends StatefulWidget {
  const quranPages({super.key});

  @override
  State<quranPages> createState() => _quranPagesState();
}

class _quranPagesState extends State<quranPages> {
  List surahtext = [];
  List< Ayahsj> allPages = [];

  Future<void> readSurah() async {
    final String response = await rootBundle.loadString('assets/quranpages.json');
    final sdata = await json.decode(response);
    var mylist = sdata["ayahs"] as List<dynamic>;

    setState(() {
     
      allPages = [];
      allPages = mylist.map((e) =>  Ayahsj.fromJson(e)).toList();
    });
   
  }
 

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
                                Text(allPages[index].text.toString()),
                                const SizedBox(width: 5),
                               
                                
                              ],
                            ),
                           
                            
                           
                      
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
