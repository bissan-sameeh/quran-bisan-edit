import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:quran/Model/aya_class.dart';
import 'package:quran/Services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<HomeScreen> {
  final _hijri = HijriCalendar.now();
  ApiServices apiServices = ApiServices();
  late Future<Ayah> _data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = apiServices.getAyaOfDay();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    var _day = DateTime.now();
    HijriCalendar.setLocal('ar');
    var _format = DateFormat('EEE ,d MMM yyyy');
    var formatted = _format.format(_day);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: _size.height * 0.22,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/background_img.jpg"))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatted,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  RichText(
                      text: TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                        child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        _hijri.hDay.toString(),
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )),
                    WidgetSpan(
                        child: Padding(
                      padding: const EdgeInsets.all(4.0),
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
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        " ${_hijri.hYear} AH",
                        style: TextStyle(fontSize: 20, color: Colors.white),
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
                    future: ApiServices().getAyaOfDay(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Quran Aya of the Day",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Divider(
                                thickness: 0.5,
                                color: Colors.black,
                              ),
                              Text(
                                snapshot.data!.dataSec![0].text.toString(),
                                style: const TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                snapshot.data!.dataSec?[0].edition?.language ==
                                        'en'
                                    ? snapshot.data!.dataSec![0].text.toString()
                                    : "",
                                style: const TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              RichText(
                                  text: TextSpan(children: <InlineSpan>[
                                WidgetSpan(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data!.dataSec![0].surah!.number
                                            .toString() ??
                                        "ii",
                                  ),
                                )),
                              ]))
                            ],
                          ),
                        );
                      }
                      return CircularProgressIndicator();
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
