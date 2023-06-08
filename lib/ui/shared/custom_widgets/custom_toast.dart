import 'package:big_winner_yay/core/enums/message_type.dart';
import 'package:big_winner_yay/ui/shared/colors.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomToast {
  static showMessage({
    required Size size,
    required String message,
    MessageType? messageType = MessageType.INFO,
    void Function()? onClose,
  }) {
    String imageName = 'toast_info';
    Color shadowColor = AppColors.mainBlueColor;

    switch (messageType) {
      case MessageType.REJECTED:
        imageName = 'toast_rejected';
        shadowColor = AppColors.mainRedColor;
        break;
      case MessageType.SUCCESS:
        imageName = 'toast_approved';
        shadowColor = AppColors.mainGreenColor;
        break;
      case MessageType.WARNING:
        imageName = 'toast_warning';
        shadowColor = AppColors.mainOrangeColor;
        break;
      case MessageType.INFO:
        imageName = 'toast_info';
        shadowColor = AppColors.mainBlueColor;
        break;
      default:
        break;
    }

    BotToast.showCustomText(
      onClose: () {
        onClose;
      },
      duration: Duration(seconds: 4),
      toastBuilder: (value) {
        return Container(
          margin: EdgeInsets.all(size.width / 10),
          width: size.width * 0.7,
          // height: size.width * 0.4,
          decoration: BoxDecoration(
            color: AppColors.mainWhiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // (size.height * 0.01).ph,
              SvgPicture.asset(
                'images/$imageName.svg',
                height: size.width * 0.25,
                width: size.width * 0.25,
              ),
              // (size.height * 0.01).ph,
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: size.width * 0.065),
              ),
              // (size.height * 0.01).ph,
            ],
          ),
        );
      },
    );
  }
}
