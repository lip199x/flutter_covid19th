import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Recovered extends StatelessWidget {
  const Recovered({
    Key key,
    @required this.numberNewRecovered,
    @required this.numberRecovered,
  }) : super(key: key);

  final int numberNewRecovered;
  final int numberRecovered;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "หายป่วยแล้ว",
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
                (numberNewRecovered == null || numberRecovered == null)
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
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "$numberNewRecovered",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "${NumberFormat("#,###").format(numberRecovered)}",
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
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
