import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/helpers/constants.dart';

class AudioTile extends StatelessWidget {
  const AudioTile(
      {Key? key, this.onTap, this.surahName, this.totalAyahs, this.number})
      : super(key: key);
  final String? surahName;
  final int? totalAyahs;
  final int? number;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 5, color: Colors.black12, offset: Offset(0, 3))
            ],
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surahName!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Total AYA : $totalAyahs",
                    style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                ],
              ),
              const Spacer(),
              Icon(
                Icons.play_circle_fill,
                color: Constants.kSwatchColor[50]!,
                size: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
