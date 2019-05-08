import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/data/services/OfferServices.dart';
import 'package:atta_mobile_app/src/widgets/SharedWidget.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class OfferController extends ControllerMVC {
  //to make single instance of class
  factory OfferController() {
    if (_this == null) _this = OfferController._();
    return _this;
  }
  static OfferController _this;

  OfferController._();

  static OfferController get con => _this;

  OfferService offerService = OfferService();

  List<OfferModel> allOffer = new List<OfferModel>();
  

  bool isloading = false;


  Future getAllOffers() async {
    isloading = true;
    refresh();
    allOffer = await offerService.getAllOffer();
    isloading = false;
    refresh();
  }


  

}
