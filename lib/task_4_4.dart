import 'package:flutter/material.dart';

class Product {
  final String title;
  final double price;

  const Product({required this.title, required this.price});
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const ProductHome(),
      '/edit-product': (context) => const EditProductScreen(),
    },
  ));
}

class ProductHome extends StatefulWidget {
  const ProductHome({super.key});

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  Product _currentProduct = const Product(title: 'Flutter Book', price: 29.99);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _currentProduct.title,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  '\$${_currentProduct.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 22, color: Colors.green),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    final Product? updatedProduct = await Navigator.pushNamed<Product>(
                      context,
                      '/edit-product',
                      arguments: _currentProduct,
                    );

                    if (updatedProduct != null) {
                      setState(() {
                        _currentProduct = updatedProduct;
                      });
                    }
                  },
                  child: const Text('Edit Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController _titleController;
  late TextEditingController _priceController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;
    
    _titleController = TextEditingController(text: product.title);
    _priceController = TextEditingController(text: product.price.toString());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Product Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                final String title = _titleController.text.trim();
                final double? price = double.tryParse(_priceController.text.trim());

                if (title.isNotEmpty && price != null) {
                  final updatedProduct = Product(title: title, price: price);
                  Navigator.pop(context, updatedProduct);
                }
              },
              child: const Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}