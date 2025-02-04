import 'package:flutter/material.dart';

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
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
