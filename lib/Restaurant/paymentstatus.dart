import 'package:flutter/material.dart';

class Paymentstatus extends StatefulWidget {
  const Paymentstatus({Key? key}) : super(key: key);

  @override
  State<Paymentstatus> createState() => _PaymentstatusState();
}

class _PaymentstatusState extends State<Paymentstatus> {
  final List<String> imageTitles = [
    "Customername:Sudheepth",
    "Customername:Vishnu",
    "Customername:Shamliya",
    "Customername:Vincy",
  ];
  final List<String> Titles = [
    "Order id:114454",
    "Order id:114453",
    "Order id:114466",
    "Order id:114425",
  ];
  final List<String> PaymetMethod = [
    "Googlepay",
    "UPI",
    "COD",
    "Googlepay",
  ];
  final List<String> Amount = [
    "Amount:300",
    "Amount:200",
    "Amount:70",
    "Amount:150",
  ];
  final List<String> Date = [
    "Date:12-1-2023",
    "Date:12-1-2023",
    "Date:12-1-2023",
    "Date:12-1-2023",
  ];
  final List<String> Time = [
    "Time:12.00pm",
    "Time:1.00pm",
    "Time:2.00pm",
    "Time:3.00pm",
  ];
  final List<String> phonenumber = [
    "9745072559",
    "8086030380",
    "7902641389",
    "9633601017",
  ];
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp, color: Colors.blueAccent),
          label: const Text(''),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.blueGrey[600],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                "Payment Status",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 40,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Disable list scrolling
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.blueGrey.withOpacity(0.4),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("images/profile.png"),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${imageTitles[index]}",
                                  style: TextStyle(
                                    color: Colors.blueAccent[800],
                                  ),
                                ),
                                Text(
                                  "${Titles[index]}",
                                  style: TextStyle(
                                    color: Colors.blueAccent[800],
                                  ),
                                ),
                                Text(
                                  "Paymet Method: ${PaymetMethod[index]}",
                                  style: TextStyle(
                                    color: Colors.blueAccent[800],
                                  ),
                                ),
                                Text(
                                  "${Date[index]}",
                                  style: TextStyle(
                                    color: Colors.blueAccent[800],
                                  ),
                                ),
                                Text(
                                  "${Time[index]}",
                                  style: TextStyle(
                                    color: Colors.blueAccent[800],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${Amount[index]}",
                            style: TextStyle(
                              color: Colors.blueAccent[800],
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: Colors.blueAccent,
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
