import 'package:big_winner_yay/core/enums/file_type.dart';

class FileTypeModel {
  FileTypeEnum type;
  String path;

  FileTypeModel(
    this.path,
    this.type,
  );
}
