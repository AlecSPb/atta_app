import 'package:atta_mobile_app/src/widgets/TicketCard.dart';
import 'package:atta_mobile_app/src/widgets/layout.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class CompanyDetailScreen extends StatefulWidget {
  @protected
  @override
  createState() => CompanyDetailView();
}

class CompanyDetailView extends State<CompanyDetailScreen> {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      endDrawer: MyDrawer(),
      body: ListView(
        children: <Widget>[
          topBar(context),
          card(context),
          SizedBox(
            height: 15,
          ),
           Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 15, left: 15),
            child: Row(
              children: <Widget>[
                Image.asset('assets/imgs/list_advantage.png'),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "عروض الشركه",
                  style: TextStyle(
                     fontWeight: FontWeight.bold,
                       color: Color(0xffe8440c)),
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return TicketCard();
            },
          )
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new IconButton(
                    icon: new Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xffFF4E00),
                    ),
                    onPressed: () {}),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "تفاصيل الشركه",
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

  Widget carousel() => new Carousel(
        boxFit: BoxFit.cover,
        showIndicator: false,
        images: [
          new AssetImage('assets/imgs/1.jpeg'),
          new AssetImage('assets/imgs/2.jpg'),
          new AssetImage('assets/imgs/3.jpg'),
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
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: carousel(),
                    // Image.asset(
                    //   'assets/imgs/2.jpg',
                    //   fit: BoxFit.fitWidth,
                    //   width: MediaQuery.of(context).size.width,
                    // )
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0, left: 8, right: 8, bottom: 8),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                // width: MediaQuery.of(context).size.width * .7,
                                child: Column(
                                  children: <Widget>[
                                    Text("Company Name ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffe8440c))),
                                    StarRating(
                                      size: MediaQuery.of(context).size.width *
                                          0.25 /
                                          7,
                                      rating: 3.5,
                                      color: Colors.orange,
                                      borderColor: Colors.grey,
                                      starCount: 5,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/imgs/location-pin.png',
                                      height: 26.0,
                                    ),
                                    Text("الفروع المتاحه",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12))
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, right: 15, left: 15),
                                  child: Text("Company Full Description."),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Card(
                                shape: StadiumBorder(),
                                color: Color(0xff5ec80e),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 5.0, left: 5.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "4.8",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 270,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.share,
                                      color: Colors.grey,
                                      size: 20,
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
