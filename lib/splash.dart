import 'dart:async';

import 'package:efoodtrain/homepage.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Homepage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(
        padding: const EdgeInsets.all(8.0),
    child: Text(
      " E-FOOD TRAIN",
      style: TextStyle(
          fontSize: 30,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent),
    ),
        ),             Center(

            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/trainn.png")),
              ),
            ),
          ),

        ],
        ),

        );
    }
}
