import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop/features/favorite/Pressentition/Views/widgets/FavoriteView_Body.dart';
import 'package:product_shop/features/favorite/Pressentition/manager/Favorite/favorite_cubit.dart';

import '../../data/reps/Favorite_ReopImp.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(FavoriteRepoIm())..getFavorite(),
      child: const SafeArea(
        child: Scaffold(
          body: FavoriteViewBody(),
        ),
      ),
    );
  }
}
