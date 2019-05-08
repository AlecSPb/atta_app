import 'package:atta_mobile_app/src/data/models/NewsModel.dart';
import 'package:atta_mobile_app/src/data/services/NewsService.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class NewsController extends ControllerMVC {
  //to make single instance of class
  factory NewsController() {
    if (_this == null) _this = NewsController._();
    return _this;
  }
  static NewsController _this;

  NewsController._();
  static NewsController get con => _this;
  NewsService newsService = new NewsService();
  List<NewsModel> news = new List<NewsModel>();

  bool isLoading = false;
  Future getAllNews() async {
    isLoading = true;
    refresh();
    news = await newsService.getAllNews();
    isLoading = false;
    refresh();
  }

 

  
}
