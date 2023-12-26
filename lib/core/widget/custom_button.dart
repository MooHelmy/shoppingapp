import 'package:flutter/material.dart';

class Custombuttonauth extends StatelessWidget {
  const Custombuttonauth(
      {super.key,
      required this.text,
      this.onTap,
      this.color,
      this.isloading = false});
  final Function()? onTap;
  final String text;
  final Color? color;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20,
        width: 30,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: isloading
              ? const CircularProgressIndicator(
                  color: Colors.black,
                )
              : Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
