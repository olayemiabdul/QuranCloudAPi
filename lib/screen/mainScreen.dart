import 'package:flutter/material.dart';
import 'package:quranui/Pages.dart';
import 'package:quranui/screen/newscreen.dart';
import 'package:quranui/screen/page2.dart';
import 'package:quranui/screen/page3.dart';

import 'package:quranui/screen/quranAudioScreen.dart';
import 'package:quranui/screen/quranpagesscreen.dart';
import 'package:quranui/screen/try.dart';

import 'package:quranui/services/NetworkServices.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  ApiServices surahApi = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('QuranCloud Api'),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.book),
                    text: "Quran Text & Ayah Audio",
                  ),
                  // Tab(
                  //   icon: Icon(Icons.alarm),
                  //   text: "Quran & Translation",
                  // ),
                  // Tab(
                  //   icon: Icon(Icons.alarm),
                  //   text: "Translation only",
                  // ),
                  Tab(
                    icon: Icon(Icons.alarm),
                    text: "Page2 only",
                  ),
                  Tab(
                    icon: Icon(Icons.alarm),
                    text: "Page3 only",
                  ),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                AudioScreen(),
                // NewSurahScreen(),
                // myPages(),
                quranPages(),
                myPage3()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
