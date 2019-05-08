// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

List<ContactModel> contactModelFromJson(String str) => new List<ContactModel>.from(json.decode(str).map((x) => ContactModel.fromJson(x)));

String contactModelToJson(List<ContactModel> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class ContactModel {
    int contactInfoId;
    String email;
    String facebookUrl;
    String twitterUrl;
    String youtubeUrl;
    String telephone;
    String address;
    bool isDeleted;
    String createdDate;
    String modifiedDate;
    String createdByNameId;
    String modifiedByNameId;
    String createdByName;
    String modifiedByName;

    ContactModel({
        this.contactInfoId,
        this.email,
        this.facebookUrl,
        this.twitterUrl,
        this.youtubeUrl,
        this.telephone,
        this.address,
        this.isDeleted,
        this.createdDate,
        this.modifiedDate,
        this.createdByNameId,
        this.modifiedByNameId,
        this.createdByName,
        this.modifiedByName,
    });

    factory ContactModel.fromJson(Map<String, dynamic> json) => new ContactModel(
        contactInfoId: json["contactInfoId"] == null ? null : json["contactInfoId"],
        email: json["email"] == null ? null : json["email"],
        facebookUrl: json["facebookURL"],
        twitterUrl: json["twitterURL"],
        youtubeUrl: json["youtubeURL"],
        telephone: json["telephone"] == null ? null : json["telephone"],
        address: json["address"] == null ? null : json["address"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"],
        modifiedDate: json["modifiedDate"],
        createdByNameId: json["createdByNameId"],
        modifiedByNameId: json["modifiedByNameId"],
        createdByName: json["createdByName"],
        modifiedByName: json["modifiedByName"],
    );

    Map<String, dynamic> toJson() => {
        "contactInfoId": contactInfoId == null ? null : contactInfoId,
        "email": email == null ? null : email,
        "facebookURL": facebookUrl,
        "twitterURL": twitterUrl,
        "youtubeURL": youtubeUrl,
        "telephone": telephone == null ? null : telephone,
        "address": address == null ? null : address,
        "isDeleted": isDeleted,
        "createdDate": createdDate,
        "modifiedDate": modifiedDate,
        "createdByNameId": createdByNameId,
        "modifiedByNameId": modifiedByNameId,
        "createdByName": createdByName,
        "modifiedByName": modifiedByName,
    };
}
