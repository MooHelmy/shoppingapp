import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_shop/constants.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/features/Home/Pressentition/View/Homedetails.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: kButtoncolors1,
                  // animationDuration:
                  //     const Duration(milliseconds: 400)
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  ' Ok ',
                  style: TextStyle(color: Colors.pink),
                )),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: kButtoncolors1,
                  // animationDuration:
                  //     const Duration(milliseconds: 400)
                ),
                onPressed: () {
                  Get.to(const Homedetalis(),
                      arguments: model,
                      transition: Transition.downToUp,
                      duration: const Duration(milliseconds: 550));
                },
                child: const Text(
                  ' Details ',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        )
      ],
    );
  }
}
