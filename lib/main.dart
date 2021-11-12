import 'package:flutter/material.dart';
import 'package:lets_walk/screens/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CROSS FITNESS',
      debugShowCheckedModeBanner: false,
      home: WelcomView(),
    );
  }
}



