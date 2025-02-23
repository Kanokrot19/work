import 'dart:convert';
import 'package:http/http.dart' as http;

class Products {
  final int? id;
  final String name;
  final String description;
  final double price;

  Products({
    this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}

