import 'package:flutter/material.dart';

class CustomListTiled extends StatelessWidget {
  const CustomListTiled(
      {super.key, this.onTap, required this.title, this.icon});
  final void Function()? onTap;
  final String title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: const Icon(Icons.navigate_next),
      onTap: onTap,
    );
  }
}
