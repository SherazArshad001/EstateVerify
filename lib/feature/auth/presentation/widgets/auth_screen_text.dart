import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_pallet.dart';

class AuthLogInText extends StatelessWidget {
  final String text;

  const AuthLogInText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppPallete.backgroundColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
