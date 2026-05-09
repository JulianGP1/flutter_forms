import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/services/product_service.dart';
import 'package:shop/models/product_model.dart';

class Productos_Screen extends StatelessWidget {
  const Productos_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        
        future: ProductService().getProducts().then(
          (products) => products.where((p) => p.category.id != 0).toList(),
        ),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.hasData) {
            final List<Product> data = snapshot.data!;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, index) {
                final product = data[index];

                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: product.images.isNotEmpty
                        ? Image.network(
                            product.images.first,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image, size: 60);
                            },
                          )
                        : const Icon(Icons.image, size: 60),
                  ),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  onTap: () {
                    context.go('/product/${product.id}', extra: product.title);
                  },
                  
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
