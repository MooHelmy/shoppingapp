import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop/features/Cart/Data/repo/CartrepoIm.dart';
import 'package:product_shop/features/Cart/Pressentition/Manager/Cart_cubit/cart_products_cubit.dart';
import 'package:product_shop/features/Cart/Pressentition/View/Widgets/CartViewBody.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartProductsCubit(CartRepoIm())..loadDataCart(),
      child: const CartViewBody(),
    );
  }
}
