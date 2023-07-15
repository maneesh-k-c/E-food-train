import 'package:efoodtrain/Restaurant/restpayment.dart';
import 'package:efoodtrain/user/payment.dart';
import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'orderitems.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}
final List<String> containerImages = [
  'images/biri.png',
  'images/poro.png',
  'images/cn.png',
  'images/dosa.png',
];
 List<String> imageTitles = ["CB", "Porotta", "Masaladosa","Noodles",];
final List<String> Titles = ["Rs100", "Rs35", "Rs120", "Rs60"];
final List<String> qty = ["4", "6", "1", "3"];
int simpleIntInput = 0;
 List<String> entries = <String>[' CB', 'Porotta', 'Masaladosa','Noodles',];
final List<String> prices=['150','10','60','120',];
class _CartState extends State<Cart> {
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

        Text("My Cart",
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 35,color: Colors.black)),
    ListView.separated(

    shrinkWrap: true,
    separatorBuilder: (context, index) {
    return SizedBox(
    width: 20,
    );
    },
    //   scrollDirection: Axis.vertical,
    itemCount: 4,
    itemBuilder: (context, index) {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      color: Colors.grey.withOpacity(0.5),
    child: Container(
      child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
      CircleAvatar(backgroundImage:AssetImage('${containerImages[index]}')



      // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
      ),/*Container(
                                    width: 80,
                                    child: Image.asset(containerImages[index],
                                        fit: BoxFit.cover),
                                  ),*/

      Column(
      children: [
      Text("${imageTitles[index]}"
      ),
      Text("${Titles[index]}"
      ),
        Text("Qty :${qty[index]}"
        ),
      ],
      ),

        QuantityInput(
            value: simpleIntInput,
            onChanged: (value) => setState(() => simpleIntInput = int.parse(value.replaceAll(',', '')))
        ),
        SizedBox(height: 4.0),

        IconButton(
          onPressed: () {
            Alert(
              context: context,
              title: "Successfully deleted",
              content: Icon(Icons.check_circle),
              buttons: [
                DialogButton(
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Cart())),
                  color: Colors.blueAccent,
                  radius: BorderRadius.circular(0.0),
                ),
              ],
            ).show();
          },
          icon: Icon(Icons.delete, color: Colors.blueAccent),
        ),
      ]),
      ),
    ),

    ),
    );
    },
    ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0,right: 35.0,bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Name"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0,right: 35.0,bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Mobile number"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0,right: 35.0,bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Train name/PNR number"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0,right: 35.0,bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Seat number"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0,right: 35.0,bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Time"
              ),
            ),
          ),

          SizedBox(height: 4.0),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey, //background color of button
                    //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                  onPressed: () {
                      Navigator.push(
                        context,MaterialPageRoute(builder: (context)=>Restpay()),);
                  },
                  child: const Text(
                    'Order',
                    style: TextStyle(fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
          ),

          )
        ],
    ),

    ),



        );
    }





  }






