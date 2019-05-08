import 'package:atta_mobile_app/src/data/models/CategoryModel.dart';
import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/data/services/HomeService.dart';
import 'package:atta_mobile_app/src/widgets/SharedWidget.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeController extends ControllerMVC {
  HomeService homeService = HomeService();
  //to make single instance of classfffffffffffffffff
  factory HomeController() {
    if (_this == null) _this = HomeController._();
    return _this;
  }
  static HomeController _this;

  HomeController._();

  static HomeController get con => _this;
  bool viewAllCategory = false;

  List<CategoryModel> allCategory = new List<CategoryModel>();
  List<OfferModel> topOffer = new List<OfferModel>();
  List<OfferModel> latestOffer = new List<OfferModel>();
  bool isLoading = false;
  void init(BuildContext context) async {
    isLoading = true;
    refresh();
    await Future.wait([
      getGetAllCategory(),
      getTopOffer(),
      getLatestOffers(),
    ]);
    isLoading = false;
    refresh();
  }

  Future getGetAllCategory() async {
    allCategory = await homeService.getAllticketCategory();
  }

  void viewCategory() {
    viewAllCategory = !viewAllCategory;
    refresh();
  }

  Future getTopOffer() async {
    topOffer = await homeService.getTopOffer();
  }

  Future getLatestOffers() async {
    latestOffer = await homeService.getLatestOffers();
  }
}
