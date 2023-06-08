import 'package:big_winner_yay/ui/shared/colors.dart';
import 'package:big_winner_yay/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    required this.onPressed,
    this.ImageName,
  });

  final String text;
  final String? ImageName;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) onPressed!();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (ImageName != null) ...[
            SvgPicture.asset('images/$ImageName.svg'),
            (size.width * 0.03).pw,
          ],
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        side: borderColor != null
            ? BorderSide(
                width: 1.0,
                color: borderColor!,
              )
            : null,
        backgroundColor: backgroundColor ?? AppColors.mainOrangeColor,
        shape: StadiumBorder(),
        fixedSize: Size(
          size.width * 0.9,
          size.height * 0.08,
        ),
      ),
    );
  }
}
