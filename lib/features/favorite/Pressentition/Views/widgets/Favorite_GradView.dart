import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop/core/widget/CustomeCard.dart';
import 'package:product_shop/core/widget/customerro.dart';
import 'package:product_shop/features/favorite/Pressentition/manager/Favorite/favorite_cubit.dart';

class FavoriteGradView extends StatelessWidget {
  const FavoriteGradView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(builder: (context, state) {
      if (state is FavoritProductsSuccssful) {
        return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
            child: GridView.builder(
              itemCount: state.favoriteProduct.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100),
              itemBuilder: (context, index) {
                return CustomeCard(
                  onPressed: () {},
                  icon: Icons.favorite,
                  color: Colors.red,
                  product: state.favoriteProduct[index],
                  onTap: () {
                    // Get.to(() => const Homedetalis(),
                    //     arguments: state.product[index]);
                    //  arguments: state.productlist[index]);
                  },
                );
              },
            ));
      }
      if (state is FavoritProductsFailuer) {
        return Customerror(errorMessage: state.messageerror);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
