import 'dart:convert';

import 'package:efoodtrain/admin/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../API/api.dart';
import '../API/api_service.dart';

class Viewuser extends StatefulWidget {
  const Viewuser({Key? key}) : super(key: key);

  @override
  State<Viewuser> createState() => _ViewuserState();
}

class _ViewuserState extends State<Viewuser> {
  ApiService client = ApiService();
  bool _isExpanded=false;
  List<String>entries=["Sudheepth","Vishnu","Shamliya","Vincy"];
  List<String>mob=["9846114630","9633601017","8086030380","7902641389"];
  List<String>email=["sudhi123@gmail.com","vishnu47@gmail.com","shamli325@gmail.com","vincy322@gmail.com"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Overide the default Back button
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp, color: Colors.blueAccent,),
          label: const Text('Back', style: TextStyle(color: Colors.blueAccent)),
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

              Padding(
                padding: const EdgeInsets.all(30),
                child: Text("Users",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 35,color: Colors.black)),
              ),

        FutureBuilder<List<userModel>>(
        future: client.fetchuser(),
    builder: (BuildContext context,
    AsyncSnapshot<List<userModel>> snapshot) {
      print("snap${snapshot}");
      if (snapshot.hasData) {
        return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 20,
            );
          },
          //   scrollDirection: Axis.vertical,
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, int index) {
           String uid = snapshot.data![index].name;
            print(uid);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.grey.withOpacity(0.4),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                            backgroundImage: AssetImage("images/profile.png")
                        ), /*Container(
                                      width: 80,
                                      child: Image.asset(containerImages[index],
                                          fit: BoxFit.cover),
                                    ),*/

                        Column(
                          children: [
                            Text("Name:${entries[index]}",
                              style: TextStyle(
                                color: Colors.blueAccent[800],
                              ),
                            ),
                            Text("Mobile No:${mob[index]}",
                              style: TextStyle(
                                color: Colors.blueAccent[800],
                              ),
                            ),
                            Text("Email:${email[index]}",
                              style: TextStyle(
                                color: Colors.blueAccent[800],
                              ),
                            ),

                          ],
                        ),


                        Center(child: TextButton(onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        }, child: Column(
                          children: [
                          ],
                        ))),


                      ]),
                ),
              ),
            );
          },
        );
      }
      return Center(child: CircularProgressIndicator());
    }
              ),
            ]
        ),
      ),
    );
  }
}