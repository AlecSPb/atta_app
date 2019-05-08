// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) {
    final jsonData = json.decode(str);
    return RegisterModel.fromJson(jsonData);
}

String registerModelToJson(RegisterModel data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class RegisterModel {
    String username;

    RegisterModel({
        this.username,
    });

    factory RegisterModel.fromJson(Map<String, dynamic> json) => new RegisterModel(
        username: json["username"] == null ? null : json["username"],
    );

    Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
    };
}
