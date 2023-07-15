import 'dart:convert';
import 'dart:io';

import 'package:efoodtrain/admin/model/itemmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API/api.dart';
import '../API/api_service.dart';

class Manageitem extends StatefulWidget {
  const Manageitem({Key? key}) : super(key: key);

  @override
  State<Manageitem> createState() => _ManageitemState();
}

final List<String> containerImages = [
  'images/biri.png',
  'images/poro.png',
  'images/cn.png',
  'images/dosa.png',
];

class _ManageitemState extends State<Manageitem> {
  late final _filename;
  File? imageFile;
  late String storedImage;
  File? _image;
  final picker = ImagePicker();
  ApiService client = ApiService();

  late String user_id;
  late SharedPreferences prefs;
  bool _isLoading = false;
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemPriceController = TextEditingController();
  @override
  void dispose() {
    _image=='';
    _itemNameController.dispose();
    _itemPriceController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  Future getImage() async {
    print("picked");
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);

        // _filename = _image!.path.toString();
        _filename = basename(_image!.path).toString();


      } else {
        print('No image selected.');
      }
    });
  }
  void addproduct() async {
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getString('restaurant_id') ?? '');

    setState(() {
      _isLoading = true;
    });

    var data = {
      "restaurant_id":user_id.replaceAll('"', '') ,
      "item_name": _itemNameController.text,
      "price": _itemPriceController.text,
      "item_image":_filename
    };
    var res = await Api().authData(data, '/food_item/food_item');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {
      print(body);
      addImage();
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

     // Navigator.push(context, MaterialPageRoute(builder: (context) => Manageitem()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  void addImage()async{

  final uri = Uri.parse(Api().url+'/food_item/upload');
  final request = http.MultipartRequest('POST', uri);
  final imageStream = http.ByteStream(_image!.openRead());
  final imageLength = await _image!.length();

  final multipartFile = http.MultipartFile(
    'file',
    imageStream,
    imageLength,
    filename: _filename,
  );
  request.files.add(multipartFile);

  print("multipart${multipartFile}");
  final response = await request.send();
  if(response.statusCode == 200)
  {

    Fluttertoast.showToast(
      msg:"success",
      backgroundColor: Colors.grey,
    );


  }
  else
  {
    Fluttertoast.showToast(
      msg:"Failed",
      backgroundColor: Colors.grey,
    );

  }

}

  @override
  void dispose() {
    _itemNameController.dispose();
    _itemPriceController.dispose();
    super.dispose();
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
         SizedBox(height: 20),
            _image != null
                ? Image.file(
              _image!,
              width: 200,
              height: 200,
            )
                : Text('No image selected'),
            ElevatedButton(
                onPressed: (){
                  getImage();
                },
                child: Text('Pick Image')),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
              child: TextField(
                controller: _itemNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add food',
                  hintText: 'Enter item Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
              child: TextField(
                controller: _itemPriceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add price',
                  hintText: 'Enter item price',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey.withOpacity(0.5)),
                onPressed: () {
                  addproduct();
                },
                child: const Text(
                  'Add item',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            FutureBuilder<List<itemModel>>(
              future: client.fetchitem(),
              builder: (BuildContext cfetchproductontext,
                  AsyncSnapshot<List<itemModel>> snapshot) {

                print("snap${snapshot}");
                print("snap${prices}");
                if (snapshot.hasData) {
                  return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 75,
                        color: Colors.grey.withOpacity(0.4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("server/public/images/"+snapshot.data![index].item_image),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(

                                    ' ${snapshot.data![index].itemname}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.183,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Text(
                                    'price: ${snapshot.data![index].price}',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                                 ElevatedButton(
                                   style: ElevatedButton.styleFrom(primary: Colors.grey.withOpacity(0.5)),
                                   onPressed: () {},
                                   child: const Text(
                                     'Delete',
                                     style: TextStyle(fontSize: 16, color: Colors.black),
                                   ),
                                 ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),

          ],
        ),
      ),
    );
  }
}
