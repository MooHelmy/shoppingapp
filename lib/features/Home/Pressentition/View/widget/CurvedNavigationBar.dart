import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:product_shop/constants.dart';

class CustomCurvedNavigationBar extends StatelessWidget {
  const CustomCurvedNavigationBar({super.key, this.onTap, required this.index});
  final void Function(int)? onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    List<Widget> item = [
      const Icon(Icons.shopping_cart_outlined, size: 30),
      const Icon(Icons.favorite_border_sharp, size: 30),
      const Icon(Icons.home, size: 30),
      const Icon(Icons.monetization_on, size: 30),
      const Icon(Icons.person_outline_sharp, size: 30),
    ];
    return CurvedNavigationBar(
      buttonBackgroundColor: Colors.white,
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 500),
      color: kButtoncolors,
      backgroundColor: Colors.grey.withOpacity(.2),
      index: index,
      height: 60,
      items: item,
      onTap: onTap,
    );
  }
}
