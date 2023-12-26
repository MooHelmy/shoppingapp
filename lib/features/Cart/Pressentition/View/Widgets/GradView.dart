import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop/core/widget/CustomeCard.dart';
import 'package:product_shop/core/widget/customerro.dart';
import 'package:product_shop/features/Cart/Pressentition/Manager/Cart_cubit/cart_products_cubit.dart';
import 'package:product_shop/features/Cart/Pressentition/View/Widgets/CustomDialog.dart';

class GradViewCart extends StatelessWidget {
  const GradViewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartProductsCubit, CartProductsState>(
        builder: (context, state) {
      if (state is CartProductsSuccssful) {
        return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
            child: GridView.builder(
              itemCount: state.cartProduct.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100),
              itemBuilder: (context, index) {
                return CustomeCard(
                  onPressed: () {
                    BlocProvider.of<CartProductsCubit>(context)
                        .deletefromCart(state.cartProduct[index].iddoc!);
                    BlocProvider.of<CartProductsCubit>(context).loadDataCart();
                  },
                  icon: Icons.delete,
                  color: Colors.grey,
                  product: state.cartProduct[index],
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                          model: state.cartProduct[index],
                        );
                      },
                    );
                  },
                );
              },
            ));
      }
      if (state is CartProductsFailuer) {
        return Customerror(errorMessage: state.messageerror);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
