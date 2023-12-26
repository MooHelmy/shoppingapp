import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_shop/features/Auth/Pressentition/View/Registar_View.dart';

import 'package:product_shop/features/Auth/Pressentition/View/widgets/CustomContainerLogin.dart';
import 'package:product_shop/features/Auth/Pressentition/View/widgets/ComLogin.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomContainerLogin(
                  text: 'Hello!',
                  height: MediaQuery.sizeOf(context).height * .55),
              const SizedBox(
                height: 10,
              ),
              const ComFieldLogin(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("don't have account ?"),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const RegistarView());
                    },
                    child: const Text(
                      " Singin ",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
