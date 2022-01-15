import 'package:flutter/material.dart';
import 'package:leaf_disease_detector/Screens/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disease Detector',
      home: LoginScreen(),
    );
  }
}
