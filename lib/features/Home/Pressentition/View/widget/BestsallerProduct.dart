import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop/features/Home/Pressentition/Manager/all%20product_cubit/getallproduct_cubit.dart';

class BestsallerProduct extends StatelessWidget {
  const BestsallerProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetallproductCubit, GetallproductState>(
        builder: (context, state) {
      if (state is GetallproductSuccsseful) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: CarouselSlider(
              items: [
                Image.network(state.product[1].image),
                Image.network(state.product[17].image),
                Image.network(state.product[12].image),
                Image.network(state.product[11].image),
                Image.network(state.product[16].image),
                Image.network(state.product[5].image),
                Image.network(state.product[0].image),
                Image.network(state.product[4].image),
                Image.network(state.product[18].image),
                Image.network(state.product[10].image),
              ],
              options: CarouselOptions(
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  autoPlay: true)),
        );
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
