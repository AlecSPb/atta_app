import 'dart:convert';

import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/models/ShopModel.dart';
import 'package:atta_mobile_app/src/data/repository/ShopRepository.dart';
import 'package:http/http.dart' as http;

class ShopService extends ShopRepository {
  @override
  Future<ShopModel> getShopInfo(int id) async {
    return await http.get(
      TextFieldController.apiUrl + "shop/$id",
      headers: {'Authorization': 'bearer ${TextFieldController.token}'},
    ).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        ShopModel model = ShopModel.fromJson(jsonValue);
        return model;
      } else 
        return ShopModel();
    });
  }
}
