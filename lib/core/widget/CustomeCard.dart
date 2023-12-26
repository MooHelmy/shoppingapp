import 'package:flutter/material.dart';

import '../Models/Prodects_Model.dart';

class CustomeCard extends StatelessWidget {
  const CustomeCard(
      {super.key,
      required this.product,
      this.onTap,
      this.onPressed,
      this.icon,
      this.color});
  final ProductModel product;
  final Function()? onTap;
  final void Function()? onPressed;
  final IconData? icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(.2),
                  spreadRadius: 0,
                  offset: const Offset(1, 1))
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 9),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${product.price.toString()}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          IconButton(
                              onPressed: onPressed,
                              icon: Icon(
                                icon,
                                color: color,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 0,
              top: -50,
              child: Hero(
                tag: product.title,
                child: Image.network(
                  product.image,
                  height: 100,
                  width: 100,
                ),
              )),
        ],
      ),
    );
  }
}
