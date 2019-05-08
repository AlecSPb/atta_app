import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/controllers/UserController.dart' ;
import 'package:atta_mobile_app/src/widgets/SharedWidget.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LoginScreen extends StatefulWidget {
  @protected
  @override
  createState() => LoginView();
}

class LoginView extends StateMVC<LoginScreen> {
 
LoginView():super(UserController())
{
  _userController = UserController.con;
}
 UserController _userController;

 
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        //backgroundColor: Color.fromRGBO(37, 97, 135, 1),
        
        key: TextFieldController.loginScaffoldkey,
        body: Container(
          decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/imgs/login_bg.png",),
            fit: BoxFit.cover,
          ),
        ),
          child: ListView(
            children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Form(
              key: TextFieldController.loginformKey,
              autovalidate: TextFieldController.loginAutoValid,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.07,
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                   Image.asset('assets/imgs/logo.png',height: 100,)
                 ],),
                 SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:10.0),
                    child: Text(
                      "مرحبا بعودتك",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:10.0),
                    child: SizedBox(
                      width: 50,
                      child: Divider(
                        color: Colors.white,
                        height: 15,
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 30.0),
                    child: TextFormField(
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                      maxLines: 1,
                      autofocus: true,
                      onSaved: (val){_userController.model.userName=val; },
                      // controller: txtUserName,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(
                            TextFieldController.focusPasswordField);
                      },
                      validator: (val) => _userController.model.validateEmail(val),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelStyle: new TextStyle(
                            color: Colors.white, fontSize: 20.0),
                        labelText: "اسم المستخدم",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 30.0),
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                      onSaved: (val){_userController.model.password=val; },
                      maxLines: 1,
                      focusNode: TextFieldController.focusPasswordField,
                      validator: (val)=> _userController.model.validatePassword(val),
                      textInputAction: TextInputAction.go,
                      onFieldSubmitted: (value) {
                        
                        _userController.signInWithEmailAndPassword(context);
                      },
                      decoration: InputDecoration(
                        labelStyle: new TextStyle(
                            color: Colors.white, fontSize: 20.0),
                        labelText: "الرقم السرى",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.only(
                            top: 8.0, bottom: 8.0, right: 40.0, left: 40.0),
                        shape: StadiumBorder(
                            side: BorderSide(color: Colors.white)),
                        child: Text(
                          "دخول",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color.fromRGBO(1, 114, 132, 1),
                        
                        onPressed: () {
                          _userController.signInWithEmailAndPassword(context);
                           
                         // Navigator.pushReplacementNamed(context, "/Home");
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.only(
                            top: 8.0, bottom: 8.0, right: 40, left: 40),
                        shape: StadiumBorder(),
                        child: Text(
                          "تسجيل",
                          style: TextStyle(color: Colors.blue),
                        ),
                        color: Colors.white,
                        onPressed: () {_userController.navigateToRegPage(context);},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     Text(
                  //       "التسجيل باستخدام",
                  //       style: TextStyle(color: Colors.black, fontSize: 15),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     SizedBox(
                  //       width: 50,
                  //       child: RaisedButton(
                  //         color: Colors.white,
                  //         padding: EdgeInsets.all(8),
                  //         shape: RoundedRectangleBorder(
                  //             side: BorderSide(color: Colors.grey),
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(8.0))),
                  //         child: Image.asset('assets/imgs/twitter_icon.png'),
                  //         onPressed: () {


                  //         },
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 8,
                  //     ),
                  //     SizedBox(
                  //       width: 50,
                  //       child: RaisedButton(
                  //         color: Colors.white,
                  //         child: Image.asset('assets/imgs/facebook_icon.png'),
                  //         shape: RoundedRectangleBorder(
                  //             side: BorderSide(color: Colors.grey),
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(8.0))),
                  //         onPressed: () {},
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 8,
                  //     ),
                  //     SizedBox(
                  //       width: 50,
                  //       child: RaisedButton(
                  //         color: Colors.white,
                  //         child: Image.asset('assets/imgs/google_icon.png'),
                  //         shape: RoundedRectangleBorder(
                  //             side: BorderSide(color: Colors.grey),
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(8.0))),
                  //         onPressed: () {},
                  //       ),
                  //     )
                  //   ],
                  // )
                
                ],
              ),
            ),
          ),
            ],
          ),
        )

        );
  }
}
