
import 'package:efoodtrain/admin/managedeliveryboy.dart';
import 'package:efoodtrain/admin/managepantry.dart';
import 'package:efoodtrain/admin/managerestaurant.dart';
import 'package:efoodtrain/admin/viewuser.dart';
import 'package:flutter/material.dart';

class Adminhome extends StatefulWidget {
  const Adminhome({Key? key}) : super(key: key);

  @override
  State<Adminhome> createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Overide the default Back button
          automaticallyImplyLeading: false,
          leadingWidth: 100,
          leading: Icon(Icons.notifications, color: Colors.blueGrey,),
          backgroundColor: Colors.transparent,
          elevation: 0,
          // other stuff


        ),
        body:
        Column(
          children: [
            Container(
                width: double.infinity,
                height: 150,
                color: Colors.grey.withOpacity(0.5),
                child:
                Center(
                  child: Text(
                    "ADMIN",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Curved Square
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Managerest()));
                      },
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3.5,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey[800],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.food_bank_rounded,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                'Restaurant',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Curved Rectangle
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Managepantry()));
                      },
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.9,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey,
                        ),

                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.kitchen,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                'Pantry',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Manageboy()));
                    },
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.9,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delivery_dining,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              'Deliveryboy',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Curved Square

                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Viewuser()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 3.5,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey[800],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.boy,
                                size: 50,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'View User',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Curved Rectangle
                ],
              ),


            ),



          ],
        )
    );
  }
}
