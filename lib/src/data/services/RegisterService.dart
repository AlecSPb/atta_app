import 'dart:convert';

import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/models/RegisterModel.dart';
import 'package:atta_mobile_app/src/data/repository/RegisterRepository.dart';
import 'package:http/http.dart' as http;

class RegisterService extends RegisterRepository{
  @override
  Future<List<RegisterModel>> getAllRegister(String username , String email ,
   String telephone , String studenCode , 
   String password ) async {
     return await http
        .post(TextFieldController.apiUrl + "auth/register",
        body: {"usename": username, "email": email ,
         "telephone": telephone , "studentCode": studenCode ,
          "password" : password },
            headers: {
              'Authorization': 'bearer ${TextFieldController.token}'
            },
            )
        .then((response) {
      if (response.statusCode == 200) {
       var jsonValue = json.decode(response.body);
       print("register body${jsonValue}");
       return (jsonValue as List).map((f) => new RegisterModel.fromJson(f)).toList();
      } else{
 print("register error${response.body}");
        return  List<RegisterModel>();
      }
        
    });
  }

}