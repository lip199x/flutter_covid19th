import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class Covid19BottomMenu extends StatelessWidget {
  final _currentBottomMenuIndex;
  final Function setMenu;

  Covid19BottomMenu(this.setMenu, this._currentBottomMenuIndex);

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      backgroundColor: Colors.black,
      selectedIndex: _currentBottomMenuIndex,
      iconSize: 30,
      items: [
        BottomNavyBarItem(
          title: Text("Today"),
          icon: Icon(
            Icons.sick,
            color: Colors.blue,
          ),
          activeColor: Colors.white,
        ),
        BottomNavyBarItem(
          title: Text("Chart"),
          icon: Icon(
            Icons.bar_chart,
            color: Colors.green,
          ),
          activeColor: Colors.white,
        ),
        BottomNavyBarItem(
          title: Text("About"),
          icon: Icon(
            Icons.contact_support,
            color: Colors.yellow,
          ),
          activeColor: Colors.white,
        )
      ],
      onItemSelected: (index) {
        setMenu(index);
      },
    );
  }
}
