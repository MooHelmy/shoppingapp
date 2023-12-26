import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop/core/widget/CustomeCard.dart';
import 'package:product_shop/core/widget/customerro.dart';
import 'package:product_shop/features/Purchases/Pressentition/Manager/Cart_cubit/Order_products_cubit.dart';
import 'package:product_shop/features/Purchases/Pressentition/View/Widgets/CustomOrderDialog.dart';

class GradViewOrder extends StatelessWidget {
  const GradViewOrder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderProductsCubit, OrderProductsState>(
        builder: (context, state) {
      if (state is OrderProductsSuccssful) {
        return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
            child: GridView.builder(
              itemCount: state.OrderProduct.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100),
              itemBuilder: (context, index) {
                return CustomeCard(
                  onPressed: () {
                    BlocProvider.of<OrderProductsCubit>(context)
                        .deleteOrder(state.OrderProduct[index].iddoc!);
                    BlocProvider.of<OrderProductsCubit>(context)
                        .loadDataOrder();
                  },
                  icon: Icons.check_circle,
                  color: Colors.grey,
                  product: state.OrderProduct[index],
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomOrderDialog(
                          model: state.OrderProduct[index],
                        );
                      },
                    );
                  },
                );
              },
            ));
      }
      if (state is OrderProductsFailuer) {
        return Customerror(errorMessage: state.messageerror);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
