import 'package:flutter/material.dart';

class OpenBar extends StatelessWidget {
  String showsteps = "";
  String _km = "Lets Walk";
  String _calories = "Let's Burn Calories";

  String _stepCountValue = 'Lets Walk';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            child: Card(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/distance.png"),
                      // child: Text(
                      //   "$_km Km",
                      //   textAlign: TextAlign.right,
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold, fontSize: 14.0),
                      // ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 3,
                    width: 50,
                  ),
                  Text(
                    "$_km Km",
                    textAlign: TextAlign.right,
                    style:
                    new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 10,
          ),
          Container(
            height: 150,
            width: double.infinity,
            child: Card(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/burnedx.png"),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 3,
                    width: 50,
                  ),
                  Text(
                    // _calories == 0 ? Text("Let's Burn Calories") :
                    "$_calories kCal",
                    textAlign: TextAlign.right,
                    style:
                    new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
