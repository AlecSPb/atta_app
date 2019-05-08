import 'package:atta_mobile_app/src/data/models/NewsModel.dart';
import 'package:atta_mobile_app/src/data/repository/Repository.dart';

abstract class NewsRepository extends Repository {
  Future<List<NewsModel>> getAllNews();
}