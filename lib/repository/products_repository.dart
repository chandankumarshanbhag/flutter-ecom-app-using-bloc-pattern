import 'package:blocecom/models/product.dart';
import 'package:blocecom/services/product.dart';

class ProductsRepository{
  ProductService productService;

  ProductsRepository({this.productService = const ProductService()});
  
  Future<List<Product>?> fetchProducts(){
    return productService.fetchProducts();
  }
}