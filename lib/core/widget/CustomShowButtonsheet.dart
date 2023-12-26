import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop/core/Models/Prodects_Model.dart';
import 'package:product_shop/core/widget/CustomButton.dart';
import 'package:product_shop/core/widget/CustomTextefield.dart';
import 'package:product_shop/features/Purchases/Pressentition/Manager/Cart_cubit/Order_products_cubit.dart';

class CustomButtonsheet extends StatefulWidget {
  const CustomButtonsheet({super.key, required this.model});
  final ProductModel model;

  @override
  State<CustomButtonsheet> createState() => _CustomButtonsheetState();
}

class _CustomButtonsheetState extends State<CustomButtonsheet> {
  String? address;
  int? amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Customtextfield(
            hintText: 'amount of product',
            icon: Icons.location_city,
            onChanged: (data) {
              address = data;
              print(address);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Customtextfield(
            hintText: 'amount of product',
            icon: Icons.location_city,
            keyboardType: TextInputType.number,
            onChanged: (data) {
              amount = int.parse(data);
              print(amount);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          CusomButton(
            onPressed: () {
              print(address);
              BlocProvider.of<OrderProductsCubit>(context).addOrder(
                  model: widget.model, addres: address, amount: amount);
            },
            text: '   Order   ',
            color: Colors.pink,
            background: Colors.white,
          )
        ],
      ),
    );
  }
}
