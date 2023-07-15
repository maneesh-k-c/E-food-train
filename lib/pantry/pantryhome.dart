import 'package:efoodtrain/pantry/deliverystatus.dart';
import 'package:efoodtrain/pantry/manageorder.dart';
import 'package:efoodtrain/pantry/managefood.dart';
import 'package:efoodtrain/pantry/pantrynot.dart';
import 'package:flutter/material.dart';

import 'managefood.dart';

class Pantryhome extends StatefulWidget {
  const Pantryhome({Key? key}) : super(key: key);

  @override
  State<Pantryhome> createState() => _PantryhomeState();
}

class _PantryhomeState extends State<Pantryhome> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Center(
          child: Text(
            "E-food train",style: TextStyle(color: Colors.blueAccent, fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Pantrynotifiaction()));

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
                  Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Train name: Nethravadi Express",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Train number: 16068",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),

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
               onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Managefood()));},
              // },
              child: Container(

                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),color: Colors.grey.withOpacity(0.4),      ),
                child: Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Manage Items",

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
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>manageorder()));
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
                      child: Text("Manage Order",

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
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewdeliverystatus()));
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
                      child: Text("Delivery Status",

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
