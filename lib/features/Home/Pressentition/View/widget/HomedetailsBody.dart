import 'package:flutter/material.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/features/Home/Pressentition/View/widget/BuyandcartButtons.dart';
import 'package:product_shop/features/Home/Pressentition/View/widget/ProductDetails.dart';

class HomedetalisBody extends StatelessWidget {
  const HomedetalisBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProductDetails(product: product),
                const SizedBox(
                  height: 50,
                ),
                BuyandcartButtons(model: product),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
