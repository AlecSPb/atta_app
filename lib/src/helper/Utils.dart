import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Utils {
  static checkResponse(http.Response response, BuildContext context) async {
    if (response.statusCode == 401) {
      Navigator.pushReplacementNamed(context, "/Splash");
    }
  }
}
