import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../API/api.dart';
import '../API/api_service.dart';

class Managepantry extends StatefulWidget {
  const Managepantry({Key? key}) : super(key: key);

  @override
  State<Managepantry> createState() => _ManagepantryState();
}
final List<String> containerImages = [
  'images/rest.png',
  'images/rest.png',
  'images/rest.png',
  'images/rest.png',
];
class _ManagepantryState extends State<Managepantry> {

  final List<String> entries1=<String>['Malabar','Parag','Zatar'];
  final List<String> userIds=<String>['108','105','110','142'];
  final List<String> new1 = <String>['Ritzy', 'Royal City'];
  final List<String> entries = <String>['Ritzy', 'Royal City','Paragon','Rahmath'];
  final List<String> userId2=<String>['104','106','114','112'];
  //final List<int> colorCodes = <int>[600, 500, 100];
  List _loadprooducts = [];
  ApiService client = ApiService();
  Future approverest(String counterid) async {
    print("u ${counterid}");
    var response = await Api().getData('/register/view-usersaproov/'+counterid);
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
        backgroundColor: Colors.white70,
        elevation: 0,
        // other stuff

        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications),color: Colors.blueAccent,)
        ],
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Request',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            GestureDetector(
              onTap: (){},
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: entries1.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(containerImages[index]),
                    ),
                    title: Text(
                      entries1[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    subtitle: Text(
                      'ID: ${userIds[index]}',
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
                            _approveUser(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            // Handle decline button pressed
                            _declineUser(index);
                          },
                        ),

                      ],
                    ),
                    tileColor: Colors.grey.withOpacity(0.4),
                  );
                }, separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
              ),
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
                "All Users",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),


              ),
            ),



            ListView.separated(
              shrinkWrap: true,

              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(containerImages[index]),
                  ),
                  title: Text(
                    entries[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  subtitle: Text(
                    'ID: ${userIds[index]}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.blueAccent,
                    ),
                    onPressed: () {
                      // Handle delete button pressed
                      _showDeleteConfirmationDialog(context, index);
                    },
                  ),
                  tileColor: Colors.grey.withOpacity(0.4),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
            ),

          ],
        ),
      ),





    );
  }
  void _showDeleteConfirmationDialog(
      BuildContext context, int index) async {
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
                _deleteUser(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _deleteUser(int index) {
    // Perform the actual delete operation here
    // You can remove the user from the 'entries' list or call any delete API
    entries.removeAt(index);
    containerImages.removeAt(index);
  }

  void _approveUser(int index) {
    // Perform the approve operation here
    // For example, update the user status in the database
    print('User ${entries[index]} approved.');
  }

  void _declineUser(int index) {
    // Perform the decline operation here
    // For example, delete the user from the database
    print('User ${entries[index]} declined.');
  }
}
