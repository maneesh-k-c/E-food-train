
import 'package:efoodtrain/deliveryboy/deliveryhome.dart';
import 'package:efoodtrain/login.dart';
import 'package:efoodtrain/splash.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}


