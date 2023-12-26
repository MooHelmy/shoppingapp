import 'package:flutter/material.dart';
import 'package:product_shop/features/Home/Pressentition/View/widget/GradViewBody.dart';

class GradView extends StatefulWidget {
  const GradView({super.key});

  @override
  State<GradView> createState() => _GradViewState();
}

class _GradViewState extends State<GradView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('New Trend ', style: TextStyle(color: Colors.white)),
      ),
      body: const GradViewBody(),
    );
  }
}
