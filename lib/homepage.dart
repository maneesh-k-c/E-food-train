
import 'package:efoodtrain/login.dart';
import 'package:efoodtrain/signupall.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

  children: [
    Align(
        alignment: Alignment.center,
    child:Text(
        " TASTE THE VARIETIES...",
    style: TextStyle(
      fontSize:26, fontWeight: FontWeight.bold,color: Colors.lightBlue.shade800,)),
     ),
    Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text("Enjoy Your Favourite Food With travel",
        style: TextStyle(
          fontSize: 13,color: Colors.blueAccent,fontStyle: FontStyle.italic,
        ),
      ),
    ),

    Container(
      height: 150,
      width: 400,
      decoration: BoxDecoration(
          image: DecorationImage(image:AssetImage("images/trainn.png") )),
    ),
Padding(
  padding: const EdgeInsets.all(100.0),
  child:   Row(

    children: [

      Expanded(child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blueAccent,
          onPrimary: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          )
        ),
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    }, child: Text("Login"))),

      SizedBox(width: 20,),

      Expanded(child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blueAccent,
          onPrimary: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          )
        ),
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Signupall()));
          }, child: Text("Sign Up"))),

    ],

  ),
),
  ],
),
);
  }
}
