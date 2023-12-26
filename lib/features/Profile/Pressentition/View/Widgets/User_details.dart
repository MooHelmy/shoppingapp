import 'package:flutter/material.dart';
import 'package:product_shop/features/Profile/Data/model/Users_model.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.usermodel,
  });
  final UserModel usermodel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: usermodel.url == null
              ? const NetworkImage('assetName')
              : NetworkImage(usermodel.url!),
        ),
        Column(
          children: [
            Text(
              usermodel.username,
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              usermodel.email,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        )
      ],
    );
  }
}
