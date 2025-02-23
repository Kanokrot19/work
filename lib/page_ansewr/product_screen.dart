import 'package:flutterprojects/page_ansewr/api_product.dart';
import 'package:flutterprojects/model/product_data.dart';
import 'package:flutterprojects/page_ansewr/edit_product.dart';
import 'package:flutterprojects/page_ansewr/add_product.dart';
import 'package:flutter/material.dart';

class WS_Product extends StatefulWidget {
  const WS_Product({super.key});

  @override
  State<WS_Product> createState() => _WS01State();
}

class _WS01State extends State<WS_Product> {
  final ProductAPI api = ProductAPI();
  List<Products> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    setState(() => isLoading = true);
    try {
      products = await api.fetchProducts();
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product'), centerTitle: true, backgroundColor: const Color.fromARGB(255, 169, 237, 219)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : products.isEmpty
                        ? const Center(child: Text('No products found.'))
                        : ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return ListTile(
                                title: Text(product.name),
                                subtitle: Text(product.description),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('\$${product.price.toStringAsFixed(2)}'),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () async {
                                        final result = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditProduct(product: product),
                                          ),
                                        );
                                        if (result == true) {
                                          fetchProducts();
                                        }
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () async {
                                        final confirm = await showDialog<bool>(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text('ยืนยันการลบ'),
                                            content:
                                                const Text('คุณต้องการลบสินค้านี้หรือไม่?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context, false),
                                                child: const Text('ยกเลิก'),
                                              ),
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context, true),
                                                child: const Text('ลบ'),
                                              ),
                                            ],
                                          ),
                                        );

                                        if (confirm == true) {
                                          await api.deleteProduct(id: product.id!);
                                          fetchProducts();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    '/add_product',
                  );
                  if (result == true) {
                    fetchProducts();
                  }
                },
                child: const Text("+ Products"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}