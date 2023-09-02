import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/surah_class.dart';

class SurahCustomListTile extends StatelessWidget {
  const SurahCustomListTile({Key? key, required this.surah, this.onTap})
      : super(key: key);
  final Surah surah;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)]),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(right: 12),
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              child: Text(
                surah.number.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surah.englishName.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  surah.englishNameTranslation.toString(),
                  style: const TextStyle(color: Colors.black26),
                ),
              ],
            ),
            const Spacer(),
            Text(
              surah.name.toString(),
              style: const TextStyle(color: Colors.black54, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
