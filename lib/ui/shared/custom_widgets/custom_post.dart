import 'package:big_winner_yay/ui/shared/colors.dart';
import 'package:big_winner_yay/ui/shared/custom_widgets/custom_text.dart';
import 'package:big_winner_yay/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPost extends StatelessWidget {
  const CustomPost({
    super.key,
    required this.title,
    required this.body,
    this.deleteVisiable = true,
    this.onTap,
  });
  final String title;
  final String body;
  final bool deleteVisiable;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // width: size.width / 4,
      // height: size.width / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(),
        color: AppColors.mainWhiteColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width / 30,
          vertical: size.width / 20,
        ),
        child: Column(
          children: [
            Visibility(
              visible: deleteVisiable,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      if (onTap != null) onTap!();
                    },
                    child: SvgPicture.asset(
                      'images/delete-svgrepo-com.svg',
                      color: AppColors.mainRedColor,
                      width: size.width / 10,
                    ),
                  ),
                ],
              ),
            ),
            (size.width / 30).ph,
            CustomText(
              text: title,
              textColor: AppColors.mainBlueColor,
              fontWeight: FontWeight.bold,
            ),
            (size.width / 20).ph,
            CustomText(
              text: body,
              textColor: AppColors.mainBlackColor,
            ),
          ],
        ),
      ),
    );
  }
}
