import 'package:big_winner_yay/core/data/repositories/post_repository.dart';
import 'package:big_winner_yay/ui/shared/colors.dart';
import 'package:big_winner_yay/ui/shared/custom_widgets/custom_button.dart';
import 'package:big_winner_yay/ui/shared/custom_widgets/custom_text.dart';
import 'package:big_winner_yay/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:big_winner_yay/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter/material.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [
              AppColors.seconderyWhiteColor,
              AppColors.seconderyWhiteColor,
              AppColors.mainBlueColor,
              AppColors.mainBlueColor,
              AppColors.mainBlueColor,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.width / 10,
            horizontal: size.width / 20,
          ),
          child: ListView(
            children: [
              Image.asset('images/logo.png'),
              (size.width / 30).ph,
              CustomText(
                text: 'Add new post',
                textColor: AppColors.mainBlackColor,
                fontSize: size.width / 10,
                fontWeight: FontWeight.bold,
              ),
              (size.width / 30).ph,
              CustomTextFormField(
                hintText: 'Title',
                controller: titleController,
                fillColor: AppColors.mainWhiteColor,
                hintTextColor: AppColors.transparentColor,
                maxHeight: size.height / 10,
              ),
              (size.width / 30).ph,
              CustomTextFormField(
                hintText: 'Body',
                controller: bodyController,
                fillColor: AppColors.mainWhiteColor,
                hintTextColor: AppColors.transparentColor,
                maxHeight: size.height / 2,
                maxLines: 80,
              ),
              (size.width / 30).ph,
              CustomButton(
                text: 'Save',
                onPressed: () async {
                  await PostRepository().createPost(
                      title: titleController.text,
                      body: bodyController.text,
                      userId: 1);
                  Navigator.pop(context);
                },
                backgroundColor: AppColors.buttonGreyColor,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
