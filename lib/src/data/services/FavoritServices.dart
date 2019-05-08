

import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/models/EventModel.dart';
import 'package:atta_mobile_app/src/data/models/MemperInfoModel.dart';
import 'package:atta_mobile_app/src/data/models/NewsModel.dart';
import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/data/models/ShopModel.dart';
import 'package:atta_mobile_app/src/data/repository/FavoritRepository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atta_mobile_app/src/data/SharedPreference.dart';

class FavoritServices extends FavoritRepository {
  @override
  Future<List<EventModel>> getFavoritEvents() async{
    MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();
    return await http
        .get(TextFieldController.apiUrl + "FavoriteEvent/EventsByMember/"+memperInfoModel.memberId.toString(),
            headers: {
              'Authorization': 'bearer ${TextFieldController.token}'
            },
            )
        .then((response) {
      if (response.statusCode == 200) {
       var jsonValue = json.decode(response.body);
       return (jsonValue as List).map((f) => new EventModel.fromJson(f)).toList();
      } else
        return  List<EventModel>();
    });
  }

  @override
  Future<List<NewsModel>> getFavoritNews() async{
    MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();
    return await http
        .get(TextFieldController.apiUrl + "FavoriteNews/NewsByMember/"+memperInfoModel.memberId.toString(),
            headers: {
              'Authorization': 'bearer ${TextFieldController.token}'
            },
            )
        .then((response) {
      if (response.statusCode == 200) {
       var jsonValue = json.decode(response.body);
       return (jsonValue as List).map((f) => new NewsModel.fromJson(f)).toList();
      } else
        return  List<NewsModel>();
    });
  }

  @override
  Future<List<OfferModel>> getFavoritOffers() async{
   MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();
      return await http
        .get(TextFieldController.apiUrl + "FavoriteOffer/OffersByMember/"+memperInfoModel.memberId.toString(),
            headers: {
              'Authorization': 'bearer ${TextFieldController.token}'
            },
            )
        .then((response) {
      if (response.statusCode == 200) {
       var jsonValue = json.decode(response.body);
       print("offer list >>>>>>> ${jsonValue}");
       return (jsonValue as List).map((f) => new OfferModel.fromJson(f)).toList();
      } else
        return  List<OfferModel>();
    });
  }

  @override
  Future<List<ShopModel>> getFavoritShop()async{
     MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();
    return await http
        .get(TextFieldController.apiUrl + "FavoriteShop/ShopsByMember/"+memperInfoModel.memberId.toString(),
            headers: {
              'Authorization': 'bearer ${TextFieldController.token}'
            },
            )
        .then((response) {
      if (response.statusCode == 200) {
       var jsonValue = json.decode(response.body);
       return (jsonValue as List).map((f) => new ShopModel.fromJson(f)).toList();
      } else
        return  List<ShopModel>();
    });
  }

