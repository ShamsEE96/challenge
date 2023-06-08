import 'package:big_winner_yay/core/data/models/apis/photo_model.dart';
import 'package:big_winner_yay/core/data/models/apis/post_model.dart';
import 'package:big_winner_yay/core/data/repositories/photo_repository.dart';
import 'package:big_winner_yay/core/data/repositories/post_repository.dart';
import 'package:big_winner_yay/core/enums/message_type.dart';
import 'package:big_winner_yay/ui/shared/colors.dart';
import 'package:big_winner_yay/ui/shared/custom_widgets/custom_post.dart';
import 'package:big_winner_yay/ui/shared/custom_widgets/custom_text.dart';
import 'package:big_winner_yay/ui/shared/custom_widgets/custom_toast.dart';
import 'package:big_winner_yay/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PostPhotoView extends StatefulWidget {
  PostPhotoView({super.key, required this.currentPost});
  PostModel currentPost;
  @override
  State<PostPhotoView> createState() => _PostPhotoViewState();
}

class _PostPhotoViewState extends State<PostPhotoView> {
  List<PhotoModel> photoList = [];
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
                CustomPost(
                  onTap: () async {
                    await PostRepository()
                        .deletePost(postId: widget.currentPost.id!);
                    Navigator.pop(context);
                  },
                  deleteVisiable: true,
                  title: widget.currentPost.title!,
                  body: widget.currentPost.body!,
                ),
                (size.width / 30).ph,
                CustomText(
                  text: 'Album:',
                  textColor: AppColors.mainBlueColor,
                  fontSize: size.width / 10,
                  fontWeight: FontWeight.bold,
                ),
                (size.width / 30).ph,
                FutureBuilder(
                  future: PhotoRepository().getAllPhotos(
                    albumId: widget.currentPost.id!,
                  ),
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
                          photoList.clear();
                          photoList.addAll(r);
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
                            itemCount: photoList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: size.height / 3,
                                  width: size.width,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: photoList[index].url!,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
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
      ),
    );
  }
}
