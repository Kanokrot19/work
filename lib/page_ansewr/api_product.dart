import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutterprojects/model/product_data.dart';

class ProductAPI {
  Future<List<Products>> fetchProducts() async {
    final String url = 'http://localhost:8001/products';
    try {
      final response = await http.get(Uri.parse(url));
      print('Response: ${response.body}'); // 👉 Debug JSON
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Products.fromJson(json)).toList();
      } else {
        throw Exception("Can't get products.");
      }
    } catch (e) {
      print('Error Reading : $e');
      return [];
    }
  }

  Future<void> createProduct(
      String name, String description, double price) async {
    final String url = 'http://localhost:8001/products';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'name': name,
          'description': description,
          'price': price,
        }),
      );
      if (response.statusCode == 201) {
        print('Product created.');
      } else {
        throw Exception("Can't create product.");
      }
    } catch (e) {
      print('Error Creating : $e');
    }
  }

  Future<void> updateProduct(
      int id, String name, String description, double price) async {
    final String url = 'http://localhost:8001/products/$id';
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'name': name,
          'description': description,
          'price': price,
        }),
      );
      if (response.statusCode == 200) {
        print('Product updated.');
      } else {
        throw Exception("Can't update product.");
      }
    } catch (e) {
      print('Error Updating : $e');
    }
  }

  Future<void> deleteProduct({required int id}) async {
    final String url = 'http://localhost:8001/products/$id';
    try {
      final response = await http.delete(Uri.parse(url));
      if (response.statusCode == 200) {
        print('Product deleted.');
      } else {
        throw Exception("Can't delete product.");
      }
    } catch (e) {
      print('Error Deleting : $e');
    }
  }
}
