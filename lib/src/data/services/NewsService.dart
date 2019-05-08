import 'dart:convert';

import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/models/CategoryModel.dart';
import 'package:atta_mobile_app/src/data/models/NewsModel.dart';

import 'package:atta_mobile_app/src/data/repository/NewsRepository.dart';
import 'package:http/http.dart' as http;

class NewsService extends NewsRepository{
  @override
  Future<List<NewsModel>> getAllNews() async {
     return await http
        .get(TextFieldController.apiUrl + "News",
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

}