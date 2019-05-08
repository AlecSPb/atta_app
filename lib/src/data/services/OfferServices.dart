import 'dart:convert';

import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/data/repository/OfferRepository.dart';
import 'package:http/http.dart' as http;
class OfferService extends OfferRepository {
  
  @override
  Future<List<OfferModel>> getAllOffer() async{
     return await http
        .get(TextFieldController.apiUrl + "offer/LatestOffers/0",
            headers: {
              'Authorization': 'bearer ${TextFieldController.token}'
            },
            )
        .then((response) {
      if (response.statusCode == 200) {
       var jsonValue = json.decode(response.body);
       return (jsonValue as List).map((f) => new OfferModel.fromJson(f)).toList();
      } else
        return  List<OfferModel>();
    });
  }

  @override
  Future<List<OfferModel>> getCoponsByCategory(int categoryID) async{
     return await http
        .get(TextFieldController.apiUrl + "CoponsByCategory/"+categoryID.toString(),
            headers: {
              'Authorization': 'bearer ${TextFieldController.token}'
            },
            )
        .then((response) {
      if (response.statusCode == 200) {
       var jsonValue = json.decode(response.body);
       return (jsonValue as List).map((f) => new OfferModel.fromJson(f)).toList();
      } else
        return  List<OfferModel>();
    });

  }

  @override
  Future<List<OfferModel>> getAllCopons() async{
    return await http
        .get(TextFieldController.apiUrl + "offer/LatestCopons/0",
            headers: {
              'Authorization': 'bearer ${TextFieldController.token}'
            },
            )
        .then((response) {
      if (response.statusCode == 200) {
       var jsonValue = json.decode(response.body);
       return (jsonValue as List).map((f) => new OfferModel.fromJson(f)).toList();
      } else
        return  List<OfferModel>();
    });
  }
  
}