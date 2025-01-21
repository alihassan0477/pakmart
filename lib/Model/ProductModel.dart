import 'dart:convert';
import 'package:pakmart/Model/SellerModel.dart';

class Product {
  String? id;
  String name;
  String category;
  int price;
  int stock;
  String description;
  Seller seller; // Seller is now a reference to the Seller model
  List<String> images;
  List<Specifications> specifications;

  // Constructor
  Product(
      {this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.stock,
      required this.description,
      required this.seller,
      required this.images,
      required this.specifications});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['_id'] as String,
        name: json['name'] as String,
        category: json['category']['name'] as String,
        price: json['price'] as int,
        stock: json['stock'] as int,
        description: json['description'] as String,
        seller: Seller.fromJson(json['seller']),
        images: List<String>.from(
          json['images'] ?? [],
        ),
        specifications: (json['specifications'] as List<dynamic>)
            .map(
              (spec) => Specifications.fromJson(spec),
            )
            .toList());
  }

  // Method to convert Product to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'category': category,
      'price': price,
      'stock': stock,
      'description': description,
      'seller': seller.toJson(), // Convert seller object to JSON
      'images': images,
    };
  }
}

class Specifications {
  Specifications({required this.key, required this.value});
  String key;
  String value;

  factory Specifications.fromJson(Map<String, dynamic> json) {
    return Specifications(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }
}
