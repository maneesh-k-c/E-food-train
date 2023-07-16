class deliveryboyModel{
  final String uname;
  final String fname;
  final String lname;
  final String id;
  final String pno;
  final String address;
  final String mail;

  deliveryboyModel({required this.uname, required this.fname,required this.lname, required this.id, required this.pno, required this.address, required this.mail});


  factory deliveryboyModel.fromJson(Map<String, dynamic> json) {
    return deliveryboyModel(
      uname: json['username'],
      fname: json['firstname'],
      lname: json['lastname'],
      id: json['restaurant_id'],
      pno: json['Phone_no'],
      address: json['address'],
      mail: json['email'],
    );
  }
}