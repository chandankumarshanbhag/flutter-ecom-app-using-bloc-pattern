part of 'cart_bloc.dart';

class CartEvent {
  const CartEvent();
}

class AddToCart extends CartEvent {
  final Product? product;
  const AddToCart({this.product});
}

class RemoveFromCart extends CartEvent {
  final int? productId;
  const RemoveFromCart({this.productId});
}
