import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.textColor,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
  });

  final String text;
  final Color? textColor;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: 3,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize ?? size.width * 0.04,
        fontWeight: fontWeight,
      ),
    );
  }
}




// Big Text size fontSize: size.width * 0.1,
// Small text size fontSize: size.width * 0.04,