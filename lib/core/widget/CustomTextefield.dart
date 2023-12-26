import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield(
      {super.key,
      required this.hintText,
      this.icon,
      this.onChanged,
      this.keyboardType});
  final String hintText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (validator) {
        if (validator!.isEmpty) {
          return 'enter the filed';
        }
        return null;
      },
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          suffixIcon: Opacity(
              opacity: .8,
              child: Icon(
                icon,
                size: 20,
              )),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.blueAccent, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.blueAccent, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Colors.pink, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(16),
          )),
    );
  }
}
