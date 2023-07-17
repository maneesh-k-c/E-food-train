import 'dart:convert';

import 'package:efoodtrain/API/api.dart';
import 'package:efoodtrain/user/cartpage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Order extends StatefulWidget {
  final String id;

  Order({required this.id});

  @override
  State<Order> createState() => _OrderState();
}

final List<String> containerImages = [
  'images/biri.png',
  'images/poro.png',
  'images/cn.png',
  'images/dosa.png',
];

class _OrderState extends State<Order> {
  final List<String> entries = <String>[
    ' CB',
    'Porotta',
    'Chicken noodles',
    'Masaladosa'
  ];
  late SharedPreferences localstorage;
  late String user_id,foodid,restid;
  final List<String> prices = ['₹150', '₹15', '₹60', '₹120'];
  List _loaddata = [];
 bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    var res = await Api()
        .getData('/food_item/view-restaurant-added-food-item/' + widget.id);
    var body = json.decode(res.body)['data'];
    print(body);
    setState(() {
      _loaddata = body;
    });
    print('body${_loaddata}');
  /*  if (body['success'] == true) {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }*/
  }

  Future AddCart() async {
    localstorage = await SharedPreferences.getInstance();
    user_id = (localstorage.getString('user_id') ?? '');
    print('User ID ${user_id}');
    setState(() {
      _isLoading = true;
    });

    var data = {
      "user_id": user_id.replaceAll('"', ''),
      "food_id": foodid.replaceAll('"', ''),
      "restaurant_id": widget.id,
    };
    print(data);
    var res = await Api().authData(data, '/order/add-cart');
    var body = json.decode(res.body);
print(body);
    if (body['success'] == true) {
      //   print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Alert(
        context: context,
        title: "Added to cart Sucessful",
        content: Icon(Icons.check_circle),
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(
                  color: Colors.white, fontSize: 20),
            ),
            onPressed:
                () {}, //Navigator.push(context, MaterialPageRoute(builder:(context)=> Order())),
            color: Colors.blueAccent,
            radius: BorderRadius.circular(0.0),
          ),
        ],
      ).show();
      //   Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>View_Comp()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }
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
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            icon: Icon(Icons.shopping_cart),
            color: Colors.blueAccent,
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: _loaddata.length,
            itemBuilder: (BuildContext context, int index) {
              foodid=_loaddata[index]['_id'];
              restid=_loaddata[index]['restaurant_id'];
              return Container(
                height: 75,
                color: Colors.grey.withOpacity(0.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                        "server/public/images/" +
                            _loaddata[index]['item_image'],
                      ))),
                    ),
                    Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                        ' ${_loaddata[index]['item_name']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.183,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      )),
                      Text(
                        '₹${_loaddata[index]['price']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.183,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    SizedBox(height: 4.0),
                    ElevatedButton(
                      onPressed: () {
                        AddCart();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.blueAccent.withOpacity(0.4)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ],
      ),
    );
  }
}
