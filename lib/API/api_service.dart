import 'dart:convert';


import 'package:efoodtrain/Restaurant/model/boymodel.dart';
import 'package:efoodtrain/admin/model/adddeliveymodel.dart';
import 'package:efoodtrain/admin/model/deliveryboymodel.dart';
import 'package:efoodtrain/admin/model/itemmodel.dart';
import 'package:efoodtrain/admin/model/restmodel.dart';
import 'package:efoodtrain/admin/model/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:trip/Admin/model/categoryModel.dart';
//import 'package:trip/Admin/model/coutermodel.dart';
//import 'package:trip/Admin/model/deliveryModel.dart';
//import 'package:trip/Admin/model/godowModel.dart';
//import 'package:trip/Admin/model/paymentModel.dart';
//import 'package:trip/Admin/model/productmodel.dart';
//import 'package:trip/Admin/model/usermodel.dart';
//import 'package:trip/Api/api.dart';

import 'api.dart';

class ApiService {
  late SharedPreferences prefs;
  late int user_id;

  Future<List<userModel>> fetchuser() async {
    var response = await Api().getData('/register/view-restaurant');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<userModel> products = List<userModel>.from(
          items['data'].map((e) => userModel.fromJson(e)).toList());
      return products;
    } else {
      List<userModel> products = [];
      return products;
    }
  }
  Future<List<userModel>> fetchuserap() async {
    var response = await Api().getData('/register/view-usersaproov');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<userModel> products = List<userModel>.from(
          items['data'].map((e) => userModel.fromJson(e)).toList());
      return products;
    } else {
      List<userModel> products = [];
      return products;
    }
  }
  Future<List<RestaurentModel>> fetchrestaurent() async {
    var response = await Api().getData('/register/view-restaurant');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));


      List<RestaurentModel> products = List<RestaurentModel>.from(
          items['data'].map((e) => RestaurentModel.fromJson(e)).toList());
      return products;
    } else {
      List<RestaurentModel> products = [];
      return products;
    }
  }
  Future<List<RestaurentModel>> fetchrestaurentap() async {
    var response = await Api().getData('/register/view-restaurantapprove');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));


      List<RestaurentModel> products = List<RestaurentModel>.from(
          items['data'].map((e) => RestaurentModel.fromJson(e)).toList());
      return products;
    } else {
      List<RestaurentModel> products = [];
      return products;
    }
  }
  Future<List<deliveryBoyModel>> fetchdeliveryboy(String id) async {
    var response = await Api().getData('/register/view-deliveryboy/'+id);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));


      List<deliveryBoyModel> products = List<deliveryBoyModel>.from(
          items['data'].map((e) => deliveryBoyModel.fromJson(e)).toList());
      return products;
    } else {
      List<deliveryBoyModel> products = [];
      return products;
    }
  }
  Future<List<deliveryboyModel>> fetchdeliveryboyap() async {
    var response = await Api().getData('/register/view-deliveryboyapprove');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));


      List<deliveryboyModel> products = List<deliveryboyModel>.from(
          items['data'].map((e) => deliveryboyModel.fromJson(e)).toList());
      return products;
    } else {
      List<deliveryboyModel> products = [];
      return products;
    }
  }
  Future<List<userModel>> fetchcategory() async {
    var response = await Api().getData('/category/view-category');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print((items));

      List<userModel> products = List<userModel>.from(
          items['data'].map((e) => userModel.fromJson(e)).toList());
      return products;
    } else {
      List<userModel> products = [];
      return products;
    }
    }
  Future<List<itemModel>> fetchitem(String id) async {
    var response = await Api().getData('/food_item/view-restaurant-added-food-item/'+id);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print(("items${items}"));

      List<itemModel> products = List<itemModel>.from(
          items['data'].map((e) => itemModel.fromJson(e)).toList());
      return products;
    } else {
      List<itemModel> products = [];
      return products;
    }
    }
  Future<List<adddeliveryModel>> fetchboy() async {
    var response = await Api().getData('/restaurant/view-item');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print(("items${items}"));

      List<adddeliveryModel> products = List<adddeliveryModel>.from(
          items['data'].map((e) => adddeliveryModel.fromJson(e)).toList());
      return products;
    } else {
      List<adddeliveryModel> products = [];
      return products;
    }
  }


  }
