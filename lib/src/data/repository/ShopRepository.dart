import 'package:atta_mobile_app/src/data/models/ShopModel.dart';
import 'package:atta_mobile_app/src/data/repository/Repository.dart';

abstract class ShopRepository extends Repository {
  Future<ShopModel> getShopInfo(int id);
 
}