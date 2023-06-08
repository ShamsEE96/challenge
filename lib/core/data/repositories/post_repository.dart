import 'package:big_winner_yay/core/data/models/apis/post_model.dart';
import 'package:big_winner_yay/core/data/models/common_response.dart';
import 'package:big_winner_yay/core/data/network/endpoints/post_endpoints.dart';
import 'package:big_winner_yay/core/data/network/network_config.dart';
import 'package:big_winner_yay/core/enums/request_type.dart';
import 'package:big_winner_yay/core/utils/network_utils.dart';
import 'package:dartz/dartz.dart';

class PostRepository {
  Future<Either<String, List<PostModel>>> getAllPosts() async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: PostEndpoints.getAll,
        headers: NetworkConfig.getHeaders(
          requestType: RequestType.GET,
          needAuth: false,
        ),
      ).then(
        (response) {
          CommonResponseModel<List<dynamic>> commonResponse =
              CommonResponseModel.fromJson(response);
          if (commonResponse.getStatus) {
            List<PostModel> resultList = [];

            commonResponse.data!.forEach(
              (element) {
                resultList.add(PostModel.fromJson(element));
              },
            );
            return Right(resultList);
          } else {
            return Left(commonResponse.message ?? '');
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, PostModel>> createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.POST,
        url: PostEndpoints.create,
        headers: NetworkConfig.getHeaders(
          requestType: RequestType.POST,
          needAuth: false,
        ),
        body: {
          "title": title,
          "body": body,
          "userId": userId = 1,
        },
      ).then(
        (response) {
          CommonResponseModel<Map<String, dynamic>> commonResponse =
              CommonResponseModel.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(
              PostModel.fromJson(commonResponse.data ?? {}),
            );
          } else {
            return Left(commonResponse.message ?? '');
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, PostModel>> updatePost({
    required String title,
    required String body,
    required int userId,
    required int postId,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.PUT,
        url: PostEndpoints.update + postId.toString(),
        headers: NetworkConfig.getHeaders(
          requestType: RequestType.PUT,
          needAuth: false,
        ),
        body: {
          "title": title,
          "body": body,
          "userId": userId = 1,
          "id": postId,
        },
        // params: {
        //   "id": postId,
        // },
      ).then(
        (response) {
          CommonResponseModel<Map<String, dynamic>> commonResponse =
              CommonResponseModel.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(
              PostModel.fromJson(commonResponse.data ?? {}),
            );
          } else {
            return Left(commonResponse.message ?? '');
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, PostModel>> deletePost({
    required int postId,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.DELETE,
        url: PostEndpoints.delete + postId.toString(),
        headers: NetworkConfig.getHeaders(
          requestType: RequestType.DELETE,
          needAuth: false,
        ),
        // params: {
        //   "id": postId,
        // },
      ).then(
        (response) {
          CommonResponseModel<Map<String, dynamic>> commonResponse =
              CommonResponseModel.fromJson(response);
          if (commonResponse.getStatus) {
            return Right(
              PostModel.fromJson(commonResponse.data ?? {}),
            );
          } else {
            return Left(commonResponse.message ?? '');
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
