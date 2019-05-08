import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/controllers/EventController.dart';
import 'package:atta_mobile_app/src/widgets/Animation.dart';
import 'package:atta_mobile_app/src/widgets/EventCard.dart';
import 'package:atta_mobile_app/src/widgets/SharedWidget.dart';
import 'package:atta_mobile_app/src/widgets/layout.dart';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class EventScreen extends StatefulWidget {
  @protected
  @override
  createState() => EventView();
}

class EventView extends StateMVC<EventScreen> {
  EventView() : super(EventController()) {
    _eventController = EventController.con;
  }
  EventController _eventController;

  @override
  void initState() {
    _eventController.getAllEvent();
    
    super.initState();
  }

  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldkey,
      endDrawer: MyDrawer(),
      body: _eventController.isLoading
          ? SharedWidget.loading(context)
          : Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    topBar(context),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: _eventController.events.length,
                        itemBuilder: (context, index) {
                          return FadeIn(index.toDouble()*1.3,EventCard(
                            eventModel: _eventController.events[index],
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
                        "فعاليات",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xffFF4E00),
                        ),
                      ),
                      Icon(
                        Icons.date_range,
                        color: Color(0xffFF4E00),
                        size: 15,
                      )
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
