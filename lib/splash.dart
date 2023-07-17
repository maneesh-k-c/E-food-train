import 'dart:async';

import 'package:efoodtrain/Restaurant/restaurantpage.dart';
import 'package:efoodtrain/admin/adminhome.dart';
import 'package:efoodtrain/deliveryboy/deliveryhome.dart';
import 'package:efoodtrain/homepage.dart';
import 'package:efoodtrain/login.dart';
import 'package:efoodtrain/pantry/pantryhome.dart';
import 'package:efoodtrain/user/userhome.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  String user='1';
  String restaurant='2';
  String deliveryboy='4';
  String pantry="3";
   String role="";
   String status='';
  String admin="0";
  String storedvalue = '1';
  late SharedPreferences localStorage;
  Future<void> checkRoleAndNavigate() async {
    localStorage = await SharedPreferences.getInstance();
    role = (localStorage.getString('role') ?? '');
    status=(localStorage.getString('status') ?? '');
    if (admin == role.replaceAll('"', '')) {

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Adminhome()));
    } else if (user == role.replaceAll('"', '') && storedvalue == status.replaceAll('"', '')) {

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Homie()));
    } else if (restaurant == role.replaceAll('"', '') && storedvalue == status.replaceAll('"', '')) {

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Resthome()));
    } else if (pantry == role.replaceAll('"', '') && storedvalue == status.replaceAll('"', '')) {

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Pantryhome()));
    }
    else if (deliveryboy == role.replaceAll('"', '') && storedvalue == status.replaceAll('"', '')) {

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Deliveryhome()));
    }
    else{
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
    }
  }


  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 4);
    return Timer(duration, checkRoleAndNavigate);
  }

/*  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Homepage())));
  }*/
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
