import 'package:blocecom/bloc/bloc/cart_bloc.dart';
import 'package:blocecom/bloc/cubit/products_cubit.dart';
import 'package:blocecom/models/product.dart';
import 'package:blocecom/screens/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: context.watch<ProductsCubit>().state.products.length,
            itemBuilder: (BuildContext context, int index) {
              Product product =
                  context.watch<ProductsCubit>().state.products[index];
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
                subtitle: Text(product.description,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(
                        product: product,
                      ),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: context.watch<CartBloc>().isExistInCart(product.id)
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    if (context.read<CartBloc>().isExistInCart(product.id)) {
                      context
                          .read<CartBloc>()
                          .add(RemoveFromCart(productId: product.id));
                    } else {
                      context.read<CartBloc>().add(AddToCart(product: product));
                    }
                  },
                ),
              );
            });
      },
    );
  }
}
