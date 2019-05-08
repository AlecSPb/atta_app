import 'package:atta_mobile_app/src/TextFiledController.dart';

class UserModel {
  int id ;
  String email;
  String password;
  String retypePassword;
  String userName;
  String studentCode;
  String telephone;
  String nameEn;
  String token ;


   UserModel({this.id , this.email , this.password , this.retypePassword , this.userName ,
  this.studentCode , this.telephone , this.nameEn , this.token});



factory UserModel.fromJson(Map<String , dynamic> json){
  return UserModel(
id: json["id"],
email: json["email"],
password: json["password"],
userName: json["userName"],
studentCode: json["studentCode"],
telephone: json["telephone"],
nameEn: json["nameEn"],
token: json["token"],
  );
}
 set _id(int val) => id = val;
  set _email(String val) => email = val;
  set _password(String val) => password = val;
  set _studentCode(String val) => studentCode = val;
  set _userName(String val) => userName = val;
  set _phone(String val) => telephone = val;
  set _retypePassword(String val) => retypePassword = val;
  set _nameEn(String val) => nameEn = val;
int get _id => id;
  String get _email => email;
  String get _password => password;
  String get _studentCode => studentCode;
  String get _userName => userName;
  String get _phone => telephone;
  String get _nameEn => nameEn;

  Map<String, dynamic> toJson() => {
    "id" : id ,
        "userName": userName,
        "password": password,
        "email": email,
        "nameEn": nameEn,
        "telephone": telephone
      };

  String validateUserName(String val) {
    if (val.trim().isEmpty) {
      return "من فضلك ادخل اسم المستحدم";
    } else
      return null;
  }

  String validatePhone(String val) {
    if (val.trim().isEmpty) {
      return "من فضلك ادخل رقم الهاتف";
    } else
      return null;
  }

  String validateEmail(String val) {
    if (val.isEmpty)
      return "ادخل البريد الالكترونى";
    else {
      final _emailRegExpString = r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
          r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';
      if (!RegExp(_emailRegExpString, caseSensitive: false).hasMatch(val)) {
        return "البريد الاكترونى غير صالح";
      } else
        return null;
    }
  }

  String validatePassword(String val) {
    if (val.trim().isEmpty)
      return "من فضلك ادخل الرقم السرى";
    else if (val.length < 6) {
      return "الرقم السرى اقل من 6";
    } else
      return null;
  }

  String validateStudentCode(String val) {
    if (val.trim().isEmpty)
      return "من فضلك ادخل كود الطالب";
    else
      return null;
  }

  String validateConfirmPassword(String val) {
    if (val.trim().isEmpty)
      return "من فضلك ادخل الرقم السرى";
    else if (val != TextFieldController.passwordController.text) {
      return "الرقم السرى غير مطابق";
    } else
      return null;
  }
}


