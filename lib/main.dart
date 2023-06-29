import 'package:blocecom/bloc/bloc/cart_bloc.dart';
import 'package:blocecom/bloc/cubit/products_cubit.dart';
import 'package:blocecom/repository/products_repository.dart';
import 'package:blocecom/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductsRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductsCubit(
                productsRepository: context.read<ProductsRepository>()),
          ),
          BlocProvider(
            create: (context) => CartBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
