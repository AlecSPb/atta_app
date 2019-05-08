import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/controllers/ContactUsController.dart';
import 'package:atta_mobile_app/src/widgets/Animation.dart';
import 'package:atta_mobile_app/src/widgets/SharedWidget.dart';
import 'package:atta_mobile_app/src/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ContactUsScreen extends StatefulWidget {
  @protected
  @override
  createState() => ContactUsView();
}

class ContactUsView extends StateMVC<ContactUsScreen> {
  ContactUsView() : super(ContactUsController()) {
    _contactUsController = ContactUsController.con;
  }
  ContactUsController _contactUsController;

  @override
  void initState() {
    _contactUsController.getContactInfo();
    super.initState();
  }

  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: scaffoldkey,
        endDrawer: MyDrawer(),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
                child: Center(
                    child: Column(
              children: <Widget>[
                topBar(context),
                _contactUsController.isloading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : FadeIn(1.5, aboutCard()),
                FadeIn(1.9, contactCard())
              ],
            )));
          },
        ));
  }

  Widget aboutCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/imgs/logo.png"),
                ),
              ),
              Text("عن",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text("تطبيق عطاء"),
              Divider(),
              Text("البريد الاكترونى",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text(_contactUsController.contactModel.email),
              Text("الهاتف",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text(_contactUsController.contactModel.telephone),
            ],
          ),
        ),
      ),
    );
  }

  Widget contactCard() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Column(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      maxLines: 2,
                      controller: _contactUsController.messageController,
                      decoration: InputDecoration(labelText: "اكتب رسالتك"),
                    ),
                  ),
                  SizedBox(height: 90.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: FlatButton(
                        onPressed: () async {
                          bool isSent =
                              await _contactUsController.sendContactMsg();
                          if (isSent) {
                            SharedWidget.showSnackBar(
                                this.scaffoldkey, "تم ارسال الرسالة بنجاح");
                            _contactUsController.messageController.clear();
                          } else {
                            SharedWidget.showSnackBar(
                                this.scaffoldkey, "حدث خطأ, حاول مرة اخرى");
                          }
                        },
                        child: Container(
                          child: Center(
                              child: Text(
                            "ارسال",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          )),
                          height: 65.0,
                          width: 65.0,
                          decoration: BoxDecoration(
                            color: Color(0xff793B8E), //0xff793B8E
                            borderRadius: BorderRadius.circular(45.0),
                          ),
                        )),
                  ),
                ],
              ))
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
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "عن",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xffFF4E00),
                        ),
                      ),
                      // Icon(Icons.chat_bubble_outline,color: Color(0xffFF4E00),size: 15,)
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
