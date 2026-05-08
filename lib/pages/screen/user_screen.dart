import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/services/auth_service.dart';
import 'package:shop/widget/drawer.dart';
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final authService = AuthService(); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Screen'),
        
      ),
      
     
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () async {
            await authService.logout(); 
            if (!context.mounted) return;
            context.go('/login');
          },
          
          icon: Icon(Icons.logout),
          label: Text('Cerrar sesión'),
        ),
      ),
    );
  }
}