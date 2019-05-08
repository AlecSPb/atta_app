// To parse this JSON data, do
//
//     final shopModel = shopModelFromJson(jsonString);

import 'dart:convert';

import 'package:atta_mobile_app/src/data/models/ShopBranchModel.dart';

List<ShopModel> shopModelFromJson(String str) => new List<ShopModel>.from(json.decode(str).map((x) => ShopModel.fromJson(x)));

String shopModelToJson(List<ShopModel> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class ShopModel {
    int shopId;
    String nameAr;
    String nameEn;
    bool isActive;
    String contactEmail;
    String contactTele;
    String profilPic;
    String logoPic;
    String descriptionAr;
    String descriptionEn;
    int categoryId;
    String userId;
    String openingHoursFrom;
    String openingHoursTo;
    bool is24Hours;
    String addressAr;
    String addressEn;
    dynamic category;
    double shopRate;
    bool isFavorite;
    dynamic user;
    List<dynamic> favoriteShops;
    List<dynamic> offers;
    List<ShopBranchModel> shopBranches;
    List<dynamic> shopPics;
    List<dynamic> shopRates;
    bool isDeleted;
    String createdDate;
    String modifiedDate;
    String createdByNameId;
    String modifiedByNameId;
    String createdByName;
    String modifiedByName;

    ShopModel({
        this.shopId,
        this.nameAr,
        this.nameEn,
        this.isActive,
        this.contactEmail,
        this.contactTele,
        this.profilPic,
        this.logoPic,
        this.descriptionAr,
        this.descriptionEn,
        this.categoryId,
        this.userId,
        this.openingHoursFrom,
        this.openingHoursTo,
        this.is24Hours,
        this.addressAr,
        this.addressEn,
        this.category,
        this.shopRate,
        this.isFavorite,
        this.user,
        this.favoriteShops,
        this.offers,
        this.shopBranches,
        this.shopPics,
        this.shopRates,
        this.isDeleted,
        this.createdDate,
        this.modifiedDate,
        this.createdByNameId,
        this.modifiedByNameId,
        this.createdByName,
        this.modifiedByName,
    });

    factory ShopModel.fromJson(Map<String, dynamic> json) => new ShopModel(
        shopId: json["shopId"] == null ? null : json["shopId"],
        nameAr: json["nameAr"] == null ? null : json["nameAr"],
        nameEn: json["nameEn"] == null ? null : json["nameEn"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        contactEmail: json["contactEmail"] == null ? null : json["contactEmail"],
        contactTele: json["contactTele"] == null ? null : json["contactTele"],
        profilPic: json["profilPic"] == null ? null : json["profilPic"],
        logoPic: json["logoPic"] == null ? null : json["logoPic"],
        descriptionAr: json["descriptionAr"] == null ? null : json["descriptionAr"],
        descriptionEn: json["descriptionEn"] == null ? null : json["descriptionEn"],
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
        userId: json["userId"] == null ? null : json["userId"],
        openingHoursFrom: json["openingHoursFrom"] == null ? null : json["openingHoursFrom"],
        openingHoursTo: json["openingHoursTo"] == null ? null : json["openingHoursTo"],
        is24Hours: json["is24Hours"] == null ? null : json["is24Hours"],
        addressAr: json["addressAr"] == null ? null : json["addressAr"],
        addressEn: json["addressEn"] == null ? null : json["addressEn"],
        category: json["category"],
        shopRate: json["shopRate"] == null ? null : json["shopRate"],
        isFavorite: json["isFavorite"] == null ? null : json["isFavorite"],
        user: json["user"],
        favoriteShops: json["favoriteShops"] == null ? null : new List<dynamic>.from(json["favoriteShops"].map((x) => x)),
        offers: json["offers"] == null ? null : new List<dynamic>.from(json["offers"].map((x) => x)),
        shopBranches: json["shopBranches"] == null ? null : new List<ShopBranchModel>.from(json["shopBranches"].map((x) => x)),
        shopPics: json["shopPics"] == null ? null : new List<dynamic>.from(json["shopPics"].map((x) => x)),
        shopRates: json["shopRates"] == null ? null : new List<dynamic>.from(json["shopRates"].map((x) => x)),
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        createdDate: json["createdDate"] == null ? null : json["createdDate"],
        modifiedDate: json["modifiedDate"] == null ? null : json["modifiedDate"],
        createdByNameId: json["createdByNameId"] == null ? null : json["createdByNameId"],
        modifiedByNameId: json["modifiedByNameId"] == null ? null : json["modifiedByNameId"],
        createdByName: json["createdByName"] == null ? null : json["createdByName"],
        modifiedByName: json["modifiedByName"] == null ? null : json["modifiedByName"],
    );

    Map<String, dynamic> toJson() => {
        "shopId": shopId == null ? null : shopId,
        "nameAr": nameAr == null ? null : nameAr,
        "nameEn": nameEn == null ? null : nameEn,
        "isActive": isActive == null ? null : isActive,
        "contactEmail": contactEmail == null ? null : contactEmail,
        "contactTele": contactTele == null ? null : contactTele,
        "profilPic": profilPic == null ? null : profilPic,
        "logoPic": logoPic == null ? null : logoPic,
        "descriptionAr": descriptionAr == null ? null : descriptionAr,
        "descriptionEn": descriptionEn == null ? null : descriptionEn,
        "categoryId": categoryId == null ? null : categoryId,
        "userId": userId == null ? null : userId,
        "openingHoursFrom": openingHoursFrom == null ? null : openingHoursFrom,
        "openingHoursTo": openingHoursTo == null ? null : openingHoursTo,
        "is24Hours": is24Hours == null ? null : is24Hours,
        "addressAr": addressAr == null ? null : addressAr,
        "addressEn": addressEn == null ? null : addressEn,
        "category": category,
        "shopRate": shopRate == null ? null : shopRate,
        "isFavorite": isFavorite == null ? null : isFavorite,
        "user": user,
        "favoriteShops": favoriteShops == null ? null : new List<dynamic>.from(favoriteShops.map((x) => x)),
        "offers": offers == null ? null : new List<dynamic>.from(offers.map((x) => x)),
        "shopBranches": shopBranches == null ? null : new List<ShopBranchModel>.from(shopBranches.map((x) => x)),
        "shopPics": shopPics == null ? null : new List<dynamic>.from(shopPics.map((x) => x)),
        "shopRates": shopRates == null ? null : new List<dynamic>.from(shopRates.map((x) => x)),
        "isDeleted": isDeleted == null ? null : isDeleted,
        "createdDate": createdDate == null ? null : createdDate,
        "modifiedDate": modifiedDate == null ? null : modifiedDate,
        "createdByNameId": createdByNameId == null ? null : createdByNameId,
        "modifiedByNameId": modifiedByNameId == null ? null : modifiedByNameId,
        "createdByName": createdByName == null ? null : createdByName,
        "modifiedByName": modifiedByName == null ? null : modifiedByName,
    };
}
