import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_shop/features/Profile/Data/repo/Profile_repoImp.dart';
import 'package:product_shop/features/Profile/Pressentition/View/Widgets/Profile_View_Body.dart';
import 'package:product_shop/features/Profile/Pressentition/manager/cubit/profil_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
        create: (context) => ProfilCubit(ProfileRepoim())..loadUsertData(),
        child: const ProfileViewBody(),
      ),
    ));
  }
}
