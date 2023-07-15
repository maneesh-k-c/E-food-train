import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class manageboys extends StatefulWidget {
  const manageboys({Key? key}) : super(key: key);

  @override
  State<manageboys> createState() => _manageboysState();
}

final List<String> containerImages = [
  'images/man.png',
  'images/man.png',
  'images/man.png',
  'images/man.png',
];
final List<String> name = ['Sudheepth.c', 'Vishnu', 'Shamliya','Manu',];
final List<String> mob = ["7902647562", "9745073559", "9633611017", "8086939350"];

int simpleIntInput = 0;
final List<String> entries = <String>['Sudheepth', 'Vishnu', 'Shamliya','Manu',];
final List<String> number=['7902647562','9745073559','9633611017','8086939350',];
class _manageboysState extends State<manageboys> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  void _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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

            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text("Manage",
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
                              CircleAvatar(backgroundImage: AssetImage(
                                  '${containerImages[index]}')


                                // child: Image.asset(containerImages[index],fit: BoxFit.cover,),
                              ), /*Container(
                                    width: 80,
                                    child: Image.asset(containerImages[index],
                                        fit: BoxFit.cover),
                                  ),*/

                              Column(
                                children: [
                                  Text("${name[index]}"
                                  ),
                                  Text("${mob[index]}"
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.0),

                              IconButton(
                                onPressed: () {
                                  Alert(
                                    context: context,
                                    title: "Successfully edited",
                                    content: Icon(Icons.check_circle),
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "OK",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => manageboys())),
                                        color: Colors.blueAccent,
                                        radius: BorderRadius.circular(0.0),
                                      ),
                                    ],
                                  ).show();
                                },
                                icon: Icon(Icons.edit, color: Colors.blueAccent),
                              ),

                              SizedBox(height: 4.0),

                              IconButton(
                                onPressed: () {
                                  Alert(
                                    context: context,
                                    title: "Successfully deleted",
                                    content: Icon(Icons.check_circle),
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "OK",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => manageboys())),
                                        color: Colors.blueAccent,
                                        radius: BorderRadius.circular(0.0),
                                      ),
                                    ],
                                  ).show();
                                },
                                icon: Icon(Icons.delete, color: Colors.blueAccent),
                              ),
                            ]),
                      ),
                    ),

                  ),
                );
              },
            ),
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Name',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              labelText: 'phone number',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: _ageController,
                            decoration: InputDecoration(
                              labelText: 'age',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your age';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Perform the booking operation
                                String name = _nameController.text;
                                String email = _ageController.text;
                                String phone = _phoneController.text;

                                // TODO: Perform the booking operation using the entered data
                                Navigator.pop(context);
                                // Show a dialog to indicate successful booking
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Successful'),
                                      content: Text(
                                        'deliveryboy added successfully',
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },

                                );
                              }
                            },
                            child: Text('Add'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
            // Add your action here

          child: Icon(Icons.add),
      ),
    );
  }
}