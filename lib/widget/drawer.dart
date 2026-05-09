import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/providers/theme_provider.dart';
import 'package:shop/providers/lenguaje_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
 
class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = AuthService();
    final session = Supabase.instance.client.auth.currentSession;
    final isLoggedIn = session != null;
 
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: const Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
              
            ),
            
          ),
           
          
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              context.go('/productos');
            },
          ),
           
       
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Toggle Theme'),
            onTap: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Cambiar idioma'),
            onTap: () {
              ref.read(languajeProvider.notifier).toggleLanguage();
            },
          ),
         
         
          if (isLoggedIn) 
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              onTap: () async {
                await authService.logout();
                if (!context.mounted) return;
                context.go('/home');
              },
            ),
            if (isLoggedIn)
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('user data'),
              onTap: () {
                context.go('/userdata');
              },
            ),
        ],
      ),
    );
  }
}
