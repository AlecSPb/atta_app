import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/controllers/CoponController.dart';
import 'package:atta_mobile_app/src/controllers/LayoutController.dart';
import 'package:atta_mobile_app/src/controllers/OfferController.dart';
import 'package:atta_mobile_app/src/widgets/Animation.dart';
import 'package:atta_mobile_app/src/widgets/NewsCard.dart';
import 'package:atta_mobile_app/src/widgets/SharedWidget.dart';
import 'package:atta_mobile_app/src/widgets/TicketCard.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class TicketScreen extends StatefulWidget {
  // int categoryID = 0;
  // String appBar  = "";

  // TicketScreen(
  //  int categoryID ,
  //   String appBar
  // ){
  //   this.categoryID=categoryID;
  //   this.appBar=appBar;
  // }

  @protected
  @override
  createState() => TicketView();
}

class TicketView extends StateMVC<TicketScreen> {
  double anim = 1.0;

  TicketView() : super(CoponController()) {
    _coponController = CoponController.con;
  }

  CoponController _coponController;
  LayoutController _layoutController = LayoutController();

  @override
  void initState() {
    if (TextFieldController.categoryID == 0) {
      _coponController.getAllCopons();
    } else {
      _coponController.getCoponsByCategory(TextFieldController.categoryID);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _coponController.isloading
          ? SharedWidget.loading(context)
          : Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    topBar(context),
                    searchCard(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _coponController.copons.length,
                        itemBuilder: (context, index) {
                          return FadeIn(
                              index.toDouble() * 1.0,
                              TicketCard(
                                offerModel: _coponController.copons[index],
                              ));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Widget searchCard() => Padding(
      padding:
          const EdgeInsets.only(top: 5, left: 8.0, right: 8.0, bottom: 0.0),
      child: Container(
        child: Card(
          color: Color(0xffF1F2F3),
          elevation: 1.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.search,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "بحث"),
                    onChanged: (value) =>
                        _coponController.searchCopons(value),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));

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
                      _layoutController.setCurrentTab(0);
                    }),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        TextFieldController.appBar,
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
