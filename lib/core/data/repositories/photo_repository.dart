import 'package:big_winner_yay/core/data/models/apis/photo_model.dart';
import 'package:big_winner_yay/core/data/models/common_response.dart';
import 'package:big_winner_yay/core/data/network/endpoints/photo_endpoints.dart';
import 'package:big_winner_yay/core/data/network/network_config.dart';
import 'package:big_winner_yay/core/enums/request_type.dart';
import 'package:big_winner_yay/core/utils/network_utils.dart';
import 'package:dartz/dartz.dart';

class PhotoRepository {
  Future<Either<String, List<PhotoModel>>> getAllPhotos({
    required int albumId,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: NetworkConfig.BASE_API_PHOTOS +
            albumId.toString() +
            PhotoEndpoints.getAllPhoto,
        headers: NetworkConfig.getHeaders(
          requestType: RequestType.GET,
          needAuth: false,
        ),
      ).then(
        (response) {
          CommonResponseModel<List<dynamic>> commonResponse =
              CommonResponseModel.fromJson(response);
          if (commonResponse.getStatus) {
            List<PhotoModel> resultList = [];

            commonResponse.data!.forEach(
              (element) {
                resultList.add(PhotoModel.fromJson(element));
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
}
