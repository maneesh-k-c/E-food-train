class userModel{
  final String name;
  final String phn;
  final String email;


  userModel({required this.name, required this.phn, required this.email});


  factory userModel.fromJson(Map<String, dynamic> json) {
    return userModel(
        name: json['user_name'],
        phn: json['phone_no'],
        email: json['email'],
        );
    }
}