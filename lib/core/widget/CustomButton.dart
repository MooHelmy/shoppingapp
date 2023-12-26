import 'package:flutter/material.dart';

class CusomButton extends StatelessWidget {
  const CusomButton({
    super.key,
    this.color,
    required this.text,
    this.borderRadius,
    this.background,
    this.onPressed,
  });
  final Color? color, background;
  final String text;

  final BorderRadiusGeometry? borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: background,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20)
            .copyWith(color: color, fontWeight: FontWeight.w900),
      ),
    );
  }
}
