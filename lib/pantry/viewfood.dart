import 'package:efoodtrain/pantry/orderfood.dart';
import 'package:efoodtrain/user/cartpage.dart';
import 'package:efoodtrain/user/orderitems.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Viewfood extends StatefulWidget {
  const Viewfood({Key? key}) : super(key: key);

  @override
  State<Viewfood> createState() => _ViewfoodState();
}

final List<String> containerImages = [
  'images/pori.png',
  'images/pori.png',
  'images/pori.png',
  'images/pori.png',
];

class _ViewfoodState extends State<Viewfood> {
  final List<String> entries = <String>['Parippuvada','Pazhampori', 'Samosa','Uzhunnuvada'];
  final List<String> prices=['₹10','₹10','₹15','₹10'];

  //final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.blueAccent),
          label: const Text('Back', style: TextStyle(color: Colors.blueAccent)),
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Orderfood()));

          }, icon: Icon(Icons.shopping_cart),color: Colors.blueAccent,)
        ],
        backgroundColor: Colors.white,
        elevation:0,
      ),
      body:
      Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 75,
                color: Colors.grey.withOpacity(0.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("${containerImages[index]}",)
                      )
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(child: Text(' ${entries[index]}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.183,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                        ),


                    Text('${prices[index]}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.183,
                        fontWeight: FontWeight.bold,
                      ),
                    )
              ]
                    ),
                    SizedBox(height: 4.0),

                    ElevatedButton(
                      onPressed: (){

                        Alert(
                          context: context,
                          title: "Added to cart Sucessful",
                          content:  Icon(Icons.check_circle),
                          buttons: [
                            DialogButton(
                              child: Text(
                                "OK",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context)=> Viewfood())),
                              color: Colors.blueAccent,
                              radius: BorderRadius.circular(0.0),
                            ),
                          ],

                        ).show();

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blueAccent.withOpacity(0.4)),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                      ),

                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),


                  ]
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),

        ],
      ),


    );
  }
}
