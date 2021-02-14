//ref: https://covid19.th-stat.com/en/api

import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(Covid19ThApp());
}

class Covid19ThApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Thailand',
      home: MainScreen(),
    );
  }
}
