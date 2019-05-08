import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/controllers/EventController.dart';
import 'package:atta_mobile_app/src/controllers/FavoritController.dart';
import 'package:atta_mobile_app/src/controllers/OfferController.dart';
import 'package:atta_mobile_app/src/data/SharedPreference.dart';
import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/widgets/Animation.dart';
import 'package:atta_mobile_app/src/data/models/UserModel.dart';
import 'package:atta_mobile_app/src/data/services/MemperInfoService.dart';
import 'package:atta_mobile_app/src/widgets/EventCard.dart';
import 'package:atta_mobile_app/src/widgets/NewsCard.dart';
import 'package:atta_mobile_app/src/widgets/OfferCard.dart';
import 'package:atta_mobile_app/src/widgets/TicketCard.dart';
import 'package:atta_mobile_app/src/widgets/companyCard.dart';
import 'package:atta_mobile_app/src/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class FavoriteScreen extends StatefulWidget {
  @protected
  @override
  createState() => FavoriteView();
}

class FavoriteView extends StateMVC<FavoriteScreen> {
  FavoriteView() : super(FavoritController()) {
    _favoritController = FavoritController.con;
  }
  FavoritController _favoritController;

UserModel userModel ;

   @override
  void initState() {
    _favoritController.getFavoritEvents();
    _favoritController.getFavoritOffers();
    _favoritController.getFavoritNews();
    _favoritController.getFavoritShop();
MemperInfoService().getAllMemperInfo();
    SharedPreference.getUser().then((user){
setState(() {
        this.userModel = user;
        print("username is ${userModel.userName}");
      });
    },onError: (e){
      print("username token error $e");
    });
    super.initState();
  }

  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        endDrawer: MyDrawer(),
        body: Column(
        children: <Widget>[
            topBar(context),
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      constraints: BoxConstraints(maxHeight: 150.0),
                      child: Material(
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: TabBar(
                            isScrollable: false,
                            indicatorColor: Colors.red,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: [
                              Tab(
                                child: Text(
                                  "شركات ",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "كوبونات و عروض",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "اخبار ",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18),
                                ),
                              ),
                               Tab(
                                child: Text(
                                  "فعاليات",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          //tap 1

                          Container(
                            child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: _favoritController.shop.length,
                              itemBuilder: (context, index) {
                                // if (index == 1)
                                //   return TicketCard();
                                // else if (index == 2)
                                //   return EventCard();
                                // else if (index == 4)
                                return FadeIn(
                                    index.toDouble() * 1.3,
                                    CompanyCard(
                                      shopModel:
                                          _favoritController.shop[index],
                                    ));
                                // else
                                //   return OfferCard();
                              },
                            ),
                          ),

                          //////

                          //tap 2

                          Container(
                            child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: _favoritController.offers.length,
                              itemBuilder: (context, index) {
                                // if (index == 1)
                                //   return TicketCard();
                                // else if (index == 2)
                                //   return EventCard();
                                // else if (index == 4)
                                return FadeIn(
                                    index.toDouble() * 1.0,
                                    OfferCard(
                                      offerModel:
                                          _favoritController.offers[index],
                                    ));
                                // else
                                //   return OfferCard();
                              },
                            ),
                          ),

                          ////////////////////////////////
                          //tap 3

                          Container(
                            child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: _favoritController.news.length,
                              itemBuilder: (context, index) {
                                // if (index == 1)
                                //   return TicketCard();
                                // else if (index == 2)
                                //   return EventCard();
                                // else if (index == 4)
                                return FadeIn(
                                    index.toDouble() * 1.3,
                                    NewsCard(
                                        newsModel:
                                            _favoritController.news[index]));
                                // else
                                //   return OfferCard();
                              },
                            ),
                          ),

                          ///////////////////
                          // tap 4 ///////////

                           Container(
                            child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: _favoritController.events.length,
                              itemBuilder: (context, index) {
                                // if (index == 1)
                                //   return TicketCard();
                                // else if (index == 2)
                                //   return EventCard();
                                // else if (index == 4)
                                return FadeIn(
                                    index.toDouble() * 1.0,
                                    EventCard(
                                        eventModel:
                                            _favoritController.events[index]));
                                // else
                                //   return OfferCard();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new IconButton(
                    icon: new Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xffFF4E00),
                    ),
                    onPressed: () {
                       Navigator.pushReplacementNamed(context, "/Home");
                    }),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "المفضلات",
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
                new IconButton(
                    icon: new Icon(
                      Icons.menu,
                      color: Color(0xffFF4E00),
                    ),
                    onPressed: () {
                      scaffoldkey.currentState.openEndDrawer();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
