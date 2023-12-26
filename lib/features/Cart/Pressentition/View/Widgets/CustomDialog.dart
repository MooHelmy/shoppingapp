import 'package:flutter/material.dart';
import 'package:product_shop/constants.dart';
import 'package:product_shop/core/widget/CustomTextDialog.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/features/Cart/Pressentition/View/Widgets/DialogButtons.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, required this.model});
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
            height: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  CustomTextDialog(data: ' Title : ${model.title} '),
                  CustomTextDialog(data: ' price : ${model.price} '),
                  CustomTextDialog(
                      data:
                          ' Description  : ${model.descriptions.substring(0, 126)} '),
                  const SizedBox(
                    height: 20,
                  ),
                  DialogButton(model: model),
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
