import 'package:dio/dio.dart';
import 'package:shop/models/product_model.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get(
        'https://api.escuelajs.co/api/v1/products',
      );

      return (response.data as List)
          .map((item) => Product.fromJson(item))
          .toList();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  Future<Product?> getProductById(int id) async {
    try {
      final response = await _dio.get(
        'https://api.escuelajs.co/api/v1/products/$id',
      );

      return Product.fromJson(response.data);
    } catch (e) {
      print('Error fetching product: $e');
      return null;
    }
  }

  Future<List<Product>> getProductsByCategory(int categoryId) async {
    try {
      final response = await _dio.get(
        'https://api.escuelajs.co/api/v1/categories/$categoryId/products',
      );

      return (response.data as List)
          .map((item) => Product.fromJson(item))
          .toList();
    } catch (e) {
      print('Error fetching products by category: $e');
      return [];
    }
  }
}