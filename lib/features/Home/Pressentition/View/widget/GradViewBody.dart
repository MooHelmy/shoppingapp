import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:product_shop/core/widget/CustomeCard.dart';
import 'package:product_shop/core/widget/customerro.dart';
import 'package:product_shop/features/Home/Pressentition/Manager/all%20product_cubit/getallproduct_cubit.dart';
import 'package:product_shop/features/favorite/Pressentition/manager/Favorite/favorite_cubit.dart';

import '../Homedetails.dart';

class GradViewBody extends StatelessWidget {
  const GradViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetallproductCubit, GetallproductState>(
        builder: (context, state) {
      if (state is GetallproductSuccsseful) {
        return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
            child: GridView.builder(
              itemCount: state.product.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100),
              itemBuilder: (context, index) {
                return CustomeCard(
                  onPressed: () {
                    BlocProvider.of<FavoriteCubit>(context)
                        .addItemfav(model: state.product[index]);
                  },
                  icon: Icons.favorite,
                  color: Colors.black,
                  product: state.product[index],
                  onTap: () {
                    Get.to(() => const Homedetalis(),
                        arguments: state.product[index]);
                    //  arguments: state.productlist[index]);
                  },
                );
              },
            ));
      }
      if (state is GetallproductFailuer) {
        return Customerror(errorMessage: state.messageerror);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
