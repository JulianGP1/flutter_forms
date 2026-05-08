import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 

    return Scaffold(
  
 

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BIENVENIDO A LA TIENDA ONLINE",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Inicia sesión o crea una cuenta para explorar nuestros productos",
              style: TextStyle(fontSize: 16),
            ),
 SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.go('/register');
              },
              child: const Text('Crear cuenta'),
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 119, 185, 230),
                minimumSize: Size(150, 40),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                
                textStyle: TextStyle(color: const Color.fromARGB(255, 243, 241, 241),fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
              SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text('Iniciar sesión'),
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 119, 185, 230),
                minimumSize: Size(150, 40),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

                textStyle: TextStyle(color: const Color.fromARGB(255, 243, 241, 241),fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}