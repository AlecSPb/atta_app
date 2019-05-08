import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/controllers/LayoutController.dart';
import 'package:atta_mobile_app/src/data/SharedPreference.dart';
import 'package:atta_mobile_app/src/screens/Offer_screen.dart';
import 'package:atta_mobile_app/src/screens/branch_location.dart';
import 'package:atta_mobile_app/src/screens/company_detail.dart';
import 'package:atta_mobile_app/src/screens/contactUs_screen.dart';
import 'package:atta_mobile_app/src/screens/event_screen.dart';
import 'package:atta_mobile_app/src/screens/favorite_screen.dart';
import 'package:atta_mobile_app/src/screens/home_screen.dart';
import 'package:atta_mobile_app/src/screens/news_screen.dart';
import 'package:atta_mobile_app/src/screens/ticket_detail.dart';
import 'package:atta_mobile_app/src/screens/ticket_screen.dart';
import 'package:atta_mobile_app/src/widgets/BottomNavigationItem.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LayoutScreen extends StatefulWidget {
  @protected
  @override
  createState() => LayoutView();
}

class LayoutView extends StateMVC<LayoutScreen> {
  BottomNavigationItem bottomNavigationItem = BottomNavigationItem();

  LayoutView() : super(LayoutController()) {
    _layoutController = LayoutController.con;
  }
  LayoutController _layoutController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: TextFieldController.layoutScaffoldkey,
      endDrawer: MyDrawer(),
      body: _layoutController.screens[_layoutController.currentTab],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _layoutController.currentTab,
          onTap: (index) {
            if (index == 1) {
              TextFieldController.categoryID = 0;
              TextFieldController.appBar = "كوبونات";
            }
            _layoutController.setCurrentTab(index);
          },
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            bottomNavigationItem.buildBottomNavigationBarItem(
                "assets/imgs/home.png", "الرئسيه"),
            // bottomNavigationItem.buildBottomNavigationBarItem(
            //     "assets/imgs/search.png", "البحث"),
            bottomNavigationItem.buildBottomNavigationBarItem(
                "assets/imgs/discount.png", "كوبونات"),
            bottomNavigationItem.buildBottomNavigationBarItem(
                "assets/imgs/tag.png", "عروض")
          ]),
    );
  }

  Widget appDrawer() => Drawer();
}

class MyDrawer extends StatelessWidget {
  final GlobalKey<NavigatorState> navigator;

  const MyDrawer({Key key, this.navigator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('[DEBUG] MyDrawer build');
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50.0),
        bottomRight: Radius.circular(50.0),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Drawer(
          elevation: 5.0,
          child: Directionality(
              textDirection: TextDirection.ltr,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, "/Profile");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 25.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        child: Container(
                                            width: 75.0,
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                      "assets/imgs/2.jpg",
                                                    )))),
                                        //Image.network('https://cdn.pixabay.com/photo/2018/02/09/21/46/rose-3142529__340.jpg',height: 80)
                                      ),
                                      Text(
                                        'Mansour Soliman',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23.0,
                                        ),
                                      ),
                                      Text(
                                        '@mansoursoliman',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 17.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text("الرئيسيه",
                                      style: TextStyle(color: Colors.white)),
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, "/Home");
                                  },
                                  leading: Icon(
                                    EvaIcons.homeOutline,
                                    color: Colors.white,
                                  ),
                                ),
                                ListTile(
                                  title: Text("المفضل",
                                      style: TextStyle(color: Colors.white)),
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, "/Favorite");
                                  },
                                  leading: Icon(EvaIcons.heartOutline,
                                      color: Colors.white),
                                ),
                                ListTile(
                                    title: Text("اخبار",
                                        style: TextStyle(color: Colors.white)),
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, "/News");
                                    },
                                    leading: Icon(Icons.chat_bubble_outline,
                                        color: Colors.white)),
                                ListTile(
                                  title: Text("فعاليات",
                                      style: TextStyle(color: Colors.white)),
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, "/Event");
                                  },
                                  leading: Icon(EvaIcons.calendarOutline,
                                      color: Colors.white),
                                ),
                                ListTile(
                                  title: Text("تواصل معنا",
                                      style: TextStyle(color: Colors.white)),
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, "/About");
                                  },
                                  leading: Icon(EvaIcons.personOutline,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                ListTile(
                                  title: Text("تسجيل خروج",
                                      style: TextStyle(
                                          color:
                                              Colors.white.withOpacity(0.6))),
                                  onTap: () {
                                    SharedPreference.removeUserToken();
                                    Navigator.pushReplacementNamed(
                                        context, "/Splash");
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(0, 104, 123, 1)))
                ],
              )),
        ),
      ),
    );
  }
}
