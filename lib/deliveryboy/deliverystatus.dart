import 'package:flutter/material.dart';
class Opens extends StatefulWidget {
  const Opens({Key? key}) : super(key: key);

  @override
  State<Opens> createState() => _opensState();
}

class _opensState extends State<Opens> {

  final List<String> imageTitles = [
    "Customername:Sudheepth",
    "Customername:Vishnu",
    "Customername:Shamliya",
    "Customername:Basil"
  ];
  final List<String> Titles = [
    "Order id:114456",
    "Order id:114456",
    "Order id:114456",
    "Order id:114456"
  ];

  final List<String> Date = [ "Date:12-1-2023", "Date:12-1-2023", "Date:12-1-2023", "Date:12-1-2023"];
  final List<String> Time = [ "Time:12.00pm", "Time:1.00pm", "Time:2.00pm", "Time:3.00pm"];
  final List<String> phonenumber = [ "989656569", "7896546559", "9455656059.", "986562325"];
  bool _isExpanded = false;


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

              Text("Delivery Status",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 40)),

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
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(

                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                  backgroundImage: AssetImage("images/man.png")


                                // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
                              ), /*Container(
                                    width: 80,
                                    child: Image.asset(containerImages[index],
                                        fit: BoxFit.cover),
                                  ),*/
SizedBox(width: 150,),
                              Column(

                                children: [

                                  Text("${imageTitles[index]}",
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),

                                  Text("${Titles[index]}",
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),

                                  Text("${Date[index]}",
                                    style: TextStyle(color: Colors.grey[500]),
                                  ),
                                  Text("${Time[index]}",
                                    style: TextStyle(color: Colors.grey[500]),
                                  ),
                                ],
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
  }}
