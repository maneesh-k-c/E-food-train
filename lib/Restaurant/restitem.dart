import 'package:flutter/material.dart';

class ManageOrders extends StatefulWidget {
  const ManageOrders({Key? key}) : super(key: key);

  @override
  State<ManageOrders> createState() => _ManageOrdersState();
}

class _ManageOrdersState extends State<ManageOrders> {
  final List<String> containerImages = [
    'images/biri.png',
    'images/poro.png',
    'images/cn.png',
    'images/dosa.png',
  ];
  final List<String> items = [
    ' Chicken Biriyani',
    'Porotta',
    'Chicken Noodles',
    'Masaladosa',
  ];

  bool _isExpanded = false;

  void _approveUser(int index) {
    // Handle approve button pressed
  }

  void _declineUser(int index) {
    // Handle decline button pressed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Override the default Back button
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp, color: Colors.blueAccent),
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
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                "Order Details",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 35, color: Colors.black),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 20,
                );
              },
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.grey.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("${containerImages[index]}"),
                          ),
                          Column(
                            children: [
                              Text(
                                items[index],
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Description about the item",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                              },
                              child: Column(
                                children: [],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    // Handle approve button pressed
                                    _approveUser(index);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    // Handle decline button pressed
                                    _declineUser(index);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
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
