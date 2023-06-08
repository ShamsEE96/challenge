import 'package:big_winner_yay/core/data/models/apis/post_model.dart';
import 'package:big_winner_yay/core/data/repositories/post_repository.dart';
import 'package:big_winner_yay/core/enums/message_type.dart';
import 'package:big_winner_yay/ui/shared/colors.dart';
import 'package:big_winner_yay/ui/shared/custom_widgets/custom_post.dart';
import 'package:big_winner_yay/ui/shared/custom_widgets/custom_toast.dart';
import 'package:big_winner_yay/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:big_winner_yay/ui/views/create_post_view/create_post_view.dart';
import 'package:big_winner_yay/ui/views/post_photo_view/post_photo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<PostModel> postList = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.mainBlueColor,
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
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return CreatePostView();
                          },
                        ));
                      },
                      child: SvgPicture.asset(
                        'images/create-note-svgrepo-com.svg',
                        width: size.width / 7,
                      ),
                    ),
                  )
                ],
              ),
              Image.asset('images/logo.png'),
              (size.width / 30).ph,
              FutureBuilder(
                future: PostRepository().getAllPosts(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    snapshot.data!.fold(
                      (l) {
                        CustomToast.showMessage(
                          size: size,
                          message: l,
                          messageType: MessageType.REJECTED,
                        );
                      },
                      (r) {
                        postList.clear();
                        postList.addAll(r);
                      },
                    );
                  }
                  return snapshot.data == null
                      ? SpinKitCircle(
                          color: AppColors.mainBlueColor,
                        )
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: postList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return PostPhotoView(
                                        currentPost: postList[index],
                                      );
                                    },
                                  ));
                                },
                                child: CustomPost(
                                  deleteVisiable: false,
                                  title: postList[index].title ?? '',
                                  body: postList[index].body ?? '',
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
