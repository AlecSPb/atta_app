import 'dart:convert';

import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/models/CategoryModel.dart';
import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/data/repository/HomeRepository.dart';
import 'package:http/http.dart' as http;

class HomeService extends HomeRepository {
  //static final http.Client _client = http.Client();

  @override
  Future<List<CategoryModel>> getAllticketCategory() async {
    return await http.get(
      TextFieldController.apiUrl + "category",
      headers: {'Authorization': 'bearer ${TextFieldController.token}'},
    ).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        return (jsonValue as List)
            .map((f) => new CategoryModel.fromJson(f))
            .toList();
      } else
        return List<CategoryModel>();
    });
  }

  @override
  Future<List<OfferModel>> getLatestOffers() async {
    return await http.get(
      TextFieldController.apiUrl + "Offer/LatestOffers/5",
      headers: {'Authorization': 'bearer ${TextFieldController.token}'},
    ).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        List<OfferModel> offers =
            (jsonValue as List).map((f) => new OfferModel.fromJson(f)).toList();
        int x = 2;
        return offers;
      } else
        return List<OfferModel>();
    });
  }

  @override
  Future<List<OfferModel>> getTopOffer() async {
    return await http.get(
      TextFieldController.apiUrl + "Offer/TopOffers/5",
      headers: {'Authorization': 'bearer ${TextFieldController.token}'},
    ).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        return (jsonValue as List)
            .map((f) => new OfferModel.fromJson(f))
            .toList();
      } else
        return List<OfferModel>();
    });
  }
}
