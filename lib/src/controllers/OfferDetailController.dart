import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/data/models/ShopModel.dart';
import 'package:atta_mobile_app/src/data/services/FavoritServices.dart';
import 'package:atta_mobile_app/src/data/services/ShopService.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:url_launcher/url_launcher.dart';

class OfferDetailController extends ControllerMVC {
  //to make single instance of class
  factory OfferDetailController() {
    if (_this == null) _this = OfferDetailController._();
    return _this;
  }
  static OfferDetailController _this;

  OfferDetailController._();

  static OfferDetailController get con => _this;

  ShopService shopService = new ShopService();
  ShopModel shopModel = new ShopModel();

  FavoritServices favoritServices = new FavoritServices();
  OfferModel offerModel = new OfferModel();

    Future addToFavoritOffers(int id) async {
    isLoading = true;
    offerModel = await favoritServices.addToFavoritOffers(id);
    isLoading = false;
  }

  bool isLoading = false;
  Future getShopInfo(int id) async {
    isLoading = true;
    refresh();
    shopModel = await shopService.getShopInfo(id);
    isLoading = false;
    refresh();
  }

  launchURLPhone() async {
    if (shopModel.contactTele != null) {
      var url = "tel:${shopModel.contactTele}";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  launchURLEmail() async {
    if (shopModel.contactEmail != null) {
      var url = "mailto:${shopModel.contactEmail}";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  List<NetworkImage> sliderimages = new List<NetworkImage>();
  getTicketDetailImageSlider(OfferModel offer) {
    sliderimages.clear();
    if (offer != null && offer.offerPics != null) {
      for (int i = 0; i < offer.offerPics.length; i++) {
        sliderimages.add(new NetworkImage(offer.offerPics[i].path));
      }
    }
    if (sliderimages.length == 0) {
      sliderimages.add(
          new NetworkImage("https://www.w3schools.com/w3css/img_forest.jpg"));
    }
    refresh();
  }
}
