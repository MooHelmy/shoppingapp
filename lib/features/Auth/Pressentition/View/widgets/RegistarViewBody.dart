import 'package:flutter/material.dart';
import 'package:product_shop/features/Auth/Pressentition/View/widgets/ComRegistar.dart';
import 'package:product_shop/features/Auth/Pressentition/View/widgets/CustomContainerLogin.dart';

class RegistarViewBody extends StatelessWidget {
  const RegistarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomContainerLogin(
                  text: ' Register Now ',
                  height: MediaQuery.sizeOf(context).height * .45),
              const SizedBox(
                height: 20,
              ),
              const ComFieldRegistar(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
