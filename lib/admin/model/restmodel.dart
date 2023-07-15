class RestaurentModel{
  final String name;
  final String id;
 // final String image;

  final String location;
  final String pno;

  RestaurentModel({required this.name, required this.id, required this.location, required this.pno});


  factory RestaurentModel.fromJson(Map<String, dynamic> json) {
    return RestaurentModel(
      name: json['restaurant_name'],
      id: json['logid'],
    //  image: json['logid'],
      location: json['location']==null?"":json['location'],
      pno: json['Phone_no'],
    );
  }
}