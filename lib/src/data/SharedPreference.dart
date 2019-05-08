import 'dart:convert';

import 'package:atta_mobile_app/src/data/models/MemperInfoModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:atta_mobile_app/src/data/models/UserModel.dart';

class SharedPreference {
  UserModel userModel;
  MemperInfoModel memperInfoModel;
  static Future<bool> saveUser(UserModel usermodel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.setString("userModel", jsonEncode(usermodel));
  }

  static Future<UserModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return UserModel.fromJson(jsonDecode(prefs.getString("userModel")));
  }

  static Future<bool> savedMemperInfo(MemperInfoModel MemperInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setInt("memberId", MemperInfo.memberId);
      await prefs.setString("telephone", MemperInfo.telephone);
      await prefs.setString("email", MemperInfo.email);
      await prefs.setString("nameEn", MemperInfo.nameEn);
      await prefs.setString("nameEn", MemperInfo.nameAr);
      return true;
    } catch (e) {
      print("save to shared faild   :  $e");
      return false;
    }
  }

  static Future<MemperInfoModel> getMemperInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return new MemperInfoModel(
        memberId: prefs.getInt("memberId"),
        telephone: prefs.getString("telephone"),
        email: prefs.getString("email"),
        nameEn: prefs.getString("nameEn"),
        nameAr: prefs.getString("nameAr"));
  }

//  static Future<UserInfoModel> getUserInfoObject() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String pi = prefs.getString('userinfo');
//     UserInfoModel uinfo = UserInfoModel.fromJson(json.decode(pi));
//     return uinfo;
//   }

  // --------------------------------------------------------- -
  static Future<bool> savedUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    return prefs.commit();
  }

  static Future<String> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String pi = prefs.getString('token');
    return pi;
  }

  static Future<bool> removeUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    return prefs.commit();
  }
}
