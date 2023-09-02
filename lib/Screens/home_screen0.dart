import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:quran/Model/aya_class.dart';
import 'package:quran/Screens/main_screen.dart';
import 'package:quran/Screens/onboardin_screen.dart';
import 'package:quran/Services/api_services.dart';
import 'package:quran/helpers/constants.dart';
import 'package:quran/helpers/navigetor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with navegetorHelper {
  final _hijri = HijriCalendar.now();
  ApiServices apiServices = ApiServices();
  late Future<Ayah> _data;
  late bool alreadyUsed;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = apiServices.getAyaOfDay();
    setData();
  }

  void setData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyUser", true);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var day = DateTime.now();
    HijriCalendar.setLocal('ar');
    var format = DateFormat('EEE ,d MMM yyyy');
    var formatted = format.format(day);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.22,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/background_img.jpg"))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      formatted,
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  RichText(
                      text: TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12),
                      child: Text(
                        _hijri.hDay.toString(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )),
                    WidgetSpan(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _hijri.longMonthName.toString(),
                        style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    WidgetSpan(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12),
                      child: Text(
                        " ${_hijri.hYear} AH",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )),
                  ])),
                ]),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsetsDirectional.only(top: 10, bottom: 20),
              child: Column(
                children: [
                  FutureBuilder<Ayah>(
                    future: _data,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(color: Colors.black),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(0, 1))
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Quran Aya of the Day",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: Colors.black,
                              ),
                              Text(
                                snapshot.data!.arText.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 18),
                              ),
                              Text(
                                snapshot.data!.enText.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 18),
                              ),
                              RichText(
                                  text: TextSpan(children: <InlineSpan>[
                                WidgetSpan(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data!.surNumber.toString(),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                )),
                                WidgetSpan(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data!.surEnName.toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                )),
                              ]))
                            ],
                          ),
                        );
                      } else {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Constants.KPrimary,
                        ));
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
