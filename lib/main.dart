import 'package:flutter/material.dart';
import 'package:quranui/screen/mainScreen.dart';

void main() => runApp(const QuranApp());

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuranScreen(),
    );
  }
}
