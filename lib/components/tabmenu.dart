import 'package:flutter/material.dart';
import '../screens/todaycovid19th.dart';
import '../screens/chart.dart';
import '../screens/about.dart';

class Covid19TabMenu extends StatelessWidget {
  final List<Widget> tabs = [
    Center(
      child: TodayCovid19Th(),
    ),
    Center(
      child: Container(
        child: CovidChartTimeline(),
      ),
    ),
    Center(
      child: Container(
        child: CovidChart(),
      ),
    ),
  ];

  final _currentTabIndex;

  Covid19TabMenu(this._currentTabIndex);

  @override
  Widget build(BuildContext context) {
    return tabs[_currentTabIndex];
  }
}
