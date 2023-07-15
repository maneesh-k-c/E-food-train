import 'package:efoodtrain/user/orderitems.dart';
import 'package:flutter/material.dart';

class Restfood extends StatefulWidget {
  const Restfood({Key? key}) : super(key: key);

  @override
  State<Restfood> createState() => _RestfoodState();
}

class _RestfoodState extends State<Restfood> {
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
      body:

        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 0,right: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/rest.png"),
                      fit: BoxFit.fitWidth,
                    ),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.4),
                          Colors.grey.withOpacity(0.4),
                        ]
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.account_circle,color: Colors.grey,size: 40,),

                        Text("Hey John,what you are looking for?",
                          style: TextStyle(
                            color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        )

                      ],
                    ),
                  ),


                ),

              ),

    Padding(
          padding: const EdgeInsets.all(30),
          child: TextField (
          decoration: InputDecoration( border: OutlineInputBorder(),
          labelText: 'Station',
          hintText: 'Enter Station Name'
          ),
          ),
    ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: TextField (
                  decoration: InputDecoration( border: OutlineInputBorder(),
                      labelText: 'Item',
                      hintText: 'Enter Food Item'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("Restaurants",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ListView(
                        shrinkWrap: true,
                        children: <Widget>[
    GestureDetector(
      onTap: (){
          Navigator.push(
            context,MaterialPageRoute(builder: (context)=>Order()),);},
      child: ListTile(
      leading: Icon(Icons.restaurant,color: Colors.blueAccent,),
      title: Text('Ritzy',
          style: TextStyle(
            color: Colors.black,
          ),
      ),
      trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,)
      ),
    ),
    ],
  ),


    Divider(),
                      ],
                    )
                ),
              )
    ],



          ),
        ),


    );
  }
}
