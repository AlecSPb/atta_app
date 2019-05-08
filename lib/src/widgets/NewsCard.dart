import 'package:atta_mobile_app/src/controllers/FavoritController.dart';
import 'package:atta_mobile_app/src/controllers/NewsController.dart';
import 'package:atta_mobile_app/src/data/models/NewsModel.dart';
import 'package:atta_mobile_app/src/data/models/ShopModel.dart';

import 'package:atta_mobile_app/src/screens/news_detail.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  NewsModel newsModel;
  NewsCard({this.newsModel});

  NewsController _newsController = NewsController.con;
  FavoritController _favoritController = new FavoritController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[card(context), detailsBottom(context, newsModel)],
    );
  }

  Widget detailsBottom(BuildContext context, NewsModel newsModel) => Container(
        padding: EdgeInsets.only(top: 135),
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width - 130),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xff793B8E)),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "تفاصيل ",
              style: TextStyle(
                  color: Color(0xff793B8E), fontWeight: FontWeight.bold),
            ),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (BuildContext context) {
              return new NewsDetailScreen(
                newsModel: newsModel,
              );
            }));
          },
        ),
      );

  Widget card(BuildContext context) => Container(
        padding: EdgeInsets.all(8),
        //height: 250,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            children: <Widget>[
              Container(
                  height: 150,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: newsModel.imagePath != null
                          ? Image.network(
                              newsModel.imagePath,
                              fit: BoxFit.fitWidth,
                              width: MediaQuery.of(context).size.width,
                            )
                          : Image.asset(
                              'assets/imgs/2.jpg',
                              fit: BoxFit.fitWidth,
                              width: MediaQuery.of(context).size.width,
                            ))),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0, left: 8, right: 8, bottom: 8),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                      newsModel.titleAr != null
                                          ? newsModel.titleAr
                                          : "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff793B8E))))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                      newsModel.briefAr != null
                                          ? newsModel.briefAr
                                          : "",
                                      style: TextStyle(color: Colors.grey)))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.date_range,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    Text(
                                        newsModel.formatedEventDate != null
                                            ? newsModel.formatedEventDate
                                            : "",
                                        style: TextStyle(
                                            color: Color(0xff793B8E),
                                            fontSize: 13))
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.favorite,
                                        size: 20,
                                        color: newsModel.isFavorite== false
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      onPressed: () {
                                        _favoritController.toggleNewsFavourite(newsModel.newsId);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
}
