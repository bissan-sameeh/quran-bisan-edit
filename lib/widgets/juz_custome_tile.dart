import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/helpers/constants.dart';

import '../Model/juz.dart';

class JuzCustomTile extends StatelessWidget {
  const JuzCustomTile({Key? key, required this.list, required this.index})
      : super(key: key);
  final List<JuzAyahs> list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Constants.kSwatchColor[800],
            boxShadow: [
              BoxShadow(color: Constants.kSwatchColor[500]!, blurRadius: 3.0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(list[index].ayahsNumber.toString()),
            Text(
              list[index].ayahsText,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              textAlign: TextAlign.end,
            ),
            Text(
              list[index].surahName,
              // textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
