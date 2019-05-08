import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/models/ContactModel.dart';
import 'package:atta_mobile_app/src/data/services/ContactService.dart';
import 'package:atta_mobile_app/src/widgets/SharedWidget.dart';
import 'package:flutter/widgets.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ContactUsController extends ControllerMVC {
  //to make single instance of class
  factory ContactUsController() {
    if (_this == null) _this = ContactUsController._();
    return _this;
  }
  static ContactUsController _this;

  ContactUsController._();

  static ContactUsController get con => _this;
  ContactService _contactService = new ContactService();
  final TextEditingController messageController = new TextEditingController();

  bool isloading = false;
  ContactModel contactModel = new ContactModel();

  getContactInfo() async {
    isloading = true;
    refresh();
    contactModel = await _contactService.getContact();
    isloading = false;
    refresh();
  }

  sendContactMsg() async {
    bool isSent = await _contactService.sendContactMsg(messageController.text);
    return isSent;
  }
}
