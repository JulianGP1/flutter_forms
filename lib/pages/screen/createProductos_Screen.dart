import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/l10n/app_localizations.dart';
class Createproductos_Screen extends StatefulWidget {
  const Createproductos_Screen({super.key});

  @override
  State<Createproductos_Screen> createState() => _Createproductos_ScreenState();
}

class _Createproductos_ScreenState extends State<Createproductos_Screen> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();

  bool loading = false;

  Future<void> crearProducto() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    try {
      final dio = Dio();

      final response = await dio.post(
        'https://api.escuelajs.co/api/v1/products',
        data: {
          "title": titleController.text,
          "price": double.parse(priceController.text),
          "description": descriptionController.text,
          "images": [imageController.text],
           "categoryId": 129,
     
        },
      );

 
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Producto creado')));

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
    context.go('/productos');
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
    
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration:   InputDecoration(labelText: t.name),
                validator: (v) =>
                    v == null || v.isEmpty ? t.required_field: null,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: priceController,
                decoration:   InputDecoration(labelText: t.price),
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? t.required_field : null,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: descriptionController,
                decoration:   InputDecoration(labelText: t.description),
                maxLines: 3,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: imageController,
                decoration:   InputDecoration(labelText: t.image_url),
                validator: (v) =>
                    v == null || v.isEmpty ? t.required_field : null,
              ),

              const SizedBox(height: 20),

              if (imageController.text.isNotEmpty)
                Image.network(
                  imageController.text,
                  height: 120,
                  errorBuilder: (c, e, s) =>   Text(t.image_valid),
                ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loading ? null : crearProducto,
                  child: loading
                      ?   CircularProgressIndicator()
                      :   Text(t.create),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
