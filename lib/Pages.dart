import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class myPages extends StatefulWidget {
  const myPages({super.key});

  @override
  State<myPages> createState() => _myPagesState();
}

class _myPagesState extends State<myPages> {
  List surahtext = [];
  Future<void> loadSurah() async {
    final response = await rootBundle.loadString('assets/uthmani.json');
    final sdata = await json.decode(response);

    setState(() {
      surahtext = sdata['ayahs'];
    });
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
                  itemCount: surahtext.length,
                  itemBuilder: (context, index) {
                    return Card(
                        color: Colors.orange,
                        child: ListTile(
                          title: Text(surahtext[index]["surah"]["name"]),
                        ));
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
