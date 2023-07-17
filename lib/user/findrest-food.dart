import 'dart:convert';

import 'package:efoodtrain/API/api.dart';
import 'package:efoodtrain/user/orderitems.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Restfood extends StatefulWidget {
  const Restfood({Key? key}) : super(key: key);

  @override
  State<Restfood> createState() => _RestfoodState();
}

class _RestfoodState extends State<Restfood> {
  List _loaddata=[];
  @override
  void initState(){
    super.initState();
    _fetchData();

  }
  _fetchData() async {
    var res = await Api().getData('/register/view-restaurant');
    var body = json.decode(res.body)['data'];
    print(body);
    setState(() {
      _loaddata = body;

    });
    print('body${_loaddata}');
    if(body['success']==true)
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

    }
    else
    {
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

          backgroundColor: Colors.transparent,
          elevation:0,
          ),
      body:

        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 0,right: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/rest.png"),
                      fit: BoxFit.fitWidth,
                    ),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.4),
                          Colors.grey.withOpacity(0.4),
                        ]
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.account_circle,color: Colors.grey,size: 40,),

                        Text("Hey John,what you are looking for?",
                          style: TextStyle(
                            color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        )

                      ],
                    ),
                  ),


                ),

              ),

    Padding(
          padding: const EdgeInsets.all(30),
          child: TextField (
          decoration: InputDecoration( border: OutlineInputBorder(),
          labelText: 'Station',
          hintText: 'Enter Station Name'
          ),
          ),
    ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: TextField (
                  decoration: InputDecoration( border: OutlineInputBorder(),
                      labelText: 'Item',
                      hintText: 'Enter Food Item'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("Restaurants",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ListView.builder(
                        itemCount: _loaddata.length,
                        itemBuilder: (context,index){
                          String id=_loaddata[index]['_id'];
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,MaterialPageRoute(builder: (context)=>Order(id:_loaddata[index]['_id'])),);},
                            child: ListTile(
                                leading: Icon(Icons.restaurant,color: Colors.blueAccent,),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_loaddata[index]['restaurant_name'].toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ), Text(_loaddata[index]['location'],
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,)
                            ),
                          );
                        },
                        shrinkWrap: true,

  ),


    Divider(),
                      ],
                    )
                ),
              )
    ],



          ),
        ),


    );
  }
}
