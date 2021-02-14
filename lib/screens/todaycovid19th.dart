import 'package:flutter/material.dart';
import '../components/todayconvid19th/deaths.dart';
import '../components/todayconvid19th/recovered.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../components/todayconvid19th/confirmed.dart';
import '../components/todayconvid19th/new_confirmed.dart';

class TodayCovid19Th extends StatefulWidget {
  @override
  _TodayCovid19ThState createState() => _TodayCovid19ThState();
}

class _TodayCovid19ThState extends State<TodayCovid19Th> {
  int numberConfirmed;
  int numberNewConfirmed;
  int numberRecovered;
  int numberNewRecovered;
  int numberDeaths;
  int numberNewDeaths;

  @override
  void initState() {
    super.initState();
    getCovidData();
  }

  void getCovidData() async {
    //Code Here
    http.Response response =
        await http.get('https://covid19.th-stat.com/api/open/today');
    if (response.statusCode == 200) {
      String data = response.body;
      setState(() {
        numberConfirmed = jsonDecode(data)["Confirmed"];
        numberNewConfirmed = jsonDecode(data)["NewConfirmed"];
        numberRecovered = jsonDecode(data)["Recovered"];
        numberNewRecovered = jsonDecode(data)["NewRecovered"];
        numberDeaths = jsonDecode(data)["Deaths"];
        numberNewDeaths = jsonDecode(data)["NewDeaths"];
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    //New Confirmed
                    child: NewConfirmed(numberNewConfirmed: numberNewConfirmed),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    //Confirmed
                    child: Confirmed(numberConfirmed: numberConfirmed),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    //Recovered
                    child: Recovered(
                        numberNewRecovered: numberNewRecovered,
                        numberRecovered: numberRecovered),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    //Deaths
                    child: Deaths(
                        numberNewDeaths: numberNewDeaths,
                        numberDeaths: numberDeaths),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
