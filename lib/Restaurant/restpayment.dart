import 'package:efoodtrain/user/userhome.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';





class Restpay extends  StatefulWidget {
  @override
  State<Restpay> createState() => _RestpayState();
}

class _RestpayState extends State<Restpay> {
  String? gender; //no radio button will be selected
  //String gender = "male"; //if you want to set default value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Overide the default Back button
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp,color: Colors.blueAccent,),
          label: const Text('Back',style: TextStyle(color:Colors.blueAccent )),
          style: ElevatedButton.styleFrom(

            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // other stuff


      ),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Payment Method",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30)),

                Divider(),

                RadioListTile(
                  title: Text("Cash on delivery"),
                  value: "Cash on delivery",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Card(
                    color: Colors. grey.withOpacity(0.8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.black.withOpacity(0.3), width: 1),
                    ),
                    child:
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:[
                            Center(
                              child: Text(
                                "Total Amount:Rs300",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 4.0),

                            ElevatedButton(onPressed: (){

                              Alert(
                                context: context,
                                title: "Payment Sucessful",
                                content:  Icon(Icons.check_circle),
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "OK",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context)=> Homie())),
                                    color: Colors.blueAccent,
                                    radius: BorderRadius.circular(0.0),
                                  ),
                                ],

                              ).show();

                            }, child: Text(
                              "proceed",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),),
                              /* Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.lightBlueAccent.withOpacity(0.3)),
      child: Center(
      child:  Text(
      "proceed",
      style: TextStyle(
      color: Colors.grey[900],
      fontWeight: FontWeight.bold),
      )),
      ),*/
                            ),
                          ],
                        ),

                      ),


                    ),
                  ),
                ),
              ]
          )
      ),
    );
  }
}




