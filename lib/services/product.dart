import 'dart:convert';

import 'package:blocecom/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService{
  const ProductService();

  Future<List<Product>?> fetchProducts() async {
    http.Response response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if(response.statusCode == 200){
      List<dynamic> data = jsonDecode(response.body);
      return data.map((product) {
        return Product.fromJson(product);
      }).toList();
    }else{
      throw Exception("Unable to fetch products");
    }
  }
}