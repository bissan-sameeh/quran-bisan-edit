import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/Model/quari.dart';
import 'package:quran/Services/api_services.dart';
import 'package:quran/helpers/constants.dart';
import 'package:quran/helpers/navigetor.dart';
import '../widgets/audio_tile.dart';
import 'audio_screen.dart';

class AudioSurahScreen extends StatefulWidget {
  const AudioSurahScreen({Key? key, required this.qari}) : super(key: key);
  final Qari qari;

  @override
  State<AudioSurahScreen> createState() => _AudioSurahScreenState();
}

class _AudioSurahScreenState extends State<AudioSurahScreen>
    with navegetorHelper {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.KPrimary,
        title: const Text("Surah List",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: apiServices.getSurah(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return AudioTile(
                    surahName: snapshot.data![index].name,
                    totalAyahs: snapshot.data![index].numberOfAyahs,
                    number: snapshot.data![index].number,
                    onTap: () {
                      jump(
                          context: context,
                          to: AudioScreen(
                              qari: widget.qari,
                              index: index + 1,
                              list: snapshot.data));
                    });
              },
              itemCount: snapshot.data?.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Constants.KPrimary,
              ),
            );
          }
        },
      )),
    );
  }
}
