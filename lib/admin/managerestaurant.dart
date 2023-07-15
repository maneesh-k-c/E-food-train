import 'dart:convert';

import 'package:efoodtrain/admin/model/restmodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../API/api.dart';
import '../API/api_service.dart';

class Managerest extends StatefulWidget {
  const Managerest({Key? key}) : super(key: key);

  @override
  State<Managerest> createState() => _ManagerestState();
}

final List<String> containerImages = [
  'images/rest.png',
  'images/rest.png',
  'images/rest.png',
];

class _ManagerestState extends State<Managerest> {
  final List<String> entries1 = <String>['Malabar', 'Parag', 'Zatar'];
  final List<String> userIds = <String>['108', '105', '110', '142'];
  final List<String> new1 = <String>['Ritzy', 'Royal City'];
  final List<String> entries = <String>[
    'Ritzy',
    'Royal City',
    'Paragon',
    'Rahmath'
  ];
  final List<String> userId2 = <String>['104', '106', '114', '112'];
  String uid = '';
  List _loadprooducts = [];
  ApiService client = ApiService();

  Future approveUser(String userid) async {
    print("u ${userid}");
    var response = await Api().getData('/register/approve/' + userid);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print("approve status${items}");
      Fluttertoast.showToast(
        msg: "Approved",
      );
    } else {
      Fluttertoast.showToast(
        msg: "Error",
      );
    }
  }

  Future reject(String userid) async {
    print("u ${userid}");
    var response = await Api().getData('/register/reject/' + userid);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print("approve status${items}");
      Fluttertoast.showToast(
        msg: "reject",
      );
    } else {
      Fluttertoast.showToast(
        msg: "Error",
      );
    }
  }

  late String userid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Overide the default Back button
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_left_sharp,
            color: Colors.blueAccent,
          ),
          label: const Text('Back', style: TextStyle(color: Colors.blueAccent)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.white70,
        elevation: 0,
        // other stuff

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: Colors.blueAccent,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Request',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            FutureBuilder<List<RestaurentModel>>(
              future: client.fetchrestaurent(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<RestaurentModel>> snapshot) {
                print("snap${snapshot}");
                if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      uid = snapshot.data![index].id;
                      print(uid);

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('images/rest.png'),
                        ),
                        title: Text(
                          snapshot.data![index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        subtitle: Text(
                          'ID: ${snapshot.data![index].id}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                // Handle approve button pressed
                                approveUser(uid);
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                // Handle decline button pressed
                                reject(uid);
                              },
                            ),
                          ],
                        ),
                        tileColor: Colors.grey.withOpacity(0.4),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Divider(
                thickness: 2,
                color: Colors.black,
              ),
            ),
            Align(
              child: Text(
                "All Restaurent",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
    FutureBuilder<List<RestaurentModel>>(
    future: client.fetchrestaurent(),
    builder: (BuildContext context,
    AsyncSnapshot<List<RestaurentModel>> snapshot) {
      print("snap${snapshot}");
      if (snapshot.hasData) {
        return ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(containerImages[index]),
              ),
              title: Text(snapshot.data![index].name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              subtitle: Text(
                'ID: ${snapshot.data![index].id}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
           
              tileColor: Colors.grey.withOpacity(0.4),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
          const Divider(),
        );
      }
      return Center(child: CircularProgressIndicator());
    }

            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete User'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to delete this user?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                // Perform delete operation

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
