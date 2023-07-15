import 'package:flutter/material.dart';
class welcomepage extends StatefulWidget {
  const welcomepage({Key? key}) : super(key: key);

  @override
  State<welcomepage> createState() => _welcomepageState();
}

class _welcomepageState extends State<welcomepage> {
  final List<String>_listItem=[
    "images/img1.jpg",
    "images/img2.jpeg",
    "images/img3.jpg",
    "images/img4.jpeg"
  ];
  int _selectedIndex = 0;
  void _onItemTapped(index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
      return SafeArea(
          child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0,
          leading: Icon(Icons.menu, color: Colors.green),
      title: Center(
      child: Text(
      "Home",
      style: TextStyle(color: Colors.green),
      )),
      actions: <Widget>[
      Padding(
      padding: EdgeInsets.only(top: 10.0,left: 10,right: 10,bottom: 50.0),
      child: Container(
      width: 36,
      height: 30,
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10)),
      child: Center(child: Text("new")),
      ),
      )
      ],
      ),
      body: SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
      Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(
    image: AssetImage('images/banner.png'),
    fit: BoxFit.cover)),
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    gradient:
    LinearGradient(begin: Alignment.bottomRight, colors: [
    Colors.black.withOpacity(.6),
    Colors.black.withOpacity(.6),
    ])),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
    Text(
    "E-FOOD",
    style: TextStyle(
    color: Colors.red,
    fontSize: 35,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(
    height: 30,
    ),
    Container(
    height: 50,
    margin: EdgeInsets.symmetric(horizontal: 40),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white),
    child: Center(
    child: Text(
    "Get Your Best Food Around You",
    style: TextStyle(
    color: Colors.grey[900],
    fontWeight: FontWeight.bold,
    ),
    )),
    ),
    SizedBox(
    height: 30,
    ),
    ],
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(
    bottom: 100.0, top: 8, left: 8, right: 8),
    child: GridView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: _listItem.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 5,
    mainAxisSpacing: 5),
    itemBuilder: (BuildContext context, int index) {
    return Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    image: DecorationImage(
    image: AssetImage(_listItem[index]),
    fit: BoxFit.cover,
    ),
    ),
    );
    },
    ),
    )
    ]),
    ),
    ),
    bottomNavigationBar: BottomNavigationBar(
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.blue,
    type: BottomNavigationBarType.shifting,
    currentIndex: _selectedIndex,
    onTap: _onItemTapped,
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'home',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.local_taxi),
    label: 'order',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.share),
    label: 'offer',
    ),
      BottomNavigationBarItem(
        icon: Icon(Icons.group),
        label: 'profile',
      ),


    ],
    ),
          ),
          );
  }
}




