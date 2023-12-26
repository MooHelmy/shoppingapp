import 'package:flutter/material.dart';

class CustomTextDialog extends StatelessWidget {
  const CustomTextDialog({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          data,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
