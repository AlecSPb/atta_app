import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/controllers/LayoutController.dart';
import 'package:atta_mobile_app/src/controllers/OfferController.dart';
import 'package:atta_mobile_app/src/widgets/Animation.dart';
import 'package:atta_mobile_app/src/widgets/OfferCard.dart';
import 'package:atta_mobile_app/src/widgets/SharedWidget.dart';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class OfferScreen extends StatefulWidget {
  @protected
  @override
  createState() => OfferView();
}

class OfferView extends StateMVC<OfferScreen> {
  OfferView() : super(OfferController()) {
    _offerController = OfferController.con;
  }
  OfferController _offerController;
  LayoutController _layoutController = LayoutController();

  @override
  void initState() {
    _offerController.getAllOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _offerController.isloading
          ? SharedWidget.loading(context)
          : Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    topBar(context),
                    _offerController.allOffer.length == 0
                        ? Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .3),
                            child: Text(
                              "لا يوجد عروض",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 40),
                            ))
                        : Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.only(top: 5),
                              itemCount: _offerController.allOffer.length,
                              itemBuilder: (context, index) {
                                return FadeIn(
                                    index.toDouble()*1.3,
                                    OfferCard(
                                        offerModel:
                                            _offerController.allOffer[index]));
                              },
                            ),
                          )
                  ],
                ),
              ),
            ),
    );
  }

  Widget topBar(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      color: Colors.white,
      elevation: 2,
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
                      _layoutController.setCurrentTab(0);
                    }),
                Text(
                  "العروض",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0xffFF4E00),
                  ),
                ),
                new IconButton(
                    icon: new Icon(
                      Icons.menu,
                      color: Color(0xffFF4E00),
                    ),
                    onPressed: () {
                      TextFieldController.layoutScaffoldkey.currentState
                          .openEndDrawer();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
