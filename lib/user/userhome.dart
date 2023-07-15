import 'package:efoodtrain/pantry/managefood.dart';
import 'package:efoodtrain/pantry/orderfood.dart';
import 'package:efoodtrain/pantry/viewfood.dart';
import 'package:efoodtrain/user/findrest-food.dart';
import 'package:efoodtrain/user/orderitems.dart';
import 'package:efoodtrain/user/usernot.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Homie extends StatefulWidget {
  const Homie({Key? key}) : super(key: key);

  @override
  State<Homie> createState() => _HomieState();
}

class _HomieState extends State<Homie> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(onPressed: (){},icon : Icon(Icons.arrow_back),color: Colors.blueAccent,),

        title: Center(
          child: Text(
            "E-food train",style: TextStyle(color: Colors.blueAccent, fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Usernotificaion()));

          }, icon: Icon(Icons.notifications),color: Colors.blueAccent,)
        ],
        backgroundColor: Colors.white,
      ),
      body:
      Column(
        children: [
          Container(
            width: 500,
            height: 150,
            color: Colors.grey.withOpacity(0.4),
            child:

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("images/profile.png"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Profile name",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),

                    ),
                    Text(
                      "PNR number",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),

                    ),
                  ],
                )



              ],
            )
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top :30),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Make order",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),

                ),
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
            child: GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Restfood()));
              },
              child: Container(

                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),color: Colors.grey.withOpacity(0.4),      ),
                child: Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Order Food-Restaurant",

                        style: TextStyle(
                          color: Colors.black,
                            fontSize: 20
                        ),
                      ),
                    )

                  ],
                ),


              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
            child: GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewfood()));
              },
              child: Container(

                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),color: Colors.grey.withOpacity(0.4),
                ),
                child: Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Order Food-Pantry",

                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        ),
                      ),
                    )

                  ],
                ),


              ),
            ),
          ),
        ],


      ),

    );

  }
}
