import 'package:flutter/material.dart';
import 'package:product_shop/constants.dart';

class CustomContainerLogin extends StatelessWidget {
  const CustomContainerLogin(
      {super.key, required this.height, required this.text});
  final double height;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
          color: kButtoncolors,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
          Image.asset('assets/logo.png'),
        ],
      ),
    );
  }
}
