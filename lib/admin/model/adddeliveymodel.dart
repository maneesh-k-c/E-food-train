class adddeliveryModel {
  final String name;
  final String phnno;
  final String age;
  final String id;


  adddeliveryModel({required this.name,
    required this.phnno,
    required this.age,
    required this.id,

  });

  factory adddeliveryModel.fromJson(Map<String, dynamic> json) {
    return adddeliveryModel(
      name: json['name']==''?'':json['name'],
      phnno: json['phone_no']==''?'':json['phone_no'],
      age: json['age']==''?'':json['age'],
      id: json['_id']==''?'':json['_id'],
    );
  }
}