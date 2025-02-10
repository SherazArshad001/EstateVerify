import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_pallet.dart';

class AppAuthTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  const AppAuthTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
  });

  OutlineInputBorder _border({
    Color color = AppPalette.borderColor,
    double width = 1.5,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: _border(),
        focusedBorder: _border(color: AppPalette.btnColor),
        errorBorder: _border(color: AppPalette.errorColor),
        focusedErrorBorder: _border(color: AppPalette.errorColor),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      ),
    );
  }
}
