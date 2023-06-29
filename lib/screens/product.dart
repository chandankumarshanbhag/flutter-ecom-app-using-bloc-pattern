import 'package:blocecom/bloc/bloc/cart_bloc.dart';
import 'package:blocecom/models/product.dart';
import 'package:blocecom/screens/cart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  final Product? product;
  const ProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Colors.black,
        actions: [
          Badge(
            alignment: AlignmentDirectional.bottomEnd,
            label: Text(context.watch<CartBloc>().state.cartItems.length.toString()),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.favorite_outline_outlined)),
          )
        ],
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(16),
          height: 400,
          child: Hero(
              tag: product?.image ?? "",
              child: CachedNetworkImage(imageUrl: product?.image ?? "")),
        ),
        Divider(),
        ListTile(
          title: Text(product?.title ?? ""),
          subtitle: Text(product?.description ?? ""),
          trailing: IconButton(
            icon: (product?.id != null
                    ? context.watch<CartBloc>().isExistInCart(product!.id!)
                    : false)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            onPressed: () {
              if (product?.id != null
                  ? context.read<CartBloc>().isExistInCart(product!.id!)
                  : false) {
                context
                    .read<CartBloc>()
                    .add(RemoveFromCart(productId: product!.id));
              } else {
                context.read<CartBloc>().add(AddToCart(product: product));
              }
            },
          ),
        )
      ]),
    );
  }
}
