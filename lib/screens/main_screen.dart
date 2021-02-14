import 'package:flutter/material.dart';
import '../components/bottommenu.dart';
import '../components/tabmenu.dart';

class MainScreen extends StatefulWidget {
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentMenuIndex = 0;

  void setMenu(int newIndex) {
    setState(() {
      _currentMenuIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "สถานการณ์ COVID-19 ประจำวัน",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Covid19TabMenu(_currentMenuIndex),
      bottomNavigationBar: Covid19BottomMenu(setMenu, _currentMenuIndex),
    );
  }
}
