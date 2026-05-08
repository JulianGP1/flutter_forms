import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/widget/drawer.dart';
class ProductosScreen extends StatelessWidget {
  const ProductosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
       drawer:AppDrawer(),
      body: const Center(
        child:Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Buscar productos',
                border: OutlineInputBorder(),
              ),
            )

          ],
        )
      ),
    );
  }
}