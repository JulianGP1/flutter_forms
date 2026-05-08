import 'package:go_router/go_router.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/pages/home.dart';
import 'package:shop/pages/screen/login.dart';
import 'package:shop/pages/screen/register.dart';
import 'package:shop/shared/layout.dart';
import 'package:shop/pages/screen/user_Screen.dart';
import 'package:shop/pages/screen/productos_Screen.dart';
import 'package:shop/pages/screen/createProductos_Screen.dart';
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
        title = 'Perfil';
        break;
        case '/createProducto':
        title = 'Crear Producto';
        break;
      default:
        title = 'TShop';
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
  )

    ],
  ),
];