import 'package:flutter/material.dart';

class manageorder extends StatefulWidget {
  const manageorder({Key? key}) : super(key: key);

  @override
  State<manageorder> createState() => _manageorderState();
}
final List<String> containerImages = [
  'images/man.png',
  'images/man.png',
  'images/man.png',
  'images/man.png',
];
class _manageorderState extends State<manageorder> {
  bool _isExpanded=false;

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
                padding: const EdgeInsets.all(30),
                child: Text("Order Details",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 35)),
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
                              CircleAvatar(backgroundImage:AssetImage("${containerImages[index]}")
                              ),/*Container(
                                    width: 80,
                                    child: Image.asset(containerImages[index],
                                        fit: BoxFit.cover),
                                  ),*/

                              Column(
                                children: [
                                  Text("Parippuvada",
                                    style: TextStyle(
                                        color: Colors.black
                                    ),

                                  ),
                                  Text("Pazhampori",
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  ),
                                  Text("Samosa",
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  ),
                                  Text("uzhunnuvada",
                                    style: TextStyle(
                                        color: Colors.black
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
                              Icon(Icons.arrow_downward_rounded),


                              ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey.withOpacity(0.5),
                                  //onPrimary: Colors.black,
                                ),
                                child:
                                Text("Accept",
                                  style: TextStyle(
                                      color: Colors.black
                                  ),

                                ),
                              ),
                              ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey.withOpacity(0.5),
                                  //onPrimary: Colors.black,
                                ),
                                child:
                                Text("Reject",
                                  style: TextStyle(
                                      color: Colors.black
                                  ),),

                              ),
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






// child: Image.asset(containerImages[index],fit: BoxFit.cover,),
