part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<Product> cartItems;
  CartState({this.cartItems = const <Product>[]});

  factory CartState.initilize(){
    return CartState();
  }

  CartState copyWith({List<Product> cartItems = const <Product>[]}){
    return CartState(cartItems: cartItems);
  }
  
  @override
  List<Object> get props => [cartItems];
}

