import 'package:flutter/material.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import '../model/quranaudio.dart';

class MyQuranPage extends StatefulWidget {
  final Surah ayahdetails;

  MyQuranPage({super.key, required this.ayahdetails});

  @override
  State<MyQuranPage> createState() => _MyQuranPageState();
}

class _MyQuranPageState extends State<MyQuranPage> {
  ArabicNumbers arabicNumber = ArabicNumbers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Row(children: [
            Text(widget.ayahdetails.number.toString(),style: TextStyle(fontSize: 10),),
            Text(
              "(- ${widget.ayahdetails.englishName.toString()} )",
              style: TextStyle(fontSize: 10),
            )
          ]),
          SizedBox(width: 10),
          Text(
            "  ${widget.ayahdetails.englishNameTranslation.toString()}, ",
            style: TextStyle(fontSize: 10),
          ),
          SizedBox(width: 10),
          Text(
            "(- ${widget.ayahdetails.name.toString()} )",
            style: TextStyle(fontSize: 10),
          )
        ]),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: widget.ayahdetails.ayahs.length,
            primary: false,
            itemBuilder: (context, index) {
              var pagee = widget.ayahdetails.number!;
              increasePage() {
                setState(() {
                  pagee++;
                });
              }

              return InkWell(
                onTap: () {
                  increasePage();
                  print(pagee);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Align(
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: Text(
                                arabicNumber.convert(widget
                                    .ayahdetails.ayahs[index].numberInSurah
                                    .toString()),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 5),
                            // Text(widget.ayahdetails.ayahs[index].sajda
                            //     .toString()),
                            Flexible(
                              child: Text(
                                widget.ayahdetails.ayahs[index].text.toString(),
                                maxLines: 10,
                                softWrap: true,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontFamily: 'Kitab-Bold',
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
