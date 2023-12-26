import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:product_shop/core/widget/CustomTextefield.dart';
import 'package:product_shop/core/widget/custom_button.dart';
import 'package:product_shop/features/Auth/Pressentition/manager/cubit/auth_user_cubit.dart';
import 'package:product_shop/features/Home/Pressentition/View/HomeView.dart';

class ComFieldLogin extends StatefulWidget {
  const ComFieldLogin({super.key});

  @override
  State<ComFieldLogin> createState() => _ComFieldLoginState();
}

GlobalKey<FormState> formstate = GlobalKey();
String? email, password;

class _ComFieldLoginState extends State<ComFieldLogin> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthUserCubit, AuthUserState>(
      listener: (context, state) {
        if (state is Loginfailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is LoginSuccess) {
          Get.to(
            () => const HomeView(),
          );
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Success')));
        }
      },
      builder: (context, state) {
        return Form(
          key: formstate,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
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

                    print(password);
                  },
                  icon: Icons.lock,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text('$email'),
                Custombuttonauth(
                  isloading: state is LoginLoading ? true : false,
                  text: 'login',
                  color: Colors.blue,
                  onTap: () {
                    if (formstate.currentState!.validate()) {
                      formstate.currentState!.save();
                      BlocProvider.of<AuthUserCubit>(context)
                          .login(email: email!, password: password!);
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
