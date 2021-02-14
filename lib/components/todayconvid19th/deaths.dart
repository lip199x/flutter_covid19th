import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Deaths extends StatelessWidget {
  const Deaths({
    Key key,
    @required this.numberNewDeaths,
    @required this.numberDeaths,
  }) : super(key: key);

  final int numberNewDeaths;
  final int numberDeaths;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "เสียชีวิต",
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
            padding: EdgeInsets.all(40),
            alignment: Alignment.center,
            child: //Code for checking null
                (numberDeaths == null || numberNewDeaths == null)
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
                              "$numberNewDeaths",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "$numberDeaths",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 42,
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
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
