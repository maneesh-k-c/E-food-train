class CartModel {
  final String name;
  final String id;
  final String price;
  final String imageUrl;
  final String quantity;
  final String cartStatus;

  CartModel({
    required this.name,
    required this.id,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.cartStatus,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['_id'],
      name: json['item_name'],
      price: json['price'],
      imageUrl: json['item_image'],
      quantity: json['quantity'],
      cartStatus: json['status'],
    );
  }
}
