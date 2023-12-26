import 'package:flutter/material.dart';
import 'package:product_shop/features/Profile/Pressentition/View/Widgets/Custom_listTile.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomListTiled(
          title: 'Home',
          icon: Icons.home,
        ),
        SizedBox(
          height: 10,
        ),
        CustomListTiled(
          title: 'Cart',
          icon: Icons.home,
        ),
        SizedBox(
          height: 10,
        ),
        CustomListTiled(
          title: 'oredr',
          icon: Icons.home,
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
