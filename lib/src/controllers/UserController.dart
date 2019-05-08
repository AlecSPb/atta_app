import 'dart:io';

import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/models/MemperInfoModel.dart';
import 'package:atta_mobile_app/src/data/models/UserModel.dart';
import 'package:atta_mobile_app/src/data/services/MemperInfoService.dart';
import 'package:atta_mobile_app/src/data/services/UserService.dart';
import 'package:atta_mobile_app/src/screens/reg_screen.dart';
import 'package:atta_mobile_app/src/widgets/SharedWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:multiple_image_picker/multiple_image_picker.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends ControllerMVC {
  //to make single instance of class
  factory UserController() {
    if (_this == null) _this = UserController._();
    return _this;
  }
  static UserController _this;

  UserController._();

  static UserController get con => _this;

  UserService userService = UserService();

  UserModel model = UserModel();

  MemperInfoService memperInfoService = new MemperInfoService();
  MemperInfoModel  memperInfoModel = new MemperInfoModel();

  File _image;

  File get image => _image;

  Future getImage() async {
    var imagex = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = imagex;
    });
    refresh();
  }

  Future signInWithEmailAndPassword(BuildContext context) async {
    final form = TextFieldController.loginformKey.currentState;
    TextFieldController.loginAutoValid = true;
    if (form.validate()) {
      form.save();
      SharedWidget.onLoading(context);
      bool res = await userService.signInWithEmailAndPassword(
          model);
    Navigator.pop(context);
      if (!res)
        SharedWidget.showSnackBar(
            TextFieldController.loginScaffoldkey, "خطأ فى التسجيل");
      else
      {
        TextFieldController.loginAutoValid = false;
        Navigator.pushReplacementNamed(context, "/Home");
      }
    }
    refresh();
  }

  Future regNewUser(BuildContext context) async {
    final form = TextFieldController.regformKey.currentState;
    TextFieldController.regAutoValid=true;
    if (form.validate()) {
      form.save();
      SharedWidget.onLoading(context);
      bool res= await userService.regNewUser(model);
       if (!res)
        SharedWidget.showSnackBar(
            TextFieldController.regScaffoldkey, "خطأ فى التسجيل");
      else
      {
         SharedWidget.showSnackBar(
            TextFieldController.regScaffoldkey, "تم التسجيل بنجاح");
      }
      Navigator.pop(context);
    }
    refresh();
  }
  
  

  void navigateToRegPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegScreen()));
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }
}
