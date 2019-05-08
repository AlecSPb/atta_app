import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/data/repository/Repository.dart';

abstract class OfferRepository extends Repository {
  Future<List<OfferModel>> getAllOffer();
  Future<List<OfferModel>> getAllCopons();
  Future<List<OfferModel>> getCoponsByCategory(int categoryID);
}