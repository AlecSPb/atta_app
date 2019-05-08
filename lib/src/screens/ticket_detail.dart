import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/controllers/FavoritController.dart';
import 'package:atta_mobile_app/src/controllers/OfferDetailController.dart';
import 'package:atta_mobile_app/src/data/models/OfferModel.dart';
import 'package:atta_mobile_app/src/data/models/ShopModel.dart';

import 'package:atta_mobile_app/src/widgets/layout.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketDetailScreen extends StatefulWidget {
  OfferModel offer;
  // ShopModel shop;

  TicketDetailScreen({this.offer});

  @protected
  @override
  createState() => TicketDetailView();
}

class TicketDetailView extends StateMVC<TicketDetailScreen> {
  TicketDetailView() : super(OfferDetailController()) {
    _offerDetailController = OfferDetailController.con;
  
  }

  FavoritController _favoritController = new FavoritController();

  OfferDetailController _offerDetailController;

 
 


 



 

  void initState() {
    super.initState();
    _offerDetailController.getTicketDetailImageSlider(widget.offer);
    _offerDetailController.getShopInfo(widget.offer.shopId);
  }

  // final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

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
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, right: 15, left: 15),
                        child: Text(widget.offer.descriptionAr != null
                            ? widget.offer.descriptionAr
                            : ""),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: <Widget>[],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(
                          "كوبون  قابل للاستعمال اكثر من ",
                          style: TextStyle(color: Colors.green),
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .35,
                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 5),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/imgs/sale.png'),
                                  Text(
                                    "الرجاء الضغط للحصول على الخصم",
                                    style: TextStyle(fontSize: 9),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {
                              return showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    bool _isLoading = false;
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              Stack(
                                                children: <Widget>[
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.4,
                                                  ),
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.13,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10.0)),
                                                        color:
                                                            Color(0xffFF4E00)),
                                                  ),
                                                  Center(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 90.0,
                                                          vertical: 90.0),
                                                      child: Text(
                                                        widget.offer.shop.contactEmail,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 180.0,
                                                    right: 95.0,
                                                    child: _isLoading
                                                        ? CircularProgressIndicator()
                                                        : FlatButton(
                                                            color: Color(
                                                                0xffFF4E00),
                                                            child: Text(
                                                              "تأكيد",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              setState(() {
                                                                _isLoading =
                                                                    true;
                                                              });

                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(25.0),
                                                        child: Text(
                                                          "رقم الكوبون",
                                                          style: TextStyle(
                                                              fontSize: 18.0,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    );
                                  });
                            },
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 6,
                          color: Color(0xffe8440c),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, right: 15, left: 15),
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/imgs/list_lows.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "قائمه الخدمات",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffe8440c)),
                      )
                    ],
                  ),
                ),
                widget.offer.offerItems != null
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: widget.offer.offerItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding:
                                  const EdgeInsets.only(right: 15.0, top: 5),
                              child: Table(
                                children: [
                                  TableRow(children: [
                                    TableCell(
                                      child: Text(
                                        widget.offer.offerItems[index].nameAr !=
                                                null
                                            ? widget
                                                .offer.offerItems[index].nameAr
                                            : "",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        "1000",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        "50",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    )
                                  ])
                                ],
                              ));
                        },
                      )
                    : SizedBox(
                        height: 5,
                      ),
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
                        "المميزات",
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
                  itemCount: widget.offer.offerItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0, top: 5),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/imgs/list_item.png'),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(
                              widget.offer.offerBenefits[index].descriptionAr,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, right: 15, left: 15),
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/imgs/list_lows.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "شروط و أحكام",
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
                  itemCount: widget.offer.offerTerms.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15.0, top: 5),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/imgs/list_item.png'),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(
                              widget.offer.offerTerms[index].descriptionAr,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
      endDrawer: MyDrawer(),
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

  Widget myAppBar(
    BuildContext context,
  ) {
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
                      Navigator.pop(context);
                    }),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "تفاصيل",
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
                Builder(
                  builder: (context) => IconButton(
                      icon: new Icon(
                        Icons.menu,
                        color: Color(0xffFF4E00),
                      ),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      }),
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
        images: _offerDetailController.sliderimages,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(seconds: 2),
      );

  Widget card(
    BuildContext context,
  ) =>
      Container(
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
                                width: MediaQuery.of(context).size.width * .25,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                        widget.offer.shop == null ||
                                                widget.offer.shop.nameAr == null
                                            ? ""
                                            : widget.offer.shop.nameAr,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffe8440c),
                                            fontSize: 11)),
                                    StarRating(
                                      size: MediaQuery.of(context).size.width *
                                          0.25 /
                                          7,
                                      rating: widget.offer.shop == null ||
                                              widget.offer.shop.shopRate == null
                                          ? 0.5
                                          : widget.offer.shop.shopRate,
                                      color: Colors.orange,
                                      borderColor: Colors.grey,
                                      starCount: 5,
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   width: MediaQuery.of(context).size.width * .10,
                              //   child: Column(
                              //     children: <Widget>[
                              //       Text(
                              //           widget.offer.discountAmount == null
                              //               ? ""
                              //               : "الخصم " +
                              //                   widget.offer.discountAmount +
                              //                   "%",
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //               color: Color(0xffe8440c),
                              //               fontSize: 12)),
                              //       Text(
                              //           widget.offer.shop == null ||
                              //                   widget.offer.shop.addressAr ==
                              //                       null
                              //               ? ""
                              //               : widget.offer.shop.addressAr,
                              //           style: TextStyle(
                              //               color: Colors.grey, fontSize: 12)),
                              //     ],
                              //   ),
                              // ),
                              IconButton(
                                icon: Icon(
                                  Icons.call,
                                  
                                   color: Colors.green,
                                ),
                                onPressed: () {
                                  _offerDetailController.launchURLPhone();
                                },
                              ),
                              Container(
                                width: 10,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  _offerDetailController.launchURLEmail();
                                },
                              ),
                              FlatButton(
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
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed("/BranchLocation");
                                },
                              ),
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
                                        widget.offer.shop == null ||
                                                widget.offer.shop.shopRate ==
                                                    null
                                            ? "0.5"
                                            : widget.offer.shop.shopRate
                                                .toString(),
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
                                    SizedBox(
                                      width: 5,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.favorite),
                                      iconSize: 20,
                                      color: Colors.grey,
                                      onPressed: () {
                                         _favoritController.toggleShopFavourite(widget.offer.shopId);
                                      },
                                    )
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
