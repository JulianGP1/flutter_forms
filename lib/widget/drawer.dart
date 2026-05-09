import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/providers/theme_provider.dart';
import 'package:shop/providers/lenguaje_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shop/l10n/app_localizations.dart';
class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = AuthService();
    final session = Supabase.instance.client.auth.currentSession;
    final isLoggedIn = session != null;
     final t = AppLocalizations.of(context)!;
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
            title:   Text(t.home),
            onTap: () {
              context.go('/productos');
            },
          ),
           
       
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title:   Text(t.toggle_theme),
            onTap: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title:   Text(t.change_language),
            onTap: () {
              ref.read(languajeProvider.notifier).toggleLanguage();
            },
          ),
         
         
          if (isLoggedIn) 
            ListTile(
              leading: const Icon(Icons.logout),
              title:   Text(t.log_out),
              onTap: () async {
                await authService.logout();
                if (!context.mounted) return;
                context.go('/home');
              },
            ),
            if (isLoggedIn)
            ListTile(
              leading: const Icon(Icons.login),
              title:   Text(t.user_data),
              onTap: () {
                context.go('/userdata');
              },
            ),
        ],
      ),
    );
  }
}
