import 'dart:io';

import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/controllers/UserController.dart';
import 'package:atta_mobile_app/src/widgets/Animation.dart';
import 'package:atta_mobile_app/src/widgets/layout.dart';
import 'package:flutter/material.dart';

import 'package:mvc_pattern/mvc_pattern.dart';

class ProfileScreen extends StatefulWidget {
  @protected
  @override
  createState() => ProfileView();
}

class ProfileView extends StateMVC<ProfileScreen> {
  ProfileView() : super(UserController()) {
    _userController = UserController.con;
  }

  UserController _userController;

  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      endDrawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.save,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      body: Container(
        child: Center(
            child: Column(
          children: <Widget>[
            topBar(context),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: FadeIn(
                    2,
                    ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 100.0),
                          child: profileImage(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.person),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Text(_userController.model.userName == null ? "لا يوجد" : _userController.model.userName ,style: TextStyle(fontSize: 24),)
                              ),
                            ],
                          ),
                        ),

                                                Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.email),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Text(_userController.memperInfoModel.email == null ? "لا يوجد" : _userController.memperInfoModel.email ,style: TextStyle(fontSize: 24),)
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.phone),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Text(_userController.model.telephone == null ? "لا يوجد" : _userController.model.telephone ,style: TextStyle(fontSize: 24),)
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.code),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Text(_userController.model.studentCode == null ? "لا يوجد" : _userController.model.studentCode ,style: TextStyle(fontSize: 24),)
                              ),
                            ],
                          ),
                        ),


                      ],
                    )))
          ],
        )),
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
                        "الملف الشخصي",
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

  Widget profileImage() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 60,
          child: _userController.image != null
              ? Card(
                  shape: CircleBorder(),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      child: Image.file(_userController.image)))
              : Card(
                  shape: CircleBorder(),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      child: Image.asset(
                        'assets/imgs/2.jpg',
                        height: 300,
                      ))),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: RaisedButton(
            shape: CircleBorder(),
            child: Icon(Icons.edit),
            onPressed: () {
              _userController.getImage();
            },
          ),
        )
      ],
    );
  }
}