  @override
  Future<EventModel> addToFavoritEvents(int id) async{
     MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();
    var jsonBody =  {"MemberId": memperInfoModel.memberId.toString(), "EventId": id.toString()};
    return await http.post(
      TextFieldController.apiUrl + "FavoriteEvent/",
      body: jsonEncode(jsonBody),
      headers: {'Authorization': 'bearer ${TextFieldController.token }' ,
       'Content-Type': 'application/json'},
      
    ).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonValue = json.decode(response.body);
        // return (jsonValue as List).map((f) => new EventModel.fromJson(f)).toList();
        print("add Events is ok");
        return EventModel.fromJson(jsonValue);
      } else{
        print("add Events is not ok");
        return EventModel();
      }
    });
  }

  @override
  Future<NewsModel> addToFavoritNews(int id) async{
     MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();
  var jsonBody =  {"MemberId": memperInfoModel.memberId.toString(), "NewsId": id.toString()};
    return await http.post(
      TextFieldController.apiUrl + "FavoriteNews/",
     body: jsonEncode(jsonBody),
      headers: {'Authorization': 'bearer ${TextFieldController.token }' ,
       'Content-Type': 'application/json'},
      
    ).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonValue = json.decode(response.body);
        print("add News is ok");
        // return (jsonValue as List).map((f) => new EventModel.fromJson(f)).toList();
        // return NewsModel.fromJson(jsonValue);
      } else{
print("add News is not ok");
 return NewsModel();
      }
       
    });
  }

  @override
  Future<OfferModel> addToFavoritOffers(int id) async{
  MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();
    var jsonBody =  {"MemberId": memperInfoModel.memberId.toString(), "OfferId": id.toString()};
    return await http.post(
      TextFieldController.apiUrl + "FavoriteOffer/",
    
      headers: {'Authorization': 'bearer ${TextFieldController.token }' ,
       'Content-Type': 'application/json'},
      body: jsonEncode(jsonBody),
    ).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonValue = json.decode(response.body);
        // return (jsonValue as List).map((f) => new EventModel.fromJson(f)).toList();
        print("add Offers is  ok");
        return OfferModel.fromJson(jsonValue);
      } else {
            print("add Offers is not ok");
        return OfferModel();
      }
        
    });
  }

  @override
  Future<ShopModel> addToFavoritShop(int id) async{
      MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();
    var jsonBody =  {"MemberId": memperInfoModel.memberId.toString(), "ShopId": id.toString()};
    return await http.post(
      TextFieldController.apiUrl + "FavoriteShop/",
      body: jsonEncode(jsonBody),
      headers: {'Authorization': 'bearer ${TextFieldController.token }' ,
       'Content-Type': 'application/json'},
      
    ).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonValue = json.decode(response.body);
        print("favorit shop is ${jsonValue}");
        // return (jsonValue as List).map((f) => new EventModel.fromJson(f)).toList();
        print("add Shop is  ok");
        return ShopModel.fromJson(jsonValue);
      } else {
        print("add Shop is not ok");
        return ShopModel();
      }
        
    });
  }

  @override
  Future<EventModel> deleteFromFavoritEvents(int id) async{
      MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();

    return await http.delete(
      TextFieldController.apiUrl +
          "FavoriteEvent/$id/${memperInfoModel.memberId}",
      headers: {
        'Authorization': 'bearer ${TextFieldController.token}',
        'Content-Type': 'application/json'
      },
    ).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonValue = json.decode(response.body);
        // return (jsonValue as List).map((f) => new EventModel.fromJson(f)).toList();
        print("delete Events is ok");
        print(jsonValue);
        return EventModel.fromJson(jsonValue);
      } else {
        print("delete Events is  not ok");
        return EventModel();
      }
    });
  }

  @override
  Future<NewsModel> deleteFromFavoritNews(int id) async{
      MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();
    return await http.delete(
      TextFieldController.apiUrl +
          "FavoriteNews/" +
          id.toString() +
          memperInfoModel.memberId.toString(),
      headers: {
        'Authorization': 'bearer ${TextFieldController.token}',
        'Content-Type': 'application/json'
      },
    ).then((response) {
      if (response.statusCode == 200 ) {
        var jsonValue = json.decode(response.body);
        // return (jsonValue as List).map((f) => new EventModel.fromJson(f)).toList();
         print("delete Events is ok");
        return NewsModel.fromJson(jsonValue);
      } else{
         print("delete Events is not ok");
          return NewsModel();
      }
       
    });
  }

  @override
  Future<OfferModel> deleteFromFavoritOffers(int id) async{
        MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();
    return await http.delete(
      TextFieldController.apiUrl +
          "FavoriteOffer/" +
          id.toString() +
          memperInfoModel.memberId.toString(),
      headers: {
        'Authorization': 'bearer ${TextFieldController.token}',
        'Content-Type': 'application/json'
      },
    ).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonValue = json.decode(response.body);
        // return (jsonValue as List).map((f) => new EventModel.fromJson(f)).toList();
        print("delete Offer is ok");
        return OfferModel.fromJson(jsonValue);
      } else{
        print("delete Offer is not ok");
        return OfferModel();
      }
        
    });
  }

  @override
  Future<ShopModel> deleteFromFavoritShop(int id) async{
   MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();
    return await http.delete(
      TextFieldController.apiUrl +
          "FavoriteShop/" +
          id.toString() +
          memperInfoModel.memberId.toString(),
      headers: {
        'Authorization': 'bearer ${TextFieldController.token}',
        'Content-Type': 'application/json'
      },
    ).then((response) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonValue = json.decode(response.body);
        // return (jsonValue as List).map((f) => new EventModel.fromJson(f)).toList();
        print("delete Shop is ok");
        return ShopModel.fromJson(jsonValue);
      } else{
        print("delete Shop is not ok");
        return ShopModel();
      }
        
    });
  }
}