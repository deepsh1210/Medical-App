import 'package:flutter/material.dart';
import 'package:medic/widgets/LoadingWidget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:medic/constants.dart';
import 'package:medic/widgets/HomScreenButtons.dart';
import 'package:medic/widgets/VirusText.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:medic/widgets/FirstHalf.dart';

class Virus extends StatefulWidget {
  @override
  _VirusState createState() => _VirusState();
}

class _VirusState extends State<Virus> {
  List countryData;

  fetchCountryData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v2/countries");
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountryData();
  }

  void callLauncher(int number) async {
    String stringNumber = number.toString();
    String url = 'tel:$stringNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not place call';
    }
  }

  void smsLauncher(int number) async {
    String stringNumber = number.toString();
    String url = 'sms:$stringNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not place call';
    }
  }

  @override
  Widget build(BuildContext context) {
    return countryData == null
        ? LoadingWidget()
        : Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: 50, left: 20, right: 20, bottom: 30),
                      child: FirstHalf(countryData: countryData),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 15.0)
                        ],
                        color: Color(0xFF473F97),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width / 20.55),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width / 11.74),
                            child: Row(
                              children: <Widget>[
                                TextWidget('Covid-19', 30.0, Colors.white),
                                Spacer(),
                                Container(
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    shadows: [
                                      BoxShadow(color: Colors.grey),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width /
                                            41.1),
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          'images/globe.png',
                                          scale: 2,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              41.1,
                                        ),
                                        Text(
                                          'Global  ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.0),
                          TextWidget(
                              'Are you feeling sick ?', 25.0, Colors.white),
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 20.55,
                          ),
                          TextWidget(
                            hugeText,
                            16.0,
                            Colors.white70,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 13.7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              HomeScreenButtons(
                                icon: Icons.call,
                                colour: Colors.redAccent,
                                text: 'Call',
                                onPressed: () {
                                  setState(
                                    () {
                                      callLauncher(02224024353);
                                    },
                                  );
                                },
                              ),
                              HomeScreenButtons(
                                icon: Icons.sms,
                                colour: Colors.blue,
                                text: 'SMS',
                                onPressed: () {
                                  setState(() {
                                    smsLauncher(02224024353);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width / 27.4),
                  child: Center(
                      child: TextWidget('PREVENTION', 25.0, Colors.black)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'images/closeContact.png',
                          height: MediaQuery.of(context).size.width / 4.11,
                        ),
                        Text(
                          'Avoid Close',
                        ),
                        Text(' Contact')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'images/washHands.jpg',
                          height: MediaQuery.of(context).size.width / 4.11,
                        ),
                        Text(
                          'Clean your hands',
                        ),
                        Text(
                          'often',
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'images/faceMask.png',
                          height: MediaQuery.of(context).size.width / 4.11,
                        ),
                        Text(
                          'Wear a',
                        ),
                        Text(
                          'facemask',
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                )
              ],
            ),
          );
  }
}
