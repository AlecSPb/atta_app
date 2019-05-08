import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/models/NewsModel.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class NewsDetailScreen extends StatefulWidget {
  
  NewsModel newsModel;
  NewsDetailScreen({
    this.newsModel
  });
  @protected
  @override
  createState() => NewsDetailView();
}

class NewsDetailView extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Column(
        children: <Widget>[
          topBar(context),
          Expanded(
                      child: ListView(
              children: <Widget>[
                
                card(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.date_range,color: Colors.grey,size: 18,),
                                        Text(widget.newsModel.formatedEventDate!=null?widget.newsModel.formatedEventDate:"",
                                            style: TextStyle(color: Color(0xff793B8E),fontSize: 11)),
                                            SizedBox(width: 10,)

                  ],
                ),
                  Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 5.0, right: 15, left: 15),
                        child: Text(
                            widget.newsModel.titleAr!=null?widget.newsModel.titleAr:"",style: TextStyle(color: Color(0xffe8440c),fontWeight: FontWeight.bold,fontSize: 19),),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 5.0, right: 15, left: 15),
                        child: Text(
                            widget.newsModel.descriptionAr!=null?widget.newsModel.descriptionAr:""
                            ),
                      ),
                    )
                  ],
                ),
              
             SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topBar(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      color: Colors.white,
      elevation: 3,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, left: 5, right: 5, bottom: 20),
          child: Column(
            children: <Widget>[myAppBar(context)],
          )),
    );
  }

  Widget myAppBar(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 2),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new IconButton(
                    icon: new Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xffFF4E00),
                    ),
                    onPressed: () {
                       Navigator.of(context).pop();
                    }),
                    SizedBox(width: MediaQuery.of(context).size.width*.23),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        " تفاصيل الخبر",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xffFF4E00),
                        ),
                      ),
                      //Icon(Icons.chat_bubble_outline,color: Color(0xffFF4E00),size: 15,)
                    ],
                  ),
                ),
               
              ],
            )
          ],
        ),
      ),
    );
  }

Widget carousel() => new Carousel(
        boxFit: BoxFit.cover,
        showIndicator: false,
        images: [
          new Image.asset('assets/imgs/1.jpeg'),
          new Image.asset('assets/imgs/2.jpg'),
          new Image.asset('assets/imgs/3.jpg'),
        ],
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(seconds: 2),
      );
      
  Widget card(BuildContext context) => Container(
        padding: EdgeInsets.all(8),
        //height: 250,
        child: Card(
          color: Colors.white70,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            children: <Widget>[
              Container(
                  height: 150,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                       Radius.circular(8.0)
                      ),
                      child: //carousel(),
                      widget.newsModel.imagePath!=null?Image.network(widget.newsModel.imagePath):
                      Image.asset(
                        'assets/imgs/2.jpg',
                        fit: BoxFit.fitWidth,
                        width: MediaQuery.of(context).size.width,
                      )
                      )),
              
            ],
          ),
        ),
      );
}
