import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop/core/widget/customerro.dart';
import 'package:product_shop/features/Profile/Pressentition/View/Widgets/User_details.dart';
import 'package:product_shop/features/Profile/Pressentition/manager/cubit/profil_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilCubit, ProfilState>(builder: (context, state) {
      if (state is ProfilSuccssful) {
        return Column(
          children: [UserDetails(usermodel: state.user)],
        );
      }
      if (state is ProfilFailuer) {
        return Customerror(errorMessage: state.message);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
