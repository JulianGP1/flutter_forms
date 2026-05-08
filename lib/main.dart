import 'package:flutter/material.dart';
import 'package:shop/config/router/routerConfig.dart';
 import 'package:flutter_riverpod/flutter_riverpod.dart';
 import 'package:shop/providers/theme_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://bvfvnxxsaprqiybeitsf.supabase.co',
    anonKey: 'sb_publishable_TNlsfyoDyF6DvHMbeA3Y8w_nQbPu2Na',
        authOptions: const FlutterAuthClientOptions(
      autoRefreshToken: true,
    ),
  );
  runApp(
    const ProviderScope(  
      child: MyApp(),
    ),
  );
}
class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override 
  Widget build(BuildContext context, WidgetRef ref) {
     final theme = ref.watch(themeProvider);
    return MaterialApp.router(
         theme: ThemeData(
        useMaterial3: true,
        brightness: theme ? Brightness.dark : Brightness.light),
     routerConfig: router,
      
    );
  }
  }