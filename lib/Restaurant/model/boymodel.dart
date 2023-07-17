class deliveryBoyModel{
  final String id;
  final String uname;
  final String fname;
  final String lname;
  final String logid;
  final String pno;
  final String address;
  final String mail;

  deliveryBoyModel({required this.id,required this.uname, required this.fname,required this.lname, required this.logid, required this.pno, required this.address, required this.mail});


  factory deliveryBoyModel.fromJson(Map<String, dynamic> json) {
    return deliveryBoyModel(
      id: json['_id'],
      uname: json['username'],
      fname: json['first_name'],
      lname: json['last_name'],
      logid: json['logid']==null?'':json['logid'],
      pno: json['Phone_no'],
      address: json['address'],
      mail: json['email'],
    );
  }
}