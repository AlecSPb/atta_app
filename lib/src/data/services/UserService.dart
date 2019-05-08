import 'dart:convert';

import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/SharedPreference.dart';
import 'package:atta_mobile_app/src/data/models/MemperInfoModel.dart';
import 'package:atta_mobile_app/src/data/models/TokenModel.dart';
import 'package:atta_mobile_app/src/data/models/UserModel.dart';
import 'package:atta_mobile_app/src/data/repository/UserRepository.dart';
import 'package:atta_mobile_app/src/data/services/MemperInfoService.dart';
import 'package:http/http.dart' as http;

class UserService extends UserRepository {
  //static final http.Client _client = http.Client();

  @override
  Future<bool> signInWithEmailAndPassword(UserModel user) async {
    return await http
        .post(TextFieldController.apiUrl + "auth/login",
            headers: {
              "Content-Type": "application/json",
            },
            body: json.encode(user))
        .then((response) {
      if (response.statusCode == 200) {
        SharedPreference.savedUserToken(response.body);
        TextFieldController.token = json.decode(response.body)["token"];
        // var jsonValue = json.encode(user);

        SharedPreference.saveUser(user);

MemperInfoService().getAllMemperInfo();
        print(response.body);
        return true;
      } else
        return false;
    });
  }

  @override
  Future<bool> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    return null;
  }

  @override
  Future<bool> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    return null;
  }

  @override
  Future<bool> signInWithTwitter() {
    // TODO: implement signInWithTwitter
    return null;
  }

  @override
  Future<bool> regNewUser(UserModel usermodel) async {
    return await http
        .post(TextFieldController.apiUrl + "auth/register",
            headers: {
              "Content-Type": "application/json",
            },
            body: json.encode(usermodel))
        .then((response) {
      if (response.statusCode == 200) {
        return true;
      } else
        return false;
    }).catchError((error){
      print(error);
    });
  }
}
