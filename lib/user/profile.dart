import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        ),
          body:
      Column(
        children: [
          Container(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("images/profile.png"),
                  ),
                ),
                Text(
                  "Sudheepth",
                ),
                Icon(Icons.edit,color: Colors.orange,),
              ],
            )

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "0987986875",
              ),
              Icon(Icons.edit,color: Colors.orange,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "sudheepth@ggmail.com",
              ),
              Icon(Icons.edit,color: Colors.orange,),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20),
            child: Text("Update train Details",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Train PNR",
              ),
              Text(
                "87452134",
              ),
              Icon(Icons.edit,color: Colors.orange,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Seat no:",
              ),
              Text(
                "84",
              ),
              Icon(Icons.edit,color: Colors.orange,),
            ],
          ),
        ],
      ),
    );
  }
}
