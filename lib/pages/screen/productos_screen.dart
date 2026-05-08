import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/services/product_service.dart';
import 'package:shop/models/product_model.dart';
class ProductosScreen extends StatelessWidget {
  const ProductosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
 
      body: FutureBuilder <List<Product>>(
        future: ProductService().getProducts().then((data) => data.map((item) => Product.fromJson(item)).toList()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(product.image, width: 50, height: 50),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  onTap: () => context.push('/product/${product.id}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}