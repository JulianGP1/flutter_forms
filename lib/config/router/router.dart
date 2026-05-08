import 'package:go_router/go_router.dart';
import 'package:shop/pages/home.dart';
import 'package:shop/pages/screen/login.dart';
import 'package:shop/pages/screen/register.dart';
import 'package:shop/shared/layout.dart';
import 'package:shop/pages/screen/user_Screen.dart';
import 'package:shop/pages/screen/productos_Screen.dart';
import 'package:shop/pages/screen/createProductos_Screen.dart';
import 'package:shop/pages/screen/produc_detail_screen.dart';
import 'package:shop/models/product_model.dart';
final routes = [
  
      GoRoute(
        path: '/home',
        builder: (context, state) => const Home(),
      ),
          GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/register',
    builder: (context, state) => const RegisterPage(),
  ),
  
  ShellRoute(
     builder: (context, state, child) {
    String title;

    switch (state.uri.path) {
      case '/home':
        title = 'Home';
        break;
      case '/productos':
        title = 'Productos';
        break;
      case '/user':
        title = 'Home';
        break;
        case '/createProducto':
        title = 'Crear Producto';
        break;
      default:
        title = 'Shop';
    }

    return Layout(
      title: title,
      child: child,
    );
    },
    routes: [
     GoRoute(
    path: '/user',
    builder: (context, state) => const UserScreen(),
  ),
  GoRoute(
    path: '/productos',
    builder: (context, state) => const Productos_Screen(),
  ),
  GoRoute(
    path: '/createProducto',
    builder: (context, state) => const Createproductos_Screen(),
  ),
  GoRoute(
  path: '/productDetail',
  builder: (context, state) {
    final product = state.extra as Product;

    return ProductDetailScreen(product: product);
  },
),

    ],
  ),
];