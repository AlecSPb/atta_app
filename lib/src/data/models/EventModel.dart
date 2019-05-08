// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

List<EventModel> eventModelFromJson(String str) => new List<EventModel>.from(json.decode(str).map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
    int eventId;
    String titleAr;
    String titleEn;
    String descriptionAr;
    String descriptionEn;
    String briefAr;
    String briefEn;
    String eventAddressAr;
    String eventAddressEn;
    String imagePath;
    DateTime eventDate;
    String formatedEventDate;
    bool isFavorite;
    bool isDeleted;
    DateTime createdDate;
    DateTime modifiedDate;
    String createdByNameId;
    String modifiedByNameId;
    String createdByName;
    String modifiedByName;

    EventModel({
        this.eventId,
        this.titleAr,
        this.titleEn,
        this.descriptionAr,
        this.descriptionEn,
        this.briefAr,
        this.briefEn,
        this.eventAddressAr,
        this.eventAddressEn,
        this.imagePath,
        this.eventDate,
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

    factory EventModel.fromJson(Map<String, dynamic> json) => new EventModel(
        eventId: json["eventId"] == null ? null : json["eventId"],
        titleAr: json["titleAr"] == null ? null : json["titleAr"],
        titleEn: json["titleEn"] == null ? null : json["titleEn"],
        descriptionAr: json["descriptionAr"] == null ? null : json["descriptionAr"],
        descriptionEn: json["descriptionEn"] == null ? null : json["descriptionEn"],
        briefAr: json["briefAr"] == null ? null : json["briefAr"],
        briefEn: json["briefEn"] == null ? null : json["briefEn"],
        eventAddressAr: json["eventAddressAr"] == null ? null : json["eventAddressAr"],
        eventAddressEn: json["eventAddressEn"] == null ? null : json["eventAddressEn"],
        imagePath: json["imagePath"] == null ? null : json["imagePath"],
        eventDate: json["eventDate"] == null ? null : DateTime.parse(json["eventDate"]),
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
        "eventId": eventId == null ? null : eventId,
        "titleAr": titleAr == null ? null : titleAr,
        "titleEn": titleEn == null ? null : titleEn,
        "descriptionAr": descriptionAr == null ? null : descriptionAr,
        "descriptionEn": descriptionEn == null ? null : descriptionEn,
        "briefAr": briefAr == null ? null : briefAr,
        "briefEn": briefEn == null ? null : briefEn,
        "eventAddressAr": eventAddressAr == null ? null : eventAddressAr,
        "eventAddressEn": eventAddressEn == null ? null : eventAddressEn,
        "imagePath": imagePath == null ? null : imagePath,
        "eventDate": eventDate == null ? null : eventDate.toIso8601String(),
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
