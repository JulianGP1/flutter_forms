import 'package:dio/dio.dart';
class ProductService {
  final Dio _dio=Dio();
  Future<List<dynamic>> getProducts() async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products');
      return response.data;
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }
  Future<dynamic> getProductById(int id) async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products/$id');
      return response.data;
    } catch (e) {
      print('Error fetching product: $e');
      return null;
    }
  }
  Future<List<dynamic>> getProductsByCategory(String category) async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products/category/$category');
      return response.data;
    } catch (e) {
      print('Error fetching products by category: $e');
      return [];
    }
  }

}