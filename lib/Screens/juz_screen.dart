import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/Model/juz.dart';
import 'package:quran/helpers/constants.dart';

import '../Services/api_services.dart';
import '../widgets/juz_custome_tile.dart';

class JuzScreen extends StatefulWidget {
  const JuzScreen({Key? key}) : super(key: key);

  @override
  State<JuzScreen> createState() => _JuzScreenState();
}

class _JuzScreenState extends State<JuzScreen> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiServices.getJuzz(Constants.juzIndex!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Constants.kSwatchColor[500],
            ));
          } else if (snapshot.hasData) {
            print("${snapshot.data!.juzAyahs.length} length");
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "Ayahs of juz",
                      style: TextStyle(
                        color: Constants.kSwatchColor[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return JuzCustomTile(
                            list: snapshot.data!.juzAyahs,
                            index: index,
                          );
                        },
                        itemCount: 4),
                  ),
                ],
              ),
            );
          } else {
            return InkWell(
              onTap: () {
                print(snapshot.error);
              },
              child: Text("there is no data"),
            );
          }
        },
      ),
    );
  }
}
