import 'package:flutter/material.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import '../model/quranaudio.dart';

class MyQuranPage extends StatefulWidget {
  final Surah ayahdetails;

  const MyQuranPage({super.key, required this.ayahdetails});

  @override
  State<MyQuranPage> createState() => _MyQuranPageState();
}

class _MyQuranPageState extends State<MyQuranPage> {
  ArabicNumbers arabicNumber = ArabicNumbers();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Row(children: [
              Text(widget.ayahdetails.number.toString(),style: const TextStyle(fontSize: 10),),
              Text(
                "(- ${widget.ayahdetails.englishName.toString()} )",
                style: const TextStyle(fontSize: 10),
              )
            ]),
            const SizedBox(width: 10),
            Text(
              "  ${widget.ayahdetails.englishNameTranslation.toString()}, ",
              style: const TextStyle(fontSize: 10),
            ),
            const SizedBox(width: 10),
            Text(
              "(- ${widget.ayahdetails.name.toString()} )",
              style: const TextStyle(fontSize: 10),
            )
          ]),
        ),
        body: ListView.builder(
            itemCount: widget.ayahdetails.ayahs.length,
            primary: false,
            //scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // var pagee = widget.ayahdetails.ayahs[index].page!;
              // increasePage() {
              //   setState(() {
              //     pagee++;
              //   });
              // }

              return Padding(
                padding: const EdgeInsets.only(left: 30),
                child: ListTile(
                  title: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: Text(
                          arabicNumber.convert(widget
                              .ayahdetails.ayahs[index].numberInSurah
                              .toString()),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 5),
                      // Text(widget.ayahdetails.ayahs[index].sajda
                      //     .toString()),
                      Text(
                        widget.ayahdetails.ayahs[index].text.toString(),
                        maxLines: 2
                        ,
                        softWrap: true,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontFamily: 'Kitab-Bold',
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),

                ),
              );

            }),
      ),
    );
  }
}
