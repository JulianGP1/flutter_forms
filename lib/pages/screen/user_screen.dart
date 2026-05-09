import 'package:flutter/material.dart';

import 'package:shop/services/users_service.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final userService = UserService();
  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final data = await userService.getUserData();

    setState(() {
      userData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (userData == null) {
      return const Scaffold(
        body: Center(child: Text('No hay usuario')),
      );
    }

    return Scaffold(
       
      body: Center(
 
        child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Email: ${userData!['email']}'),
            Text( 'Nombre: ${userData!['nombre'] ?? 'No disponible'}'),
           CircleAvatar(
  radius: 50,
  backgroundImage: userData!['avatar_url'] != null
      ? NetworkImage(userData!['avatar_url'])
      : null,
  child: userData!['avatar_url'] == null
      ? const Icon(Icons.person, size: 50)
      : null,
)
          ],
        ),
      ),
    );
  }
}