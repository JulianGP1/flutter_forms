import 'package:flutter/material.dart';
import 'package:shop/widget/drawer.dart';
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
    );
  }
}