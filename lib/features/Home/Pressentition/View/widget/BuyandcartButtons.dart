import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop/constants.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/core/widget/CustomButton.dart';
import 'package:product_shop/core/widget/CustomShowButtonsheet.dart';
import 'package:product_shop/features/Cart/Pressentition/Manager/Cart_cubit/cart_products_cubit.dart';

class BuyandcartButtons extends StatelessWidget {
  const BuyandcartButtons({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocListener<CartProductsCubit, CartProductsState>(
            listener: (context, state) {
              if (state is AddCartProductsSuccssful) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('The Product is added ')));
              }
            },
            child: CusomButton(
              onPressed: () {
                BlocProvider.of<CartProductsCubit>(context)
                    .addtoCart(model: model);
              },
              text: 'ADD Cart',
              background: kButtoncolors,
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
            ),
          ),
        ),
        Expanded(
          child: CusomButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                backgroundColor: kButtoncolors,
                context: context,
                builder: (context) {
                  return CustomButtonsheet(
                    model: model,
                  );
                },
              );
            },
            text: ' Buy now',
            color: Colors.black,
            background: Colors.pink,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ),
        ),
      ],
    );
  }
}
