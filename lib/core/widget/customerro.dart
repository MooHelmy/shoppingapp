import 'package:flutter/material.dart';

class Customerror extends StatelessWidget {
  const Customerror({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: const TextStyle(fontSize: 16),
    );
  }
}
