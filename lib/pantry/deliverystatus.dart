import 'package:flutter/material.dart';

class Viewdeliverystatus extends StatefulWidget {
  const Viewdeliverystatus({Key? key}) : super(key: key);

  @override
  State<Viewdeliverystatus> createState() => _ViewdeliverystatusState();
}

class _ViewdeliverystatusState extends State<Viewdeliverystatus> {
  bool _isExpanded=false;
  List<String>bill=["58","36","30","61"];
  List<String>entries=["Sudheepth","Vishnu","Shamliya","Vincy"];

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
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Delivery status",
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
                      color: Colors.grey.withOpacity(0.4),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(backgroundImage:AssetImage("images/profile.png")
                              ),/*Container(
                                    width: 80,
                                    child: Image.asset(containerImages[index],
                                        fit: BoxFit.cover),
                                  ),*/

                              Column(
                                children: [
                                  Text("Name:${entries[index]}",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text("Bill no:${bill[index]}",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),


                              Center(child: TextButton(onPressed:(){setState(() {
                                _isExpanded=!_isExpanded;
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
              ),
            ]
        ),
      ),
    );
  }
}

