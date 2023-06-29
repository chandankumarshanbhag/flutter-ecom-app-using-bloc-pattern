import 'package:blocecom/bloc/bloc/cart_bloc.dart';
import 'package:blocecom/bloc/cubit/products_cubit.dart';
import 'package:blocecom/screens/cart.dart';
import 'package:blocecom/widgets/product_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ProductsCubit>().fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bloc ECOM"),
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Colors.black,
      ),
      body: Container(
        child: !context.watch<ProductsCubit>().state.loading
            ? const ProductList()
            : Center(child: const CupertinoActivityIndicator()),
      ),
    );
  }
}
