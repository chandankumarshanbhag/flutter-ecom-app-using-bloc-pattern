part of 'products_cubit.dart';

class ProductsState extends Equatable {
  final List<Product> products;
  final bool loading;
  ProductsState({this.products = const <Product>[], this.loading = false});

  factory ProductsState.initialize() {
    return ProductsState();
  }

  ProductsState copyWith({List<Product> products = const <Product>[],bool loading: false}) {
    return ProductsState(products: products, loading: loading);
  }

  @override
  List<Object> get props => [products];
}
