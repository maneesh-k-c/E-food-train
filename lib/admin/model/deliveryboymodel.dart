class deliveryboyModel{
  final String name;
  final String fname;
  final String lname;
  final String id;
  final String pno;

  deliveryboyModel({required this.name, required this.fname,required this.lname, required this.id, required this.pno});


  factory deliveryboyModel.fromJson(Map<String, dynamic> json) {
    return deliveryboyModel(
      name: json['username'],
      fname: json['first_name'],
      lname: json['last_name'],
      id: json['logid'],
      pno: json['Phone_no'],
    );
  }
}