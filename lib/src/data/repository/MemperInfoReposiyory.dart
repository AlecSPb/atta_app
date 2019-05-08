import 'package:atta_mobile_app/src/data/models/MemperInfoModel.dart';
import 'package:atta_mobile_app/src/data/repository/Repository.dart';

abstract class MemperInfoRepository extends Repository {
  Future<MemperInfoModel> getAllMemperInfo();
}