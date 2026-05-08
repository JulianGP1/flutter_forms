import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
 
import 'package:shop/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
final nombreController = TextEditingController();
  final authService = AuthService();

  bool loading = false;

  Future<void> register() async {

    setState(() {
      loading = true;
    });

    final error = await authService.register(
      nombre: nombreController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    setState(() {
      loading = false;
    });

    if (error != null) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Usuario registrado')),
    );
 
     context.go('/user');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: loading ? null : register,

                child: loading
                    ? const CircularProgressIndicator()
                    : const Text('Registrarse'),
              ),
            ), 
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () => context.go('/login'),
                child: const Text('¿Ya tienes cuenta? Inicia sesión'),  
              ),
            )

          ],
        ),
      ),
    );
  }
}