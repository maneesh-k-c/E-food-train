class itemModel {
  final String itemname;
  final String price;
  final String item_image;
  final String id;


  itemModel({required this.itemname,
    required this.price,
    required this.item_image,
    required this.id,

  });

  factory itemModel.fromJson(Map<String, dynamic> json) {
    return itemModel(
        itemname: json['item_name']==''?'':json['item_name'],
        price: json['price']==''?'':json['price'],
        item_image: json['item_image']==''?'':json['item_image'],
        id: json['_id']==''?'':json['_id'],

        );
    }
}