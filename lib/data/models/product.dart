import 'package:store_app/data/keys/json_keys.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String hint;
  final String description;
  final String imageUrl;
  final String category;
  final double ratting;
  final String shop;
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.hint,
    required this.imageUrl,
    required this.ratting,
    required this.shop,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    final id = json[JsonKeys.id];
    final name = json[JsonKeys.name];
    final ratting = json[JsonKeys.rating];
    final price = json[JsonKeys.price];
    final description = json[JsonKeys.description];
    final category = json[JsonKeys.category];
    final hint = json[JsonKeys.hint];
    final imageUrl = json[JsonKeys.imgUrl];
    final shop = json[JsonKeys.shop];
    return Product(
      id: id,
      name: name,
      price: price,
      description: description,
      category: category,
      hint: hint,
      imageUrl: imageUrl,
      ratting: ratting,
      shop: shop,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      JsonKeys.id: id,
      JsonKeys.name: name,
      JsonKeys.rating: ratting,
      JsonKeys.price: price,
      JsonKeys.description: description,
      JsonKeys.category: category,
      JsonKeys.hint: hint,
      JsonKeys.imgUrl: imageUrl,
      JsonKeys.shop: shop,
    };
  }
}
