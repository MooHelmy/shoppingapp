import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop/features/Purchases/Data/repo/OrderrepoIm.dart';
import 'package:product_shop/features/Purchases/Pressentition/Manager/Cart_cubit/Order_products_cubit.dart';
import 'package:product_shop/features/Purchases/Pressentition/View/Widgets/CartViewBody.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderProductsCubit(OrderRepoIm())..loadDataOrder(),
      child: const OrderViewBody(),
    );
  }
}
