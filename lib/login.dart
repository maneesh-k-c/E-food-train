import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:efoodtrain/Restaurant/restaurantpage.dart';
import 'package:efoodtrain/admin/adminhome.dart';
import 'package:efoodtrain/deliveryboy/deliveryhome.dart';
import 'package:efoodtrain/pantry/pantryhome.dart';
import 'package:efoodtrain/registeration.dart';
import 'package:efoodtrain/signupall.dart';
import 'package:efoodtrain/user/userhome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'API/api.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  TextEditingController passcontroller=TextEditingController();
  TextEditingController usercontroller = TextEditingController();
  bool _isLoading = false;

  late SharedPreferences localStorage;
  late String username;
  late String role;
  late String status;

  _pressLoginButton() async {
    setState(() {
      _isLoading = true;
    });
    if (usercontroller.text =="demouser" ) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>Homie()));
    }
    else if (usercontroller.text =="demorest" ) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Resthome()));
    }
    var data = {
      'username': usercontroller.text.trim(),
      'password': passcontroller.text.trim(),
    };

    var res = await Api().authData(data,'/login/login');
    var body = json.decode(res.body);
    print("body${body}");

    print(data);
    if (body['success'] == true) {
      print(body);

      role = json.encode(body['details']['role']);
      username = json.encode(body['details']['username']);
      status = json.encode(body['details']['status']);

      print('u: ${username}');
      localStorage = await SharedPreferences.getInstance();
      localStorage.setString('role', role.toString());
      localStorage.setString('login_id', json.encode(body['login_id']));
      localStorage.setString('user_id', json.encode(body['user_id']));
      localStorage.setString('status', json.encode(body['status']));
      localStorage.setString('restaurant_id', json.encode(body['restaurant_id']));
      localStorage.setString('username', username.toString());
      localStorage.setBool('isLoggedIn', false);
      print('login_idss ${json.encode(body['login_id'])}');

      print('role: ${role}');
      print('role: ${role.runtimeType}');
      print('status: ${status}');

      String user='1';
      String restaurant='2';
      String deliveryboy='4';
      String pantry="3";
      String admin="0";
      String storedvalue = '1';

      if (admin == role.replaceAll('"', '')) {
        print('data: $data');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Adminhome()));
      } else if (user == role.replaceAll('"', '') && storedvalue == status.replaceAll('"', '')) {
        print('data: $data');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Homie()));
      } else if (restaurant == role.replaceAll('"', '') && storedvalue == status.replaceAll('"', '')) {
        print('data: $data');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Resthome()));
      } else if (pantry == role.replaceAll('"', '') && storedvalue == status.replaceAll('"', '')) {
        print('data: $data');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Pantryhome()));
      }
      else if (deliveryboy == role.replaceAll('"', '') && storedvalue == status.replaceAll('"', '')) {
        print('data: $data');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Deliveryhome()));
      }
      else{
        Fluttertoast.showToast(
          msg: "Please wait for admin approval",
          backgroundColor: Colors.grey,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 40,fontWeight: FontWeight.bold,color: Colors.lightBlue.shade800,
                  ),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(30.0),
                 child: Text(
                  "welcome back..",
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     color:Colors.lightBlue.shade800,
              ),
               ),
               ),

              Padding(
                padding: const EdgeInsets.only(left: 100.0,right: 100.0, bottom:20),
                child: TextField(
                  controller: usercontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    labelText: "username"
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0,right: 100.0,),
                child: TextField(
                  controller: passcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    labelText: "password"


                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
               width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue.shade800,
                          onPrimary: Colors.white70,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                      onPressed: () {
                        _pressLoginButton();
                        },
                      child: Text("login"))
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(text: ' SignUp',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Signupall()));
                                    }

                              )
                            ]
                        ),
                      ),
                      ),
                  ),
            ],

          ),
        ),
      ),

    );
  }
}
