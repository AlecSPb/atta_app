import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldController {
  static String apiUrl = "http://ataa.dubai-eg.com/api/";
  //static String url = "http://ataa.dubai-eg.com/";
  static String token;
  //loginPage
  static final FocusNode focusPasswordField = new FocusNode();
  static final GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> loginScaffoldkey =
      new GlobalKey<ScaffoldState>();
  static bool loginAutoValid = false;
  //regPage
  static final GlobalKey<FormState> regformKey = GlobalKey<FormState>();
  static final FocusNode focusUserNameField = new FocusNode();
  static final FocusNode focusEmailField = new FocusNode();
  static final FocusNode focusPhoneField = new FocusNode();
  static final FocusNode focusRegPasswordField = new FocusNode();
  static final FocusNode focusRetypePasswordField = new FocusNode();
  static final FocusNode focusCodeField = new FocusNode();
  static final TextEditingController passwordController =
      new TextEditingController();
  static final TextEditingController emailController =
      new TextEditingController();
  static final TextEditingController telephoneController =
      new TextEditingController();
  static final TextEditingController studenCodeController =
      new TextEditingController();
  static final TextEditingController usernmeController =
      new TextEditingController();

  static final TextEditingController searchController =
      new TextEditingController();
  static final TextEditingController noOfAttendes = new TextEditingController();
  static bool regAutoValid = false;
  static final GlobalKey<ScaffoldState> regScaffoldkey =
      new GlobalKey<ScaffoldState>();
  //layout
  static final GlobalKey<ScaffoldState> layoutScaffoldkey =
      new GlobalKey<ScaffoldState>();
  //ticket page
  static int categoryID = 0;
  static String appBar = "";
}
