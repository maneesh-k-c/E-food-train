import 'dart:convert';

import 'package:efoodtrain/API/api.dart';
import 'package:efoodtrain/API/api_service.dart';
import 'package:efoodtrain/Restaurant/restpayment.dart';
import 'package:efoodtrain/user/model/cartmodel.dart';
import 'package:efoodtrain/user/payment.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
class _CartState extends State<Cart> {
  String Id='';
  @override
  ApiService client=ApiService();
  late SharedPreferences prefs;
  String user_id='';
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchcart();
  }
  Future<List<CartModel>> fetchcart() async {
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getString('user_id') ?? '');
    print("uid${user_id}");
    var response = await Api().getData('/order/view-cart/'+user_id.replaceAll('"', ''));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print(("items${items}"));

      List<CartModel> products = List<CartModel>.from(
          items['data'].map((e) => CartModel.fromJson(e)).toList());
      return products;
    } else {
      List<CartModel> products = [];
      return products;
    }
  }

  _deleteData(String id) async {
    var res =
    await Api().getData('/api/cart/delete_cart/' + id.replaceAll('"', ''));
    if (res.statusCode == 200) {
      setState(() {
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
              onPressed: () =>  Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Cart())),
              color: Colors.blueAccent,
              radius: BorderRadius.circular(0.0),
            ),
          ],
        ).show();


        Fluttertoast.showToast(
          msg: "Removed from cart",
          backgroundColor: Colors.grey,

        );
      });
    } else {
      setState(() {
        Fluttertoast.showToast(
          msg: "Currently there is no data available",
          backgroundColor: Colors.grey,
        );
      });
    }
  }

  _increment(String id) async {
    setState(() {
      var _isLoading = true;
    });

    var res =
    await Api().getData('/order/quantity-increment/' + id.replaceAll('"', ''));
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      print(body);
      setState(() {
        // qty++;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Cart()));
      });
      // Fluttertoast.showToast(
      //   msg: body['message'].toString(),
      //   backgroundColor: Colors.grey,
      // );
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  _decrement(String id) async {
    setState(() {
      var _isLoading = true;
    });

    var res =
    await Api().getData('/order/quantity-decrement/' + id.replaceAll('"', ''));
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      print(body);
      setState(() {
        //  qty--;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Cart()));
      });
      // Fluttertoast.showToast(
      //   msg: body['message'].toString(),
      //   backgroundColor: Colors.grey,
      // );
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
          physics: ScrollPhysics(),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        Text("My Cart",
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 35,color: Colors.black)),
            FutureBuilder<List<CartModel>>(
            future: fetchcart(),
    builder: (BuildContext cfetchproductontext,
    AsyncSnapshot<List<CartModel>> snapshot) {

    if (snapshot.hasData) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),

    shrinkWrap: true,
    separatorBuilder: (context, index) {
    return SizedBox(
    width: 20,
    );
    },
    //   scrollDirection: Axis.vertical,
    itemCount:snapshot.data!.length,
    itemBuilder: (context, index) {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      color: Colors.white.withOpacity(0.5),
    child: Container(
      child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
      CircleAvatar(backgroundImage:AssetImage( "server/public/images/" +snapshot.data![index].imageUrl
          )



      // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text("${snapshot.data![index].name}"
      ),
      Text("₹${snapshot.data![index].price}"
      ),
        Text("Qty :${snapshot.data![index].quantity}"
        ),
      ],
      ),


        SizedBox(height: 4.0),

   /*     IconButton(
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
        ),*/
        Column(
          children: [
            IconButton(
              icon: Icon(
                Icons.delete,
              ),
              onPressed: () async {
                Id = snapshot.data![index].id;
                setState(() {
                  _deleteData(Id);
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    onPressed: () async {
                      Id = snapshot.data![index].id;
                      setState(() {
                        _decrement(Id);
                      });
                    },
                    backgroundColor: Colors.white60,
                    child:
                    Icon(Icons.remove, color: Colors.black),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                 " 1",
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                    onPressed: () async {
                      Id =snapshot.data![index].id;
                      setState(() {
                        _increment(Id);
                      });
                    },
                    backgroundColor: Colors.white60,
                    child: Icon(Icons.add, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        )
      ]
      ),

      ),
    ),

    ),
    );
    },
    );
    }
    return Center(child: CircularProgressIndicator());
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






