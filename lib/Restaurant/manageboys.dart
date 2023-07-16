import 'dart:convert';

import 'package:efoodtrain/API/api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class manageboys extends StatefulWidget {
  const manageboys({Key? key}) : super(key: key);

  @override
  State<manageboys> createState() => _manageboysState();
}

final List<String> containerImages = [
  'images/man.png',
  'images/man.png',
  'images/man.png',
  'images/man.png',
];
final List<String> name = ['Sudheepth.c', 'Vishnu', 'Shamliya','Manu',];
final List<String> mob = ["7902647562", "9745073559", "9633611017", "8086939350"];

int simpleIntInput = 0;
final List<String> entries = <String>['Sudheepth', 'Vishnu', 'Shamliya','Manu',];
final List<String> number=['7902647562','9745073559','9633611017','8086939350',];
class _manageboysState extends State<manageboys> {

  late SharedPreferences prefs;
  late String rest_id;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _userController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _lastController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  List _loadedRest = [];
  void registerDeliveryboy()async {
    prefs = await SharedPreferences.getInstance();

    rest_id = (prefs.getString('restaurant_id') ?? '');
    print('login_rest ${rest_id}');

    var data = {
      "restaurant_id":rest_id.replaceAll('"', '') ,
      "username": _userController.text,
      "password": _pwdController.text,
      "firstname": _nameController.text,
      "lastname": _lastController.text,
      "Phone_no": _phoneController.text,
      "email": _mailController.text,
      "address": _addController.text,
    };
    print(data);
    var res = await Api().authData(data,'/register/deliveryboy-register');
    var body = json.decode(res.body);
print(body);
    if(body['success']==true)
    {
      print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Successful'),
            content: Text(
              'deliveryboy added successfully',
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>manageboys()));
                },
                child: Text('OK'),
              ),
            ],
          );
        },

      );

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
  void initState() {
    // TODO: implement initState
    super.initState();
    //  _fetchData();
  }

  _fetchData() async {
   prefs = await SharedPreferences.getInstance();

  rest_id = (prefs.getString('restaurant_id') ?? '');
    print('login_rest ${rest_id}');

    var res = await Api().getData('/register/view-deliveryboy/'+rest_id.replaceAll('"', ''));
    //  print(res);
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      //   print(items);
      setState(() {
        _loadedRest = items;

        print('itemsloaded${_loadedRest}');
      });
    } else {
      setState(() {
        _loadedRest = [];
        Fluttertoast.showToast(
          msg: "Currently there is no tenders available",
          backgroundColor: Colors.grey,
        );
      });
    }
  }
  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  void _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text("Manage",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 35,color: Colors.black)),
            ),
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
                    color: Colors.blueGrey.withOpacity(0.4),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(backgroundImage: AssetImage(
                                  '${containerImages[index]}')


                                // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
                              ), /*Container(
                                    width: 80,
                                    child: Image.asset(containerImages[index],
                                        fit: BoxFit.cover),
                                  ),*/

                              Column(
                                children: [
                                  Text("${name[index]}"
                                  ),
                                  Text("${mob[index]}"
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.0),

                              IconButton(
                                onPressed: () {
                                  Alert(
                                    context: context,
                                    title: "Successfully edited",
                                    content: Icon(Icons.check_circle),
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "OK",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => manageboys())),
                                        color: Colors.blueAccent,
                                        radius: BorderRadius.circular(0.0),
                                      ),
                                    ],
                                  ).show();
                                },
                                icon: Icon(Icons.edit, color: Colors.blueAccent),
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
                                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => manageboys())),
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
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx){
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),

            child: buildExpanded(context),
          );
        },
      );
    },
            // Add your action here

          child: Icon(Icons.add),
      ),
    );
  }

  SingleChildScrollView buildExpanded(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
            mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(child: Text("Add Delivery Boys",style: TextStyle(fontSize: 20),)),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'FirstName',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0), TextFormField(
                        controller: _lastController,
                        decoration: InputDecoration(
                          labelText: 'LastName',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'phone number',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _mailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter email address';
                          }
                          return null;
                        },
                      ),  SizedBox(height: 16.0),
                      TextFormField(
                        controller: _addController,
                        decoration: InputDecoration(
                          labelText: 'Address',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter  address';
                          }
                          return null;
                        },
                      ), SizedBox(height: 16.0),
                      TextFormField(
                        controller: _userController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _pwdController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter email password';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          registerDeliveryboy();
                        },
                        child: Text('Add'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
    );
  }
}