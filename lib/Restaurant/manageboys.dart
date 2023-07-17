import 'dart:convert';

import 'package:efoodtrain/API/api.dart';
import 'package:efoodtrain/API/api_service.dart';
import 'package:efoodtrain/Restaurant/model/boymodel.dart';
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

class _manageboysState extends State<manageboys> {
  ApiService client = ApiService();
  late SharedPreferences prefs;
  String rest_id = '';
  String del_id = '';
  String logid = '';
  String name="";
  String address="";
  String phn="";
  String lname="";
  String mail="";
  final _formKey = GlobalKey<FormState>();
  TextEditingController _userController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _lastController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addController = TextEditingController();
  void registerDeliveryboy() async {
    prefs = await SharedPreferences.getInstance();

    rest_id = (prefs.getString('restaurant_id') ?? '');
    print('login_rest ${rest_id}');

    var data = {
      "restaurant_id": rest_id.replaceAll('"', ''),
      "username": _userController.text,
      "password": _pwdController.text,
      "firstname": _nameController.text,
      "lastname": _lastController.text,
      "Phone_no": _phoneController.text,
      "email": _mailController.text,
      "address": _addController.text,
    };
    print(data);
    var res = await Api().authData(data, '/register/deliveryboy-register');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => manageboys()));
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }


  Future<void> _viewBoy(String id) async {
    var res = await Api().getData('/register/view-deliveryboy-single/' + id);
    var body = json.decode(res.body);
    print(body);
    setState(() {
      name = body['data'][0]['first_name'];
      lname = body['data'][0]['last_name'];
      address = body['data'][0]['address'];
      phn = body['data'][0]['Phone_no'];
      mail = body['data'][0]['email'];
      _nameController.text=name;
      _lastController.text=address;
      _phoneController.text=phn;
      _addController.text=address;
      _mailController.text=phn;

    });
  }
  _update(String id) async {
    setState(() {
      var _isLoading = true;
    });

    var data = {
      "firstname": _nameController.text,
      "address": _addController.text,
      "lastname": _lastController.text,
      "Phone_no": _phoneController.text,
      "email": _mailController.text,
    };
    print(data);
    var res =
    await Api().authData(data, '/register/update-deliveryboy/' + id);
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print(body);

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => manageboys()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }
  _delete(String logid) async {
    setState(() {
      var _isLoading = true;
    });
    var res =
    await Api().getData( '/register/delete-delivery-boy/' +logid );
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print(body);

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Alert(
        context: context,
        title: "Successfully deleted",
        content: Icon(Icons.check_circle),
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20),
            ),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        manageboys())),
            color: Colors.blueAccent,
            radius:
            BorderRadius.circular(0.0),
          ),
        ],
      ).show();


      print(body['message']);
    } else {
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
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 35,
                      color: Colors.black)),
            ),
            FutureBuilder<List<deliveryBoyModel>>(
              future: client.fetchdeliveryboy(rest_id),
              builder: (BuildContext context, AsyncSnapshot<List<deliveryBoyModel>> snapshot) {
                print("snap${snapshot}");
                if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 20,
                      );
                    },
                    itemCount: snapshot.data!.length,
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
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage('images/man.png'),
                                  ),
                                  Column(
                                    children: [
                                      Text(snapshot.data![index].fname),
                                      Text(snapshot.data![index].pno),
                                    ],
                                  ),
                                  SizedBox(height: 4.0),
                                  IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext ctx) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              top: 20,
                                              left: 20,
                                              right: 20,
                                              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
                                          child:
                                          EditExpanded(context,snapshot.data![index].id),
                                        );
                                      },
                                    );

                                    },
                                    icon: Icon(Icons.edit, color: Colors.blueAccent),
                                  ),
                                  SizedBox(height: 4.0),
                                  IconButton(
                                    onPressed: () {
                                      _delete(snapshot.data![index].logid);
                                    },
                                    icon: Icon(Icons.delete, color: Colors.blueAccent),
                                  ),
                                ],
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
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext ctx) {
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
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Text(
                    "Add Delivery Boys",
                    style: TextStyle(fontSize: 20),
                  )),
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
                  SizedBox(height: 16.0),
                  TextFormField(
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
                    keyboardType: TextInputType.number,
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
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
                  ),
                  SizedBox(height: 16.0),
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

  SingleChildScrollView EditExpanded(BuildContext context,String id) {

    _viewBoy(id);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Text(
                        "Edit Delivery Boys",
                        style: TextStyle(fontSize: 20),
                      )),
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
                  SizedBox(height: 16.0),
                  TextFormField(
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
                    keyboardType: TextInputType.number,
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
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
                  ),

                  ElevatedButton(
                    onPressed: () {
                      _update(id);
                    },
                    child: Text('Update'),
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
