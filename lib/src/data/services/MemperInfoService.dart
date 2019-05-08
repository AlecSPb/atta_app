import 'dart:convert';

import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/SharedPreference.dart';
import 'package:atta_mobile_app/src/data/models/MemperInfoModel.dart';
import 'package:atta_mobile_app/src/data/models/UserModel.dart';
import 'package:atta_mobile_app/src/data/repository/MemperInfoReposiyory.dart';
import 'package:http/http.dart' as http;

class MemperInfoService extends MemperInfoRepository {
  Future<MemperInfoModel> getAllMemperInfo() async {
    UserModel user = await SharedPreference.getUser();
    print(user.userName);
    return await http.get(
      TextFieldController.apiUrl + "Member/MemberByUser/" + user.userName,
      headers: {'Authorization': 'bearer ${TextFieldController.token}'},
    ).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        MemperInfoModel memperInfoModel = MemperInfoModel.fromJson(jsonValue);

        SharedPreference.savedMemperInfo(memperInfoModel);

        return memperInfoModel;
        //  return (jsonValue as List).map((f) => new MemperInfoModel.fromJson(f)).toList();
      } else
        return MemperInfoModel();
    });
  }
}
