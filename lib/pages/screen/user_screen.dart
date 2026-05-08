import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/services/auth_service.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
         
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              
              context.push('/createProducto');
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(Icons.add_box, size: 40),
                  SizedBox(width: 15),
                  Text('Crear producto', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
