import 'package:efoodtrain/deliveryboy/boydetails.dart';
import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';

class assignboy extends StatefulWidget {
  const assignboy({Key? key}) : super(key: key);

  @override
  State<assignboy> createState() => _assignboyState();
}
final List<String> containerImages = [
  'images/man.png',
  'images/man.png',
  'images/man.png',
  'images/man.png',
];
final List<String> name = ['Sudheepth', 'Vishnu', 'Shamliya','Manu',];
final List<String> mob = ["7902647562", "9745073559", "9633611017", "8086939350"];

int simpleIntInput = 0;
final List<String> entries = <String>['Sudheepth', 'Vishnu', 'Shamliya','Manu',];
final List<String> number=['7902647562','9745073559','9633611017','8086939350',];
class _assignboyState extends State<assignboy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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
      backgroundColor: Colors.transparent,
      elevation: 0,
      // other stuff


    ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20),
              child: Text("Delivery Boys",
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
                              CircleAvatar(backgroundImage:AssetImage('${containerImages[index]}')



                                // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
                              ),/*Container(
                                    width: 80,
                                    child: Image.asset(containerImages[index],
                                        fit: BoxFit.cover),
                                  ),*/

                              Column(
                                children: [
                                  Text("${name[index]}",
                                    style: TextStyle(
                                      color: Colors.blueAccent[800]
                                    ),
                                  ),
                                  Text("${mob[index]}",
                                    style: TextStyle(
                                      color: Colors.blueAccent[800]
                                    ),
                                  ),

                                ],
                              ),
                              ElevatedButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Boydetails()));
                              },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.grey.withOpacity(0.4),
                                  //onPrimary: Colors.white,
                                ),
                                child:
                                Text("Forward",
                                  style: TextStyle(
                                      color: Colors.blueGrey[800]
                                  ),),

                              ),

                              Icon(Icons.location_on,color: Colors.green,),
                            ]
                        ),
                      ),
                    ),

                  ),
                );
              },
            ),

          ],
        ),

      ),



    );
  }





}






