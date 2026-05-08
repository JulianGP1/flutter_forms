import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
           "categoryId": 1,
     
        },
      );

      print(response.data);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Producto creado')));

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear producto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Campo requerido' : null,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Campo requerido' : null,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                maxLines: 3,
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: imageController,
                decoration: const InputDecoration(labelText: 'URL de imagen'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Campo requerido' : null,
              ),

              const SizedBox(height: 20),

              if (imageController.text.isNotEmpty)
                Image.network(
                  imageController.text,
                  height: 120,
                  errorBuilder: (c, e, s) => const Text('Imagen inválida'),
                ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loading ? null : crearProducto,
                  child: loading
                      ? const CircularProgressIndicator()
                      : const Text('Crear producto'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
