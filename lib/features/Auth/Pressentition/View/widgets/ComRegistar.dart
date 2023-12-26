import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:product_shop/core/widget/CustomTextefield.dart';
import 'package:product_shop/core/widget/custom_button.dart';
import 'package:product_shop/features/Auth/Pressentition/View/widgets/ComLogin.dart';
import 'package:product_shop/features/Auth/Pressentition/manager/cubit/auth_user_cubit.dart';
import 'package:product_shop/features/Home/Pressentition/View/HomeView.dart';

class ComFieldRegistar extends StatefulWidget {
  const ComFieldRegistar({super.key});

  @override
  State<ComFieldRegistar> createState() => _ComFieldRegistarState();
}

GlobalKey<FormState> formstatere = GlobalKey();
String? email, password, username;

class _ComFieldRegistarState extends State<ComFieldRegistar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthUserCubit, AuthUserState>(
      listener: (context, state) {
        if (state is Signinfailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is SigninLoading) {
          Get.to(
            () => const HomeView(),
          );
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Success')));
        }
      },
      builder: (context, state) {
        return Form(
          key: formstatere,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Customtextfield(
                  hintText: ' User name ',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (data) {
                    setState(() {
                      username = data;
                    });
                  },
                  icon: Icons.person_outline_outlined,
                ),
                const SizedBox(
                  height: 20,
                ),
                Customtextfield(
                  hintText: ' Email ',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (data) {
                    setState(() {
                      email = data;
                    });
                  },
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                Customtextfield(
                  hintText: ' Password ',
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (data) {
                    setState(() {
                      password = data;
                    });
                  },
                  icon: Icons.lock,
                ),
                const SizedBox(
                  height: 30,
                ),
                Custombuttonauth(
                  isloading: state is LoginLoading ? true : false,
                  text: 'login',
                  color: Colors.blue,
                  onTap: () {
                    if (formstate.currentState!.validate()) {
                      BlocProvider.of<AuthUserCubit>(context)
                          .register(email: email!, password: password!);
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
