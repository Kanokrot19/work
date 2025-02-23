import 'package:flutterprojects/model/product_data.dart';
import 'package:flutterprojects/page_ansewr/api_product.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  final ProductAPI api = ProductAPI();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  Future<void> createProduct(BuildContext context) async {
    final name = _nameController.text.trim();
    final description = _descriptionController.text.trim();
    final priceText = _priceController.text.trim();

    if (name.isEmpty || description.isEmpty || priceText.isEmpty) {
      print('กรุณากรอกข้อมูลให้ครบ');
      return;
    }

    final price = double.tryParse(priceText);
    if (price == null) {
      print('กรุณากรอกตัวเลขในช่องราคา');
      return;
    }

    try {
      await api.createProduct(name, description, price);
      print('Product created.');
      Navigator.pop(context, true);
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Product Detail', style: TextStyle(fontSize: 20)),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => createProduct(context), // บันทึกสินค้า
              child: const Text('Create Product'),
            ),
          ],
        ),
      ),
    );
  }
}
