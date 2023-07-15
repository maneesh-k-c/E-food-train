import 'dart:convert';

import 'package:efoodtrain/signupall.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'API/api.dart';

class Signpantry extends StatefulWidget {
  const Signpantry({Key? key}) : super(key: key);

  @override
  State<Signpantry> createState() => _SignpantryState();
}

class _SignpantryState extends State<Signpantry> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String? _idCardType;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _trainNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _trainNameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void registerPantry()async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      "user_name": _userNameController.text,
      "train_name": _trainNameController.text,
      "phone_no": _phoneNumberController.text,
      "email": _addressController.text,
      "password": _passwordController.text,
    };
    var res = await Api().authData(data,'/register/pantry-register');
    var body = json.decode(res.body);

    if(body['success']==true)
    {
      print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context)=>Signupall()));

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
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Form(
            key: _formKey, // Add the form key
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Register as Pantry",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _userNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter User Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter User Name",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _trainNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter train Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter train Name",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _phoneNumberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Phone Number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Phone Number",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _addressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Email Address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Email",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 50.0,
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Password';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: "Enter Password",
                            labelStyle: TextStyle(
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 50,
                          top: 10,
                          bottom: 10,
                        ),
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Confirm Password';
                            } else if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      registerPantry();
                      // All fields are valid, perform submission
                      // You can access the form field values using:
                      // _firstNameController.text
                      // _lastNameController.text
                      // _phoneNumberController.text
                      // _addressController.text
                      // _idCardType
                      // _passwordController.text
                      // _confirmPasswordController.text
                    }
                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    padding:
                    EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}