

import 'package:atta_mobile_app/src/data/models/EventModel.dart';
import 'package:atta_mobile_app/src/data/models/NewsModel.dart';
import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/data/models/ShopModel.dart';

import 'package:atta_mobile_app/src/data/repository/Repository.dart';


abstract class FavoritRepository extends Repository{
Future<List<EventModel>> getFavoritEvents();
Future<List<OfferModel>> getFavoritOffers();
Future<List<NewsModel>> getFavoritNews();
Future<List<ShopModel>> getFavoritShop();

Future<EventModel> addToFavoritEvents(int id);
Future<OfferModel> addToFavoritOffers(int id);
Future<NewsModel> addToFavoritNews(int id);
Future<ShopModel> addToFavoritShop(int id);

Future<EventModel> deleteFromFavoritEvents(int id);
Future<OfferModel> deleteFromFavoritOffers(int id);
Future<NewsModel> deleteFromFavoritNews(int id);
Future<ShopModel> deleteFromFavoritShop(int id);
}