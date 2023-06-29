import 'package:bloc/bloc.dart';
import 'package:blocecom/models/product.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initilize()) {
    on<AddToCart>((event, emit) {
      emit(state.copyWith(
        cartItems: [...state.cartItems,event.product!]
      ));
    });
    on<RemoveFromCart>((event, emit) {
      emit(state.copyWith(
        cartItems: state.cartItems.where((product) => event.productId != product.id).toList()
      ));
    });
  }

  bool isExistInCart(int productId){
    return state.cartItems.any((cartProduct) => cartProduct.id == productId);
  }
}
