// To parse this JSON data, do
//
//     final shopBranchModel = shopBranchModelFromJson(jsonString);

import 'dart:convert';

ShopBranchModel shopBranchModelFromJson(String str) =>
    ShopBranchModel.fromJson(json.decode(str));

String shopBranchModelToJson(ShopBranchModel data) =>
    json.encode(data.toJson());

class ShopBranchModel {
  int shopBranchId;
  String nameAr;
  String nameEn;
  String descriptionAr;
  String descriptionEn;
  String profilePic;
  String long;
  String lat;
  bool isMainBranch;
  String contactTele;
  String contactEmail;
  int shopId;
  String userId;
  String openingHoursFrom;
  String openingHoursTo;
  bool is24Hours;
  String addressAr;
  String addressEn;
  String streetSignsAr;
  String streetSignsEn;
  dynamic shop;
  dynamic user;
  List<dynamic> shopPics;
  bool isDeleted;
  String createdDate;
  String modifiedDate;
  String createdByNameId;
  String modifiedByNameId;
  String createdByName;
  String modifiedByName;

  ShopBranchModel({
    this.shopBranchId,
    this.nameAr,
    this.nameEn,
    this.descriptionAr,
    this.descriptionEn,
    this.profilePic,
    this.long,
    this.lat,
    this.isMainBranch,
    this.contactTele,
    this.contactEmail,
    this.shopId,
    this.userId,
    this.openingHoursFrom,
    this.openingHoursTo,
    this.is24Hours,
    this.addressAr,
    this.addressEn,
    this.streetSignsAr,
    this.streetSignsEn,
    this.shop,
    this.user,
    this.shopPics,
    this.isDeleted,
    this.createdDate,
    this.modifiedDate,
    this.createdByNameId,
    this.modifiedByNameId,
    this.createdByName,
    this.modifiedByName,
  });

  factory ShopBranchModel.fromJson(Map<String, dynamic> json) =>
      new ShopBranchModel(
        shopBranchId:
            json["shopBranchId"] == null ? null : json["shopBranchId"],
        nameAr: json["nameAr"] == null ? null : json["nameAr"],
        nameEn: json["nameEn"] == null ? null : json["nameEn"],
        descriptionAr:
            json["descriptionAr"] == null ? null : json["descriptionAr"],
        descriptionEn:
            json["descriptionEn"] == null ? null : json["descriptionEn"],
        profilePic: json["profilePic"] == null ? null : json["profilePic"],
        long: json["long"] == null ? null : json["long"],
        lat: json["lat"] == null ? null : json["lat"],
        isMainBranch:
            json["isMainBranch"] == null ? null : json["isMainBranch"],
        contactTele: json["contactTele"] == null ? null : json["contactTele"],
        contactEmail:
            json["contactEmail"] == null ? null : json["contactEmail"],
        shopId: json["shopId"] == null ? null : json["shopId"],
        userId: json["userId"] == null ? null : json["userId"],
        openingHoursFrom:
            json["openingHoursFrom"] == null ? null : json["openingHoursFrom"],
        openingHoursTo:
            json["openingHoursTo"] == null ? null : json["openingHoursTo"],
        is24Hours: json["is24Hours"] == null ? null : json["is24Hours"],
        addressAr: json["addressAr"] == null ? null : json["addressAr"],
        addressEn: json["addressEn"] == null ? null : json["addressEn"],
        streetSignsAr:
            json["streetSignsAr"] == null ? null : json["streetSignsAr"],
        streetSignsEn:
            json["streetSignsEn"] == null ? null : json["streetSignsEn"],
        shop: json["shop"],
        user: json["user"],
        shopPics: json["shopPics"] == null
            ? null
            : new List<dynamic>.from(json["shopPics"].map((x) => x)),
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        createdDate: json["createdDate"] == null ? null : json["createdDate"],
        modifiedDate:
            json["modifiedDate"] == null ? null : json["modifiedDate"],
        createdByNameId:
            json["createdByNameId"] == null ? null : json["createdByNameId"],
        modifiedByNameId:
            json["modifiedByNameId"] == null ? null : json["modifiedByNameId"],
        createdByName:
            json["createdByName"] == null ? null : json["createdByName"],
        modifiedByName:
            json["modifiedByName"] == null ? null : json["modifiedByName"],
      );

  Map<String, dynamic> toJson() => {
        "shopBranchId": shopBranchId == null ? null : shopBranchId,
        "nameAr": nameAr == null ? null : nameAr,
        "nameEn": nameEn == null ? null : nameEn,
        "descriptionAr": descriptionAr == null ? null : descriptionAr,
        "descriptionEn": descriptionEn == null ? null : descriptionEn,
        "profilePic": profilePic == null ? null : profilePic,
        "long": long == null ? null : long,
        "lat": lat == null ? null : lat,
        "isMainBranch": isMainBranch == null ? null : isMainBranch,
        "contactTele": contactTele == null ? null : contactTele,
        "contactEmail": contactEmail == null ? null : contactEmail,
        "shopId": shopId == null ? null : shopId,
        "userId": userId == null ? null : userId,
        "openingHoursFrom": openingHoursFrom == null ? null : openingHoursFrom,
        "openingHoursTo": openingHoursTo == null ? null : openingHoursTo,
        "is24Hours": is24Hours == null ? null : is24Hours,
        "addressAr": addressAr == null ? null : addressAr,
        "addressEn": addressEn == null ? null : addressEn,
        "streetSignsAr": streetSignsAr == null ? null : streetSignsAr,
        "streetSignsEn": streetSignsEn == null ? null : streetSignsEn,
        "shop": shop,
        "user": user,
        "shopPics": shopPics == null
            ? null
            : new List<dynamic>.from(shopPics.map((x) => x)),
        "isDeleted": isDeleted == null ? null : isDeleted,
        "createdDate": createdDate == null ? null : createdDate,
        "modifiedDate": modifiedDate == null ? null : modifiedDate,
        "createdByNameId": createdByNameId == null ? null : createdByNameId,
        "modifiedByNameId": modifiedByNameId == null ? null : modifiedByNameId,
        "createdByName": createdByName == null ? null : createdByName,
        "modifiedByName": modifiedByName == null ? null : modifiedByName,
      };
}
