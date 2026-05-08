import 'package:go_router/go_router.dart';
import 'package:shop/pages/home.dart';
import 'package:shop/pages/screen/login.dart';
import 'package:shop/pages/screen/register.dart';
import 'package:shop/shared/layout.dart';
import 'package:shop/pages/screen/user_screen.dart';
import 'package:shop/pages/screen/productos_screen.dart';
final routes = [
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => const RegisterPage(),
  ), GoRoute(
    path: '/user',
    builder: (context, state) => const UserScreen(),
  ),
  GoRoute(
    path: '/productos',
    builder: (context, state) => const ProductosScreen(),
  ),

  
  ShellRoute(
    builder: (context, state, child) {
      return Layout(
        title: 'TShop',
        child: child,
      );
    },
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const Home(),
      ),
    ],
  ),
];