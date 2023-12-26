import 'package:flutter/material.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/features/Home/Pressentition/View/widget/BestsallerProduct.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Hero(
                tag: product.title,
                child: Image(
                  image: NetworkImage(product.image),
                  height: MediaQuery.sizeOf(context).height * .2,
                ))),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
            width: double.infinity,
            child: Text(
              'Descriptions',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.pink, fontSize: 14),
            )),
        const SizedBox(
          height: 10,
        ),
        Text(
          product.descriptions,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const BestsallerProduct(),
      ],
    );
  }
}
