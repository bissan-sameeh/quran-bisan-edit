import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/quari.dart';

class QariCustomTile extends StatelessWidget {
  const QariCustomTile({Key? key, required this.qari, required this.onTap})
      : super(key: key);
  final Qari qari;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(8),
              shape: BoxShape.rectangle,
              boxShadow: const [
                BoxShadow(
                    blurRadius: 3, color: Colors.black12, offset: Offset(0, 1))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  qari.name.toString(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
