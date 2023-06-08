import 'package:big_winner_yay/ui/shared/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.fillColor,
    required this.hintTextColor,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.prefixIconColor,
    this.maxHeight,
    this.maxWidth,
    this.maxLines = 3,
  });

  final String hintText;
  final TextEditingController controller;
  final Color? fillColor;
  final Color? hintTextColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final double? maxHeight;
  final double? maxWidth;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextFormField(
      maxLines: maxLines,
      // onChanged: myValidator,
      controller: controller,
      validator: validator,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.width * 0.06,
        ),
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? size.height * 0.08,
          maxWidth: maxWidth ?? size.width * 0.9,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.placeholderGreyColor,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: hintTextColor,
        ),
        hintText: hintText,
        fillColor: fillColor,
      ),
      keyboardType: keyboardType ?? TextInputType.text,
    );
  }
}
