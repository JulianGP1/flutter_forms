// pages/login_page.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/services/auth_service.dart';
import 'package:shop/l10n/app_localizations.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final _nombreController = TextEditingController();
  final _passwordController = TextEditingController();
 
  final authService = AuthService();

  bool loading = false;

  Future<void> login() async {

    setState(() {
      loading = true;
    });

    final error = await authService.loginWithNombre(
      nombre: _nombreController.text.trim(),
      password: _passwordController.text.trim(),
    );

    setState(() {
      loading = false;
    });

    if (!mounted) return;

    if (error != null) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
      
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bienvenido')),
    );

    context.go('/productos');
  }

  @override
  Widget build(BuildContext context) {
 final t = AppLocalizations.of(context)!;
    return Scaffold(
       
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller:_nombreController,
              decoration:   InputDecoration(
                labelText: t.user,
                border: OutlineInputBorder(),
              ),
            ),
            

            const SizedBox(height: 20),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration:   InputDecoration(
                labelText: t.password,
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: 200,

              child: ElevatedButton(
                onPressed: loading ? null : login,

                child: loading
                    ? const CircularProgressIndicator()
                    :  Text(t.login),
              ),
            ),
              const SizedBox(height: 20),
             SizedBox(
              width:300,
              child: ElevatedButton(
                onPressed: loading ? null : () => context.go('/register'),

                child: loading
                    ? const CircularProgressIndicator()
                    :  Text(t.question),
              ),
            ),
          ],
        ),
      ),
    );
  }
}