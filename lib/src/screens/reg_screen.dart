import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/controllers/UserController.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class RegScreen extends StatefulWidget {
   @protected
  @override
  createState() => RegView();
  
}

class RegView extends StateMVC<RegScreen>{
  
RegView():super(UserController())
{
  _userController = UserController.con;
}

 UserController _userController;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: TextFieldController.regScaffoldkey,
      backgroundColor: Color.fromRGBO(1, 114, 132,1),
     
      body:Column(
        children: <Widget>[
          topBar(context),
          Expanded(
                      child: ListView(
              children: <Widget>[
                 Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Form(
                       key: TextFieldController.regformKey,
                       autovalidate: TextFieldController.regAutoValid,
                       child: Column(
                         children: <Widget>[
                            SizedBox(
                            height: 0,
                          ),
                           Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 30.0),
                            child: TextFormField(
                              style: TextStyle(fontSize: 16.0, color: Colors.white),
                              maxLines: 1,
                              autofocus: true,
                              
                              onSaved: (val){_userController.model.nameEn=val; },
                              // controller: txtUserName,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(
                                    TextFieldController.focusPhoneField);
                              },
                              validator: (val) => _userController.model.validateUserName(val),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelStyle: new TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                                labelText: "اسم ",
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 30.0),
                            child: TextFormField(
                              style: TextStyle(fontSize: 16.0, color: Colors.white),
                              maxLines: 1,
                            
                              onSaved: (val){_userController.model.telephone=val; },
                              // controller: txtUserName,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(
                                    TextFieldController.focusCodeField);
                              },
                                focusNode: TextFieldController.focusPhoneField,
                              validator: (val) => _userController.model.validatePhone(val),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelStyle: new TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                                labelText: "رقم الهاتف",
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 30.0),
                            child: TextFormField(
                              style: TextStyle(fontSize: 16.0, color: Colors.white),
                              maxLines: 1,
                              
                              onSaved: (val){_userController.model.studentCode=val; },
                              // controller: txtUserName,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(
                                    TextFieldController.focusEmailField);
                              },
                                focusNode: TextFieldController.focusCodeField,
                              validator: (val) => _userController.model.validateStudentCode(val),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelStyle: new TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                                labelText: "كود الطالب",
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 30.0),
                            child: TextFormField(
                              style: TextStyle(fontSize: 16.0, color: Colors.white),
                              maxLines: 1,
                              
                              focusNode: TextFieldController.focusEmailField,
                              onSaved: (val){
                                _userController.model.email=val;
                                 _userController.model.userName=val;
                                 },
                              // controller: txtUserName,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(
                                    TextFieldController.focusRegPasswordField);
                              },
                              validator: (val) => _userController.model.validateEmail(val),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelStyle: new TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                                labelText: "البريد الاكترونى",
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
                              controller: TextFieldController.passwordController,
                              focusNode: TextFieldController.focusRegPasswordField,
                               onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(
                                    TextFieldController.focusRetypePasswordField);
                              },
                              validator: (val) => _userController.model.validatePassword(val),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelStyle: new TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                                labelText: "الرقم السرى",
                              ),
                            ),
                          ),
                           Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 30.0),
                            child: TextFormField(
                              obscureText: true,
                              style: TextStyle(fontSize: 16.0, color: Colors.white),
                             
                              maxLines: 1,
                              focusNode: TextFieldController.focusRetypePasswordField,
                              validator: (val) =>_userController.model.validateConfirmPassword(val),
                              textInputAction: TextInputAction.go,
                              onFieldSubmitted: (value) {
                                
                                _userController.regNewUser(context);
                              },
                              decoration: InputDecoration(
                                labelStyle: new TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                                labelText: "تاكيد الرقم السرى",
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                padding: EdgeInsets.only(
                                    top: 8.0, bottom: 8.0, right: 40, left: 40),
                                shape: StadiumBorder(),
                                child: Text(
                                  "تسجيل",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                color: Colors.white,
                                onPressed: () {_userController.regNewUser(context);},
                              ),
                            ],
                          )
                         ],
                       ),
                    ),
                 )
              ],
            ),
          ),
        ],
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
          padding: const EdgeInsets.all(16.0),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  new IconButton(
                    icon: new Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xffFF4E00),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                    SizedBox(
                      width:MediaQuery.of(context).size.width*0.2,
                    ),
                Text(
                  "تسجيل جديد",
                  style: TextStyle(
                    color: Color(0xff793B8E),
                  ),
                ),
               
              ],
            )
          ],
        ),
      ),
    );
  }


}