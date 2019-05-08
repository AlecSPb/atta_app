import 'dart:convert';

import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/models/ContactModel.dart';
import 'package:atta_mobile_app/src/data/repository/ContactRepository.dart';
import 'package:http/http.dart' as http;

class ContactService extends ContactRepository {
  @override
  Future<ContactModel> getContact() async {
    return await http.get(TextFieldController.apiUrl + "contact/1", headers: {
      'Authorization': 'bearer ${TextFieldController.token}'
    }).then((response) {
      if (response.statusCode == 200) {
        var jsonModel = json.decode(response.body);
        ContactModel contactModel =
            ContactModel.fromJson(jsonModel);
        return contactModel;
      } else
        return new ContactModel();
    });
  }

  @override
  Future<bool> sendContactMsg(String msg) async {
    var model = {"title": "Message from Mobile Application", "message": msg};
    return await http
        .post(TextFieldController.apiUrl + "contact",
            headers: {'Authorization': 'bearer ${TextFieldController.token}',
            'content-type':'application/json'},
            body: jsonEncode(model))
        .then((response) { 
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else
        return false;
    }).catchError((error) {
      return false;
    });
  }
}
