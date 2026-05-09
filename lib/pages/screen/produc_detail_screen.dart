import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/services/product_service.dart';
import 'package:shop/models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final int id;

  const ProductDetailScreen({super.key, required this.id});

  @override
  State<ProductDetailScreen> createState() =>
      ProductDetailScreenState();
}

class ProductDetailScreenState
    extends State<ProductDetailScreen> {
  late Future<Product?> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct =
        ProductService().getProductById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
         
      body: FutureBuilder<Product?>(
        future: futureProduct,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text("Error al cargar"));
          } else if (!snapshot.hasData ||
              snapshot.data == null) {
            return const Center(
                child: Text("No disponible"));
          }

          final data = snapshot.data!;

          return Center(
            
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
             
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(12),
                    child: Image.network(
                      data.images.isNotEmpty
                          ? data.images.first
                          : 'https://via.placeholder.com/150',
                      height: 180,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      mainAxisSize:
                          MainAxisSize.min,
                      children: [
                        Text(
                          data.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight:
                                FontWeight.bold,
                      
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          "${data.category.name} - \$${data.price}",
                          
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          "Descripción:",
                           
                        ),
                        Text(
                          data.description,
                           
                        ),

                        const SizedBox(height: 16),

                        OutlinedButton(
                          onPressed: () {
                            context.go('/productos');
                          },
                          child:
                              const Text("Volver"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}