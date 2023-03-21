// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:quran/quran.dart' as quran;
import 'package:quranui/model/quranaudio.dart';
import 'package:quranui/services/NetworkServices.dart';
import 'package:arabic_numbers/arabic_numbers.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  ArabicNumbers arabicNumber = ArabicNumbers();
  ApiServices audioApi = ApiServices();
  final audioPlayer = AudioPlayer();
  bool nowPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        nowPlaying = event == PlayerState.playing;
      });
      audioPlayer.onDurationChanged.listen((newDuration) {
        setState(() {
          duration = newDuration;
        });
        audioPlayer.onPositionChanged.listen((newPosition) {
          setState(() {
            position = newPosition;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Text(quran.basmala),
          Divider(
            thickness: 1,
            color: Colors.black38,
          ),
          Expanded(
            child: SizedBox(
              height: 400,
              child: FutureBuilder<QuranAudio>(
                  future: audioApi.getQuranAudioFile(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuranAudio> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 300,
                          itemBuilder: (context, index) {
                            //variable to be used by the arabu=ic number paackage in leading
                            String number = snapshot.data!.data!.surahs[2]
                                .ayahs[index].numberInSurah
                                .toString();
                            return Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 20,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey,
                                          ),
                                          child: Text(
                                            arabicNumber.convert(number),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          snapshot.data!.data!.surahs[2]
                                              .ayahs[index].text
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 16,
                                            fontFamily: 'Kitab-Bold',
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    //convert english numbers from API to arabic number using the arabic package

                                    leading: Container(
                                      height: 20,
                                      width: 20,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 235, 114, 114),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5.0),
                                            bottomRight: Radius.circular(5.0),
                                            topLeft: Radius.circular(5.0),
                                            bottomLeft: Radius.circular(5.0)),
                                      ),
                                      child: IconButton(
                                        icon: Icon(nowPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow),
                                        iconSize: 10,
                                        onPressed: () async {
                                          if (nowPlaying) {
                                            await audioPlayer.pause();
                                          } else {
                                            String url = snapshot.data!.data!
                                                .surahs[2].ayahs[index].audio
                                                .toString();
                                            await audioPlayer
                                                .setSourceUrl((url));
                                            await audioPlayer.resume();
                                          }
                                        },
                                      ),
                                    ),
                                    //,
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    ));
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}
