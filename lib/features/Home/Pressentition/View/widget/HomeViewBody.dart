import 'package:flutter/material.dart';
import 'package:product_shop/features/Cart/Pressentition/View/Cart_view.dart';
import 'package:product_shop/features/Home/Pressentition/View/widget/CurvedNavigationBar.dart';
import 'package:product_shop/features/Home/Pressentition/View/widget/GradView.dart';
import 'package:product_shop/features/Profile/Pressentition/View/profile_view.dart';
import 'package:product_shop/features/Purchases/Pressentition/View/Order_view.dart';
import 'package:product_shop/features/favorite/Pressentition/Views/Favorite_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int index = 2;
  List<Widget> screen = [
    const CartView(),
    const FavoriteView(),
    const GradView(),
    const OrderView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomCurvedNavigationBar(
          index: index,
          onTap: (indexn) {
            setState(() {
              index = indexn;
            });
          }),
      body: screen[index],
    );
  }
}
