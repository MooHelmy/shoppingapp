import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_shop/constants.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/core/widget/CustomTextDialog.dart';

class CustomOrderDialog extends StatelessWidget {
  const CustomOrderDialog({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kButtoncolors,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 450,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  CustomTextDialog(data: ' Title : ${model.title} '),
                  CustomTextDialog(data: ' price : ${model.price} '),
                  CustomTextDialog(
                      data:
                          ' Description  : ${model.descriptions.substring(0, 125)} '),
                  CustomTextDialog(data: ' UserName : ${model.address} '),
                  CustomTextDialog(data: ' Amount : ${model.amount} '),
                  CustomTextDialog(data: ' Time order : ${model.time} '),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
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
                  )
                ],
              ),
            ),
          ),
          Positioned(
              right: 0,
              left: 0,
              top: -50,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                child: Hero(
                  tag: model.title,
                  child: Image.network(
                    model.image,
                    height: 100,
                    width: 100,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
