// To parse this JSON data, do
//
//     final memperInfoModel = memperInfoModelFromJson(jsonString);

import 'dart:convert';

MemperInfoModel memperInfoModelFromJson(String str) {
    final jsonData = json.decode(str);
    return MemperInfoModel.fromJson(jsonData);
}

String memperInfoModelToJson(MemperInfoModel data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class MemperInfoModel {
    int memberId;
    String nameAr;
    String nameEn;
    String email;
    String telephone;


    MemperInfoModel({
        this.memberId,
        this.nameAr,
        this.nameEn,
        this.email,
        this.telephone,
      
    });

    factory MemperInfoModel.fromJson(Map<String, dynamic> json) => new MemperInfoModel(
        memberId: json["memberId"] == null ? null : json["memberId"],
        nameAr: json["nameAr"],
        nameEn: json["nameEn"],
        email: json["email"] == null ? null : json["email"],
        telephone: json["telephone"],
       
    );

    Map<String, dynamic> toJson() => {
        "memberId": memberId == null ? null : memberId,
        "nameAr": nameAr,
        "nameEn": nameEn,
        "email": email == null ? null : email,
        "telephone": telephone,
       
    };
}
