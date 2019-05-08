
import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/screens/Offer_screen.dart';
import 'package:atta_mobile_app/src/screens/home_screen.dart';
import 'package:atta_mobile_app/src/screens/ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LayoutController extends ControllerMVC {
  //to make single instance of class
  factory LayoutController() {
    if (_this == null) _this = LayoutController._();
    return _this;
  }
  static LayoutController _this;

  LayoutController._();

  static LayoutController get con => _this;

  int currentTab = 0;
 

  List<Widget> screens = <Widget>[
    HomeScreen(),
    TicketScreen(),
    OfferScreen(), 
  ];

  void setCurrentTab(int index){
    currentTab=index;
   
    refresh();
  }

}