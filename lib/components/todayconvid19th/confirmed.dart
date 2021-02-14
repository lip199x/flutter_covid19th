import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class Confirmed extends StatelessWidget {
  const Confirmed({
    Key key,
    @required this.numberConfirmed,
  }) : super(key: key);

  final int numberConfirmed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "ผู้ป่วยยืนยันสะสม",
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: //Code for checking null
                (numberConfirmed == null)
                    ? SpinKitFadingCircle(
                        color: Colors.white,
                        size: 50,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            "${NumberFormat("#,###").format(numberConfirmed)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "ราย",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
