import 'package:blocecom/bloc/bloc/cart_bloc.dart';
import 'package:blocecom/models/product.dart';
import 'package:blocecom/screens/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> cartItems = context.watch<CartBloc>().state.cartItems;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Cart"),
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (BuildContext context, int index) {
            Product product = cartItems[index];
            return ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Hero(
                tag: product.image,
                child: CircleAvatar(
                    child: CachedNetworkImage(
                  imageUrl: product.image,
                )),
              ),
              title: Text(product.title),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  context
                      .read<CartBloc>()
                      .add(RemoveFromCart(productId: product.id));
                },
              ),
              onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(
                        product: product,
                      ),
                    ),
                  );
                },
            );
          },
        ));
  }
}
