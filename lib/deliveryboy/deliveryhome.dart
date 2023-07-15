import 'package:efoodtrain/deliveryboy/customerdetails.dart';
import 'package:efoodtrain/deliveryboy/deliveryboynot.dart';
import 'package:efoodtrain/deliveryboy/deliverystatus.dart';
import 'package:efoodtrain/deliveryboy/paymentstatus.dart';
import 'package:flutter/material.dart';
class Deliveryhome extends StatefulWidget {
  const Deliveryhome({Key? key}) : super(key: key);
  @override
  State<Deliveryhome> createState() => _DeliveryhomeState();
}

class _DeliveryhomeState extends State<Deliveryhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
      leading: IconButton(onPressed: (){},icon : Icon(Icons.menu),color: Colors.blueAccent,),
      title: Center(
        child: Text(
          "DELIVERY BOY",style: TextStyle(color: Colors.blueGrey),
        ),
      ),
      actions: [
        IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Deliveryboynot()));
        },
          icon: Icon(Icons.notifications),color: Colors.blueAccent,)
      ],
      backgroundColor: Colors.white,
    ),
        body: SingleChildScrollView(
        physics: ScrollPhysics(),
    child: SafeArea(
    child: Container(
    padding: EdgeInsets.all(20.0),
    child: Column(
    children: <Widget>[
    Container(
    width: double.infinity,
    height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage('images/one.imgmain.png'),
                fit: BoxFit.cover)),
        child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(.4),
              Colors.black.withOpacity(.2),
            ])),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[

    SizedBox(
    height: 30,
    ),
    SizedBox(
    height: 30,
    ),
    ],
    ),
    ),
    ),
    Align(
    alignment: Alignment.centerLeft,
    child: Padding(
    padding: const EdgeInsets.only(top :30),
    child: Text(
    "Make order",
    style: TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontStyle: FontStyle.italic,
    ),

    ),
    ),
    ),
        Divider(),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "Notifications",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          color: Colors.grey.withOpacity(0.5),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.withOpacity(0.8), width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    " Restaurant:",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  "Royal city",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    " Place:",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  "Kuttipuram",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Time:",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  "12.00pm",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,

                  child: ElevatedButton(
                    child: Text('Accept', textAlign: TextAlign.left,),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>Details()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        SizedBox(height: 10,),

        GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Opens()));
            },
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),

            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[200]),
              height: 100,
              width: double.infinity,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delivery_dining,color: Colors.blueAccent,size: 40,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Delivery status",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  )

                ],
              ),

            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Payments()));
          },
          child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
    child: Container(
    height: 100,
    width: double.infinity,
    color: Colors.grey[200],
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.payment_rounded,color: Colors.blueAccent,size: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Payment status ",
                style: TextStyle(
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


    ),
    ),
        ),
        );

  }
}




