import 'package:flutter/material.dart';
import 'package:product_shop/constants.dart';
import 'package:product_shop/features/Purchases/Pressentition/View/Widgets/GradViewOrder.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kButtoncolors,
            centerTitle: true,
            title: const Text('Your Orders ',
                style: TextStyle(color: Colors.white)),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart, color: Colors.white)),
            ],
          ),
          body: const GradViewOrder()),
    );
  }
}
