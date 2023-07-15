import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Usernotificaion extends StatelessWidget {
  final String userPhotoUrl =
      'images/man.png'; // Replace with the user's photo URL

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

    backgroundColor: Colors.white70,
    elevation:0,
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello User,',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userPhotoUrl),
                  radius: 30.0,
                ),
              ),
            ],
          ),
         SizedBox(height: 25.0),
          Container(
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              color: Colors.grey.withOpacity(0.4),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.blueGrey.withOpacity(0.8), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey John!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "Ram just grabbed your order from Ritzy restaurant.your delivery is on schedule for 1.00pm",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}