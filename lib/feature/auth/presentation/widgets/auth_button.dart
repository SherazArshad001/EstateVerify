import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_pallet.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;
  final double height;
  final double width;

  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppPallete.btnColor,
    this.borderRadius = 10.0,
    this.height = 55.0,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppPallete.whiteColor),
        ),
      ),
    );
  }
}
