import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/Model/surah_class.dart';
import 'package:quran/Screens/juz_screen.dart';
import 'package:quran/Screens/surah_detail.dart';
import 'package:quran/Services/api_services.dart';
import 'package:quran/helpers/constants.dart';
import 'package:quran/widgets/surah_custom_listTile.dart';

import '../helpers/navigetor.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> with navegetorHelper {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quran",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Constants.KPrimary,
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Text(
              "Surah",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            Text(
              "Sajda",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            Text(
              "hizb",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            FutureBuilder(
              future: apiServices.getSurah(),
              builder: (context, snapshot) {
                List<Surah>? surah = snapshot.data;
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return SurahCustomListTile(
                          surah: surah[index],
                          onTap: () {
                            Constants.surahIndex = index + 1;

                            jump(context: context, to: SurahDetail());
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                      itemCount: surah!.length);
                }
                return const Center(
                    child: CircularProgressIndicator(
                  color: Constants.KPrimary,
                ));
              },
            ),
            const Center(child: Text("it's a rainy here")),
            Container(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        Constants.juzIndex = (index + 1);
                      });
                      jump(context: context, to: const JuzScreen());
                    },
                    child: Card(
                      elevation: 4,
                      color: Constants.kSwatchColor[700],
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
