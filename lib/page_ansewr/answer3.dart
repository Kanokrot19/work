import 'package:flutter/material.dart';

class Answer3 extends StatelessWidget {
  const Answer3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Layout'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            width: double.infinity,
            color: Colors.orange,
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Product Layout',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),

          // Category Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: Colors.grey[300],
            child: const Text(
              'Category: Electronics',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Product Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: [
                  ProductItem(
                    imageUrl: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?q=80&w=2342&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    name: 'Laptop',
                    price: '999 THB',
                  ),
                  ProductItem(
                    imageUrl: 'https://plus.unsplash.com/premium_photo-1681233750830-dfbb25c7abc0?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    name: 'Smartphone',
                    price: '699 THB',
                  ),
                  ProductItem(
                    imageUrl: 'https://images.unsplash.com/photo-1611532736597-de2d4265fba3?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    name: 'Tablet',
                    price: '499 THB',
                  ),
                  ProductItem(
                    imageUrl: 'https://images.unsplash.com/photo-1460134846237-51c777df6111?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    name: 'Camera',
                    price: '299 THB',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const ProductItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Product Image
        Image.network(
          imageUrl,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 8),
        // Product Name
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Product Price
        Text(
          price,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
