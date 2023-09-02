import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/Services/api_services.dart';

import '../helpers/constants.dart';
import '../helpers/navigetor.dart';
import '../widgets/qari_custom_tile.dart';
import 'audio_surah_screen.dart';

class QariScreen extends StatefulWidget {
  const QariScreen({Key? key}) : super(key: key);

  @override
  State<QariScreen> createState() => _QariScreenState();
}

class _QariScreenState extends State<QariScreen> with navegetorHelper {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Qari's ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              backgroundColor: Constants.kSwatchColor[50],
              centerTitle: true,
            ),
            body: Column(children: [
              const SizedBox(
                height: 12,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 1,
                          spreadRadius: 0.0,
                          offset: Offset(0, 1)),
                    ]),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [Text("Search"), Spacer(), Icon(Icons.search)],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: FutureBuilder(
                      future: apiServices.getQariList(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return QariCustomTile(
                                    qari: snapshot.data![index],
                                    onTap: () {
                                      jump(
                                          context: context,
                                          to: AudioSurahScreen(
                                              qari: snapshot.data![index]));
                                    });
                              });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Constants.kSwatchColor[400],
                            ),
                          );
                        }
                      })),
            ])));
  }
}
