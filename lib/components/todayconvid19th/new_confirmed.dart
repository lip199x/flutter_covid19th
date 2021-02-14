import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewConfirmed extends StatelessWidget {
  const NewConfirmed({
    Key key,
    @required this.numberNewConfirmed,
  }) : super(key: key);

  final int numberNewConfirmed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "ผู้ป่วยรายใหม่ในวันนี้",
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 15,
            fontWeight: FontWeight.bold,
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
                (numberNewConfirmed == null)
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
                            "$numberNewConfirmed",
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
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
