import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:product_shop/features/Auth/Pressentition/View/Login_view.dart';
import 'package:product_shop/features/Auth/Pressentition/manager/cubit/auth_user_cubit.dart';
import 'package:product_shop/features/Cart/Data/repo/CartrepoIm.dart';
import 'package:product_shop/features/Cart/Pressentition/Manager/Cart_cubit/cart_products_cubit.dart';
import 'package:product_shop/features/Home/Pressentition/Manager/all%20product_cubit/getallproduct_cubit.dart';
import 'package:product_shop/features/Home/data/repo/HomeRepoIm.dart';
import 'package:product_shop/features/Purchases/Data/repo/OrderrepoIm.dart';
import 'package:product_shop/features/Purchases/Pressentition/Manager/Cart_cubit/Order_products_cubit.dart';
import 'package:product_shop/features/favorite/Pressentition/manager/Favorite/favorite_cubit.dart';
import 'package:product_shop/features/favorite/data/reps/Favorite_ReopImp.dart';
import 'package:product_shop/firebase_options.dart';
import 'package:product_shop/observe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  Bloc.observer = Simpleobserve();
  runApp(const Productshop());
}

class Productshop extends StatelessWidget {
  const Productshop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetallproductCubit(HomeRepoim())..allproducts(),
        ),
        BlocProvider(
          create: (context) => CartProductsCubit(CartRepoIm()),
        ),
        BlocProvider(
          create: (context) => OrderProductsCubit(OrderRepoIm()),
        ),
        BlocProvider(
          create: (context) => AuthUserCubit(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(FavoriteRepoIm()),
        ),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      ),
    );
  }
}
