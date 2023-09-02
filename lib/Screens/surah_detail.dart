import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/Services/api_services.dart';
import 'package:quran/helpers/constants.dart';

import '../widgets/translation_tile.dart';

class SurahDetail extends StatelessWidget {
  SurahDetail({Key? key}) : super(key: key);
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiServices.getTranslation(Constants.surahIndex!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Constants.kSwatchColor[600],
              ),
            );
          }
          if (snapshot.hasData) {
            print("${snapshot.data!.translationList.length} length");
            return ListView.builder(
              itemBuilder: (context, index) {
                return TranslationTile(
                    index: index,
                    surahTranslation: snapshot.data!.translationList[index]);
              },
              itemCount: snapshot.data!.translationList.length,
            );
          } else {
            return CircularProgressIndicator(
              color: Constants.kSwatchColor[600],
            );
          }
        },
      ),
    );
  }
}
