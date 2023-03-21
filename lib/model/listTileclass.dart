import 'package:flutter/material.dart';
import 'package:quranui/model/quranaudio.dart';
import 'package:quranui/model/surah.dart';

class SurahTile extends StatelessWidget {
  final Surahss surahDetails;

  SurahTile({super.key, required this.surahDetails});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //this listview has to be wrap with a future builder to make the itemcount ==ayah length to avoid app crashing when you int like say 300 abv the ayah length

        body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<QuranAudio> snapshot) {
            return ListView.builder(
              itemCount: 400,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                    surahDetails.surahs[index].ayahs[index].text.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:quranui/model/surah.dart';

// class SurahTile extends StatelessWidget {
//   final Surahhh surahDetails;

//   SurahTile({super.key, required this.surahDetails});
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: ListTile(
//           title: Text(surahDetails.name.toString()),
//         ),
//       ),
//     );
//   }
// }
