import 'package:bloc/bloc.dart';
import 'package:blocecom/models/product.dart';
import 'package:blocecom/repository/products_repository.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository? productsRepository;
  ProductsCubit({this.productsRepository}) : super(ProductsState.initialize());

  void fetchProducts() async {
    try{
      emit(state.copyWith(loading: true));
      List<Product>? products = await productsRepository?.productService.fetchProducts();
      emit(state.copyWith(products: products!,loading: false));
    }catch(e){
      emit(state.copyWith(loading: false));
      print(e);
    }
  }
}
