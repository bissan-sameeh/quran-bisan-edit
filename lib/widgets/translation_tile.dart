import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/Model/surah_translations.dart';
import 'package:quran/helpers/constants.dart';

class TranslationTile extends StatelessWidget {
  const TranslationTile(
      {Key? key, required this.index, required this.surahTranslation})
      : super(key: key);
  final int index;
  final SurahTranslation surahTranslation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(blurRadius: 3)]),
        child: Column(
          children: [
            Stack(
              // clipBehavior: Clip.hardEdge,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Constants.KPrimary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  padding: const EdgeInsets.only(left: 18, top: 28, bottom: 32),
                  width: double.infinity,
                ),
                Positioned(
                    top: 3,
                    left: 12,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Text(
                        surahTranslation.aya!,
                        style: TextStyle(
                            fontSize: 16,
                            color: Constants.kSwatchColor[500],
                            fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    surahTranslation.arabic_text!,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  Text(
                    surahTranslation.translation!,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
