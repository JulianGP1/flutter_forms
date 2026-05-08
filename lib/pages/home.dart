import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/providers/theme_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
  

      appBar: AppBar(
        title: const Text("Home"),
         
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Segundo parcial Dispositivos moviles",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Julian Guerrero Paredes 192237",
              style: TextStyle(fontSize: 16),
            ),
 
            TextButton(
              onPressed: () {
                context.go('/register');
              },
              child: const Text('Crear cuenta'),
            ),
            TextButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}