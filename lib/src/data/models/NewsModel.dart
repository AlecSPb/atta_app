// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) => new List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
    int newsId;
    String titleAr;
    String titleEn;
    String descriptionAr;
    String descriptionEn;
    String briefAr;
    String briefEn;
    String imagePath;
    DateTime publishedDate;
    bool isPublished;
    String formatedEventDate;
    bool isFavorite;
    bool isDeleted;
    DateTime createdDate;
    DateTime modifiedDate;
    int createdByNameId;
    int modifiedByNameId;
    String createdByName;
    String modifiedByName;

    NewsModel({
        this.newsId,
        this.titleAr,
        this.titleEn,
        this.descriptionAr,
        this.descriptionEn,
        this.briefAr,
        this.briefEn,
        this.imagePath,
        this.publishedDate,
        this.isPublished,
        this.formatedEventDate,
        this.isFavorite,
        this.isDeleted,
        this.createdDate,
        this.modifiedDate,
        this.createdByNameId,
        this.modifiedByNameId,
        this.createdByName,
        this.modifiedByName,
    });

    factory NewsModel.fromJson(Map<String, dynamic> json) => new NewsModel(
        newsId: json["newsId"] == null ? null : json["newsId"],
        titleAr: json["titleAr"] == null ? null : json["titleAr"],
        titleEn: json["titleEn"] == null ? null : json["titleEn"],
        descriptionAr: json["descriptionAr"] == null ? null : json["descriptionAr"],
        descriptionEn: json["descriptionEn"] == null ? null : json["descriptionEn"],
        briefAr: json["briefAr"] == null ? null : json["briefAr"],
        briefEn: json["briefEn"] == null ? null : json["briefEn"],
        imagePath: json["imagePath"] == null ? null : json["imagePath"],
        publishedDate: json["publishedDate"] == null ? null : DateTime.parse(json["publishedDate"]),
        isPublished: json["isPublished"] == null ? null : json["isPublished"],
        formatedEventDate: json["formatedEventDate"] == null ? null : json["formatedEventDate"],
        isFavorite: json["isFavorite"] == null ? null : json["isFavorite"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        modifiedDate: json["modifiedDate"] == null ? null : DateTime.parse(json["modifiedDate"]),
        createdByNameId: json["createdByNameId"] == null ? null : json["createdByNameId"],
        modifiedByNameId: json["modifiedByNameId"] == null ? null : json["modifiedByNameId"],
        createdByName: json["createdByName"] == null ? null : json["createdByName"],
        modifiedByName: json["modifiedByName"] == null ? null : json["modifiedByName"],
    );

    Map<String, dynamic> toJson() => {
        "newsId": newsId == null ? null : newsId,
        "titleAr": titleAr == null ? null : titleAr,
        "titleEn": titleEn == null ? null : titleEn,
        "descriptionAr": descriptionAr == null ? null : descriptionAr,
        "descriptionEn": descriptionEn == null ? null : descriptionEn,
        "briefAr": briefAr == null ? null : briefAr,
        "briefEn": briefEn == null ? null : briefEn,
        "imagePath": imagePath == null ? null : imagePath,
        "publishedDate": publishedDate == null ? null : publishedDate.toIso8601String(),
        "isPublished": isPublished == null ? null : isPublished,
        "formatedEventDate": formatedEventDate == null ? null : formatedEventDate,
        "isFavorite": isFavorite == null ? null : isFavorite,
        "isDeleted": isDeleted == null ? null : isDeleted,
        "createdDate": createdDate == null ? null : createdDate.toIso8601String(),
        "modifiedDate": modifiedDate == null ? null : modifiedDate.toIso8601String(),
        "createdByNameId": createdByNameId == null ? null : createdByNameId,
        "modifiedByNameId": modifiedByNameId == null ? null : modifiedByNameId,
        "createdByName": createdByName == null ? null : createdByName,
        "modifiedByName": modifiedByName == null ? null : modifiedByName,
    };
}
