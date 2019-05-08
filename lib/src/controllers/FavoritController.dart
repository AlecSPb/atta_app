import 'package:atta_mobile_app/src/data/models/EventModel.dart';
import 'package:atta_mobile_app/src/data/models/NewsModel.dart';
import 'package:atta_mobile_app/src/data/models/ShopModel.dart';



import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/data/services/FavoritServices.dart';




import 'package:mvc_pattern/mvc_pattern.dart';

class FavoritController extends ControllerMVC {
  //to make single instance of class
  factory FavoritController() {
    if (_this == null) _this = FavoritController._();
    return _this;
  }
  static FavoritController _this;

  FavoritController._();
  

  static FavoritController get con => _this;
  
  FavoritServices favoritService= new FavoritServices();


  
  List<EventModel> events = new List<EventModel>();
  List<OfferModel> offers = new List<OfferModel>();
  List<NewsModel> news = new List<NewsModel>();
  List<ShopModel> shop = new List<ShopModel>();

  EventModel _eventModel = new EventModel();
 
  bool isLoading=false;
  Future getFavoritEvents() async{
    isLoading=true;
    refresh();
    events =await favoritService.getFavoritEvents();
    isLoading=false;
    refresh();
  }

  Future getFavoritOffers() async{
    isLoading=true;
    refresh();
    offers =await favoritService.getFavoritOffers();
    isLoading=false;
    refresh();
  }

  Future getFavoritNews() async{
    isLoading = true;
    refresh();
    news = await favoritService.getFavoritNews();
    refresh();
  }

  Future getFavoritShop() async{
    isLoading = true ;
    refresh();
    shop = await favoritService.getFavoritShop();
    refresh();
  }

  bool favorite = false ;

  Future toggleNewsFavourite(int id) async {
   // bool currentState = news.where((n) => n.newsId == id).first.isFavorite;
    if (!favorite) {
      
        await favoritService.deleteFromFavoritNews(id);
      
    } else {
     
        await favoritService.addToFavoritNews(id);
     
    }
   // news.where((n) => n.newsId == id).first.isFavorite = !currentState;
    refresh();
    // isLoading = false;
  }

    Future toggleEventFavourite(int id) async {
    bool currentState = events.where((e) => e.eventId == id).first.isFavorite;
    if (currentState) {
      
        await favoritService.deleteFromFavoritEvents(id);
      
    } else {
     
        await favoritService.addToFavoritEvents(id);
     
    }
    events.where((e) => e.eventId == id).first.isFavorite = !currentState;
    refresh();
    // isLoading = false;
  }

    Future toggleOfferFavourite(int id) async {
    bool currentState = offers.where((o) => o.offerId == id).first.isFavorite;
    if (currentState) {
      
        await favoritService.deleteFromFavoritOffers(id);
      
    } else {
     
        await favoritService.addToFavoritOffers(id);
     
    }
    offers.where((o) => o.offerId == id).first.isFavorite = !currentState;
    refresh();
    // isLoading = false;
  }

    Future toggleShopFavourite(int id) async {
    bool currentState = shop.where((sh) => sh.shopId == id).first.isFavorite;
    if (currentState) {
      
        await favoritService.deleteFromFavoritShop(id);
      
    } else {
     
        await favoritService.addToFavoritShop(id);
     
    }
    shop.where((sh) => sh.shopId == id).first.isFavorite = !currentState;
    refresh();
    // isLoading = false;
  }


 

}