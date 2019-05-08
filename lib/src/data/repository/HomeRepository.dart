import 'package:atta_mobile_app/src/data/models/CategoryModel.dart';
import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/data/repository/Repository.dart';

abstract class HomeRepository extends Repository {
  Future<List<CategoryModel>> getAllticketCategory();
  Future<List<OfferModel>> getTopOffer();
  Future<List<OfferModel>> getLatestOffers();
}