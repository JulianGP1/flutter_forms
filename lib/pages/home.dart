import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/providers/lenguaje_provider.dart';
import 'package:shop/l10n/app_localizations.dart';
import 'package:shop/providers/theme_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              t.welcome,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(t.welcome2, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.go('/register');
              },
              child: Text(t.create),
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 119, 185, 230),
                minimumSize: Size(150, 40),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

                textStyle: TextStyle(
                  color: const Color.fromARGB(255, 243, 241, 241),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                context.go('/login');
              },
              child: Text(t.login),
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 119, 185, 230),
                minimumSize: Size(150, 40),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

                textStyle: TextStyle(
                  color: const Color.fromARGB(255, 243, 241, 241),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 119, 185, 230),
                minimumSize: Size(150, 40),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

                textStyle: TextStyle(
                  color: const Color.fromARGB(255, 243, 241, 241),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                ref.read(languajeProvider.notifier).toggleLanguage();
              },
              child: const Text(" Cambiar idioma"),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {
                ref.read(themeProvider.notifier).toggleTheme();
              },
              child: const Text("Cambiar tema"),
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 119, 185, 230),
                minimumSize: Size(150, 40),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

                textStyle: TextStyle(
                  color: const Color.fromARGB(255, 243, 241, 241),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ), 
          ],
        ),
      ),
    );
  }
}
