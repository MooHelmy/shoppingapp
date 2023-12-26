import 'dart:io';

import 'package:flutter/material.dart';
import 'package:product_shop/constants.dart';

class Customiamge extends StatelessWidget {
  const Customiamge({super.key, this.image, this.onTap});
  final File? image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: kButtoncolors,
        backgroundImage: image == null ? null : FileImage(image!),
        radius: 80,
      ),
    );
  }
}
