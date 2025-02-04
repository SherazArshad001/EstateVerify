import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_pallet.dart';

class AuthRichText extends StatelessWidget {
  final String text;
  final String tappableText;
  final VoidCallback? onTap;

  const AuthRichText({
    super.key,
    required this.text,
    required this.tappableText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(
              fontSize: 16,
            ),
        children: [
          TextSpan(text: text),
          TextSpan(
            text: tappableText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppPallete.btnColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
