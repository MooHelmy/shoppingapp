import 'package:flutter/material.dart';
import 'package:product_shop/constants.dart';
import 'package:product_shop/features/Cart/Pressentition/View/Widgets/GradView.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kButtoncolors,
            centerTitle: true,
            title:
                const Text('Your Cart ', style: TextStyle(color: Colors.white)),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart, color: Colors.white)),
            ],
          ),
          body: const GradViewCart()),
    );
  }
}
