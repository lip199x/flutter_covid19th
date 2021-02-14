import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fl_chart/fl_chart.dart';

class CovidChart extends StatefulWidget {
  @override
  _CovidChartTimelineState createState() => _CovidChartTimelineState();
}

class _CovidChartTimelineState extends State<CovidChart> {
  //Code for data List Declaration
  List<FlSpot> listData = [];

  @override
  void initState() {
    super.initState();
    getCovidData();
  }

  void getCovidData() async {
    //Code Here
    http.Response response =
        await http.get('https://covid19.th-stat.com/api/open/timeline');
    if (response.statusCode == 200) {
      String data = response.body;
      List<dynamic> covidData = (jsonDecode(data)["Data"] as List<dynamic>);
      int n = 0;
      setState(() {
        for (int i = covidData.length - 16; i < covidData.length - 1; i++) {
          n++;
          listData.add(FlSpot((n - 15).toDouble(),
              (covidData[i]["Confirmed"] as int).toDouble()));
        }
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
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "ผู้ป่วยสะสม 14 วัน",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Code for checking null
              (listData == null || listData.isEmpty)
                  ? Container(
                      width: double.infinity,
                      height: 400,
                      child: SpinKitFadingCircle(
                        color: Colors.blueGrey,
                        size: 100.0,
                      ),
                    )
                  : Container(
                      color: Colors.white,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      child: LineChart(
                        LineChartData(
                            backgroundColor: Colors.white.withOpacity(0.3),
                            gridData: FlGridData(
                              show: true,
                              getDrawingHorizontalLine: (value) {
                                return FlLine(
                                  color: Colors.grey.withOpacity(0.3),
                                  strokeWidth: 1,
                                );
                              },
                            ),
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                spots: listData,
                              )
                            ]),
                      ),
                    ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
