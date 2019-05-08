import 'dart:async';
import 'dart:convert';

import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/SharedPreference.dart';
import 'package:atta_mobile_app/src/data/models/TokenModel.dart';
import 'package:atta_mobile_app/src/data/models/UserModel.dart';
import 'package:atta_mobile_app/src/data/services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  @protected
  @override
  createState() => SplashView();
}

class SplashView extends State<SplashScreen> {
  loadTokenFromCache() async {
    await SharedPreference.getUserToken().then((data) async {
      Token mytoken = new Token();
      if (data != null) {
        var jsonmodel = json.decode(data);
        mytoken = Token.fromJson(jsonmodel);
        setState(() {
          TextFieldController.token = mytoken.token;
        });
        await checkToken();
      } else {
        Navigator.pushReplacementNamed(context, "/Login");
      }
    }, onError: (error) {
      Navigator.pushReplacementNamed(context, "/Login");
    });
  }

  checkToken() async {
    await http.post(TextFieldController.apiUrl + "auth/checkToken", headers: {
      "Content-Type": "application/json",
      "Authorization": "bearer ${TextFieldController.token}"
    }).then((response) async {
      if (response.statusCode == 200) {
        Navigator.pushReplacementNamed(context, "/Home");
      } else {
        await SharedPreference.removeUserToken();
        await renewToken();
      }
    }).catchError((error) async {
      await SharedPreference.removeUserToken();
      await renewToken();
    });
  }

  renewToken() async {
    UserModel userModel = await SharedPreference.getUser();
    UserService _userService = new UserService();
    bool isValidCredentials =
        await _userService.signInWithEmailAndPassword(userModel);
    if (isValidCredentials) {
      Navigator.pushReplacementNamed(context, "/Home");
    } else {
      Navigator.pushReplacementNamed(context, "/Login");
    }
  }

  @override
  void initState() {
    loadTokenFromCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/imgs/splash.png',
        fit: BoxFit.cover,
      ),
    ));
  }
}
