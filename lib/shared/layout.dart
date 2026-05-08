import 'package:flutter/material.dart';
import 'package:shop/widget/drawer.dart';
import 'package:go_router/go_router.dart ';
class Layout extends StatelessWidget {
  final Widget child;
  final String title;

  const Layout({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(title),
      ),
          drawer:AppDrawer(),
      body: child,
       bottomNavigationBar: BottomAppBar(
  child: SizedBox(
    height: 120,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
      
            minimumSize: const Size(80, 80),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => context.push('/productos'),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.list),
              Text('Productos', style: TextStyle(fontSize: 10)),
            ],
          ),
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(80, 80),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => context.push('/createProducto'),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_box),
              Text('Crear', style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
 
      ],
    ),
  ),
),
    
    );
  }
}