import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/data/services/OfferServices.dart';


import 'package:mvc_pattern/mvc_pattern.dart';

class CoponController extends ControllerMVC {
  //to make single instance of class
  factory CoponController() {
    if (_this == null) _this = CoponController._();
    return _this;
  }
  static CoponController _this;

  CoponController._();

  static CoponController get con => _this;

  OfferService offerService = OfferService();

  List<OfferModel> copons = new List<OfferModel>();
  List<OfferModel> allCopons = new List<OfferModel>();

  bool isloading = false;

  Future getAllCopons() async {
    isloading = true;
    refresh();
    copons = await offerService.getAllCopons();
    allCopons = copons;
    isloading = false;
    refresh();
  }

  Future getCoponsByCategory(int categoryID) async {
    isloading = true;
    refresh();
    copons = await offerService.getCoponsByCategory(categoryID);
    isloading = false;
    refresh();
  }

  searchCopons(String searchQuery) {
    List filteredList = allCopons.where((i) => i.nameAr.contains(searchQuery)).toList();
    // copons = allCopons.where((i) => i.nameAr.contains(searchQuery));
    copons = filteredList;
    print(copons);
    refresh();
  }
}
