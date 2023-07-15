

import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black,
              ),
            ),
          ),
        Padding(
        padding: const EdgeInsets.all(30.0),
    child: Text(
    "create an account",
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color:Colors.black,



            ),
          ),

    ),
          Padding(
            padding: const EdgeInsets.only(left: 100.0,right: 100.0, bottom:50),
            child: TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.black
                ),

                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),

                  labelText: "email"



              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100.0,right: 100.0, bottom:50),
            child: TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.black
                ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  labelText: "password"

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100.0,right: 100.0, bottom:50),
            child: TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.black
                ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  labelText: "conform password"
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Container(
              width: 300,
              child: ElevatedButton(onPressed: (){}, child: Text("signup"))
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(fontSize: 18),
              children: const <TextSpan>[
                TextSpan(text: 'login', style: TextStyle(fontWeight: FontWeight.bold)),

              ],
            ),
          )
    ],
      ),
    );
  }
}
