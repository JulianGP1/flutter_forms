import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/l10n/app_localizations.dart';
import 'package:shop/services/auth_service.dart';
import 'package:shop/services/users_service.dart';

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
  final userService = UserService();

  bool loading = false;

  String? avatarUrl;

  Future<void> pickAndUploadImage() async {
    final url = await userService.uploadAvatar();

    if (url != null) {
      setState(() {
        avatarUrl = url;
      });
    }
  }

  Future<void> register() async {
    setState(() {
      loading = true;
    });

    final error = await authService.register(
      nombre: nombreController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (error == null) {
      if (avatarUrl != null) {
        await userService.saveAvatarUrl(avatarUrl!);
      }
    }

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

    context.go('/productos');
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.create),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

    
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      avatarUrl != null ? NetworkImage(avatarUrl!) : null,
                  child: avatarUrl == null
                      ? const Icon(Icons.person, size: 50)
                      : null,
          
             ),
              
                TextButton(
                  onPressed: pickAndUploadImage,
                  child: const Text('Seleccionar foto'),
                ),
                
              ],
            ),

          
            TextField(
              controller: nombreController,
              decoration: InputDecoration(
                labelText: t.user,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: t.email,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),


            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: t.password,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loading ? null : register,
                child: loading
                    ? const CircularProgressIndicator()
                    : Text(t.create),
              ),
            ),

            const SizedBox(height: 10),

        
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.go('/login'),
                child: Text(t.allreadyregister),
              ),
            ),
          ],
        ),
      ),
    );
  }
}