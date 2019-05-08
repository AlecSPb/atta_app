import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/widgets/layout.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class EventTeket extends StatefulWidget {
  @override
  _EventTeketState createState() => _EventTeketState();
}

class _EventTeketState extends State<EventTeket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            topBar(context),
            Container(
              height: 50,
            ),
            Center(
              child: Image.asset(
                "assets/imgs/reserve_done.png",
                height: 100,
                width: 100,
              ),
            ),
            Container(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 1.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/imgs/background.png"))),
              child: Column(
                children: <Widget>[
                  Center(
                      child: Text(
                    "تم ارسال نسخه الى بريدك الالكترونى",
                    style: TextStyle(
                        color: Colors.greenAccent[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 70, right: 16, left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 60,
                          height: 60,
                          child: QrImage(
                            data: "1234567890",
                            size: 70,
                          ),
                        ),
                        Text(
                          "Burger King",
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                        Image.asset(
                          "assets/imgs/twitter_icon.png",
                          height: 70,
                          width: 70,
                        ),
                      ],
                    ),
                  ),
                  Text(
                      "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 8,
                              right: 0,
                              child: Text(
                                "الاسم : منصور سليمان",
                                style: TextStyle(
                                    color: Colors.lightGreen, fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 33,
                              right: 0,
                              child: Text(
                                "عدد الاشخاص :  6",
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 73,
                              right: 0,
                              child: Text(
                                "e-Ticket",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 93,
                              right: 0,
                              child: Text(
                                "052018566",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 108,
                              right: 0,
                              child: Text(
                                "الفرع",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 133,
                              right: 0,
                              child: Text(
                                "03",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              left: 0,
                              child: Text(
                                " 123455666 ",
                                style: TextStyle(
                                    color: Colors.lightGreen, fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 33,
                              left: 0,
                              child: Text(
                                "مره واحده",
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 73,
                              left: 0,
                              child: Text(
                                "Reference",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 93,
                              left: 0,
                              child: Text(
                                "BF5757G",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 113,
                              left: 0,
                              child: Text(
                                "القسم",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 133,
                              left: 0,
                              child: Text(
                                "افراد",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 150,
                              right: 8,
                              child: Text(
                                "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 170,
                              right: 0,
                              child: Text(
                                "e-Ticket",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 190,
                              right: 0,
                              child: Text(
                                "052018566",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 210,
                              right: 0,
                              child: Text(
                                "الفرع",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 230,
                              right: 0,
                              child: Text(
                                "03",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 170,
                              left: 0,
                              child: Text(
                                "Refernce",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 190,
                              left: 0,
                              child: Text(
                                "BF5757G",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 210,
                              left: 0,
                              child: Text(
                                "القسم",
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                            ),
                            Positioned(
                              top: 230,
                              left: 0,
                              child: Text(
                                "افراد",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        ),
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
                      Navigator.pop(context);
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
}
