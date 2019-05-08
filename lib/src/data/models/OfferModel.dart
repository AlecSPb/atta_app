
import 'dart:convert';

List<OfferModel> offerModelFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<OfferModel>.from(jsonData.map((x) => OfferModel.fromJson(x)));
}

String offerModelToJson(List<OfferModel> data) {
    final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class OfferModel {
    int offerId;
    String nameAr;
    String nameEn;
    String descriptionAr;
    String descriptionEn;
    DateTime startDate;
    DateTime endDate;
    int shopId;
    String discountCode;
    String discountAmount;
    Shop shop;
    List<dynamic> memberOffers;
    List<OfferItem> offerItems;
    List<OfferPic> offerPics;
    List<OfferTerms> offerTerms;
    List<OfferBenefits> offerBenefits;
    bool isFavorite;
    bool isDeleted;
    DateTime createdDate;
    DateTime modifiedDate;
    int createdByNameId;
    int modifiedByNameId;
    String createdByName;
    String modifiedByName;

    OfferModel({
        this.offerId,
        this.nameAr,
        this.nameEn,
        this.descriptionAr,
        this.descriptionEn,
        this.startDate,
        this.endDate,
        this.shopId,
        this.discountCode,
        this.discountAmount,
        this.shop,
        this.memberOffers,
        this.offerItems,
        this.offerPics,
        this.offerTerms,
        this.offerBenefits,
        this.isFavorite,
        this.isDeleted,
        this.createdDate,
        this.modifiedDate,
        this.createdByNameId,
        this.modifiedByNameId,
        this.createdByName,
        this.modifiedByName,
    });

    factory OfferModel.fromJson(Map<String, dynamic> json) => new OfferModel(
        offerId: json["offerId"] == null ? null : json["offerId"],
        nameAr: json["nameAr"] == null ? null : json["nameAr"],
        nameEn: json["nameEn"] == null ? null : json["nameEn"],
        descriptionAr: json["descriptionAr"] == null ? null : json["descriptionAr"],
        descriptionEn: json["descriptionEn"] == null ? null : json["descriptionEn"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        shopId: json["shopId"] == null ? null : json["shopId"],
        discountCode: json["discountCode"] == null ? null : json["discountCode"],
        discountAmount: json["discountAmount"] == null ? null : json["discountAmount"],
        shop: json["shop"] == null ? null : Shop.fromJson(json["shop"]),
        memberOffers: json["memberOffers"] == null ? null : new List<dynamic>.from(json["memberOffers"].map((x) => x)),
        offerItems: json["offerItems"] == null ? null : new List<OfferItem>.from(json["offerItems"].map((x) => OfferItem.fromJson(x))),
        offerPics: json["offerPics"] == null ? null : new List<OfferPic>.from(json["offerPics"].map((x) => OfferPic.fromJson(x))),
        offerTerms: json["offerTerms"] == null ? null : new List<OfferTerms>.from(json["offerTerms"].map((x) => OfferTerms.fromJson(x))),
        offerBenefits: json["offerBenefits"] == null ? null : new List<OfferBenefits>.from(json["offerBenefits"].map((x) => OfferBenefits.fromJson(x))),
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
        "offerId": offerId == null ? null : offerId,
        "nameAr": nameAr == null ? null : nameAr,
        "nameEn": nameEn == null ? null : nameEn,
        "descriptionAr": descriptionAr == null ? null : descriptionAr,
        "descriptionEn": descriptionEn == null ? null : descriptionEn,
        "startDate": startDate == null ? null : startDate.toIso8601String(),
        "endDate": endDate == null ? null : endDate.toIso8601String(),
        "shopId": shopId == null ? null : shopId,
        "discountCode": discountCode == null ? null : discountCode,
        "discountAmount": discountAmount == null ? null : discountAmount,
        "shop": shop == null ? null : shop.toJson(),
        "memberOffers": memberOffers == null ? null : new List<dynamic>.from(memberOffers.map((x) => x)),
        "offerItems": offerItems == null ? null : new List<dynamic>.from(offerItems.map((x) => x.toJson())),
        "offerPics": offerPics == null ? null : new List<dynamic>.from(offerPics.map((x) => x.toJson())),
        "offerTerms": offerTerms == null ? null : new List<dynamic>.from(offerTerms.map((x) => x)),
        "offerBenefits": offerBenefits == null ? null : new List<dynamic>.from(offerBenefits.map((x) => x)),
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

class OfferItem {
    int offerItemId;
    String nameAr;
    dynamic nameEn;
    double discount;
    dynamic descriptionAr;
    dynamic descriptionEn;
    int offerId;
    List<dynamic> offerItemPics;
    dynamic isDeleted;
    dynamic createdDate;
    dynamic modifiedDate;
    dynamic createdByNameId;
    dynamic modifiedByNameId;
    dynamic createdByName;
    dynamic modifiedByName;

    OfferItem({
        this.offerItemId,
        this.nameAr,
        this.nameEn,
        this.discount,
        this.descriptionAr,
        this.descriptionEn,
        this.offerId,
        this.offerItemPics,
        this.isDeleted,
        this.createdDate,
        this.modifiedDate,
        this.createdByNameId,
        this.modifiedByNameId,
        this.createdByName,
        this.modifiedByName,
    });

    factory OfferItem.fromJson(Map<String, dynamic> json) => new OfferItem(
        offerItemId: json["offerItemId"],
        nameAr: json["nameAr"],
        nameEn: json["nameEn"],
        discount: json["discount"],
        descriptionAr: json["descriptionAr"],
        descriptionEn: json["descriptionEn"],
        offerId: json["offerId"],
        offerItemPics: new List<dynamic>.from(json["offerItemPics"].map((x) => x)),
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"],
        modifiedDate: json["modifiedDate"],
        createdByNameId: json["createdByNameId"],
        modifiedByNameId: json["modifiedByNameId"],
        createdByName: json["createdByName"],
        modifiedByName: json["modifiedByName"],
    );

    Map<String, dynamic> toJson() => {
        "offerItemId": offerItemId,
        "nameAr": nameAr,
        "nameEn": nameEn,
        "discount": discount,
        "descriptionAr": descriptionAr,
        "descriptionEn": descriptionEn,
        "offerId": offerId,
        "offerItemPics": new List<dynamic>.from(offerItemPics.map((x) => x)),
        "isDeleted": isDeleted,
        "createdDate": createdDate,
        "modifiedDate": modifiedDate,
        "createdByNameId": createdByNameId,
        "modifiedByNameId": modifiedByNameId,
        "createdByName": createdByName,
        "modifiedByName": modifiedByName,
    };
}

class OfferPic {
    int offerPicId;
    dynamic path;
    int offerId;
    dynamic isDeleted;
    dynamic createdDate;
    dynamic modifiedDate;
    dynamic createdByNameId;
    dynamic modifiedByNameId;
    dynamic createdByName;
    dynamic modifiedByName;

    OfferPic({
        this.offerPicId,
        this.path,
        this.offerId,
        this.isDeleted,
        this.createdDate,
        this.modifiedDate,
        this.createdByNameId,
        this.modifiedByNameId,
        this.createdByName,
        this.modifiedByName,
    });

    factory OfferPic.fromJson(Map<String, dynamic> json) => new OfferPic(
        offerPicId: json["offerPicId"],
        path: json["path"],
        offerId: json["offerId"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"],
        modifiedDate: json["modifiedDate"],
        createdByNameId: json["createdByNameId"],
        modifiedByNameId: json["modifiedByNameId"],
        createdByName: json["createdByName"],
        modifiedByName: json["modifiedByName"],
    );

    Map<String, dynamic> toJson() => {
        "offerPicId": offerPicId,
        "path": path,
        "offerId": offerId,
        "isDeleted": isDeleted,
        "createdDate": createdDate,
        "modifiedDate": modifiedDate,
        "createdByNameId": createdByNameId,
        "modifiedByNameId": modifiedByNameId,
        "createdByName": createdByName,
        "modifiedByName": modifiedByName,
    };
}


class Shop {
    int shopId;
    String nameAr;
    dynamic nameEn;
    dynamic isActive;
    dynamic contactEmail;
    dynamic contactTele;
    dynamic profilPic;
    dynamic logoPic;
    dynamic descriptionAr;
    dynamic descriptionEn;
    int categoryId;
    dynamic userId;
    dynamic openingHoursFrom;
    dynamic openingHoursTo;
    dynamic is24Hours;
    String addressAr;
    dynamic addressEn;
    dynamic category;
    double shopRate;
    dynamic user;
    List<dynamic> favoriteShops;
    List<OfferModel> offers;
    List<dynamic> shopBranches;
    List<dynamic> shopPics;
    List<dynamic> shopRates;
    dynamic isDeleted;
    dynamic createdDate;
    dynamic modifiedDate;
    dynamic createdByNameId;
    dynamic modifiedByNameId;
    dynamic createdByName;
    dynamic modifiedByName;

    Shop({
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

    factory Shop.fromJson(Map<String, dynamic> json) => new Shop(
        shopId: json["shopId"],
        nameAr: json["nameAr"],
        nameEn: json["nameEn"],
        isActive: json["isActive"],
        contactEmail: json["contactEmail"],
        contactTele: json["contactTele"],
        profilPic: json["profilPic"],
        logoPic: json["logoPic"],
        descriptionAr: json["descriptionAr"],
        descriptionEn: json["descriptionEn"],
        categoryId: json["categoryId"],
        userId: json["userId"],
        openingHoursFrom: json["openingHoursFrom"],
        openingHoursTo: json["openingHoursTo"],
        is24Hours: json["is24Hours"],
        addressAr: json["addressAr"],
        addressEn: json["addressEn"],
        category: json["category"],
        shopRate: json["shopRate"]==null ? 0 : json["shopRate"],
        user: json["user"],
        favoriteShops: new List<dynamic>.from(json["favoriteShops"].map((x) => x)),
        offers: new List<OfferModel>.from(json["offers"].map((x) => OfferModel.fromJson(x))),
        shopBranches: new List<dynamic>.from(json["shopBranches"].map((x) => x)),
        shopPics: new List<dynamic>.from(json["shopPics"].map((x) => x)),
        shopRates: new List<dynamic>.from(json["shopRates"].map((x) => x)),
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"],
        modifiedDate: json["modifiedDate"],
        createdByNameId: json["createdByNameId"],
        modifiedByNameId: json["modifiedByNameId"],
        createdByName: json["createdByName"],
        modifiedByName: json["modifiedByName"],
    );

    Map<String, dynamic> toJson() => {
        "shopId": shopId,
        "nameAr": nameAr,
        "nameEn": nameEn,
        "isActive": isActive,
        "contactEmail": contactEmail,
        "contactTele": contactTele,
        "profilPic": profilPic,
        "logoPic": logoPic,
        "descriptionAr": descriptionAr,
        "descriptionEn": descriptionEn,
        "categoryId": categoryId,
        "userId": userId,
        "openingHoursFrom": openingHoursFrom,
        "openingHoursTo": openingHoursTo,
        "is24Hours": is24Hours,
        "addressAr": addressAr,
        "addressEn": addressEn,
        "category": category,
        "shopRate": shopRate,
        "user": user,
        "favoriteShops": new List<dynamic>.from(favoriteShops.map((x) => x)),
        "offers": new List<dynamic>.from(offers.map((x) => x.toJson())),
        "shopBranches": new List<dynamic>.from(shopBranches.map((x) => x)),
        "shopPics": new List<dynamic>.from(shopPics.map((x) => x)),
        "shopRates": new List<dynamic>.from(shopRates.map((x) => x)),
        "isDeleted": isDeleted,
        "createdDate": createdDate,
        "modifiedDate": modifiedDate,
        "createdByNameId": createdByNameId,
        "modifiedByNameId": modifiedByNameId,
        "createdByName": createdByName,
        "modifiedByName": modifiedByName,
    };
}

class OfferBenefits {
    int offerBenefitId;
    int offerId;
    String descriptionAr;
    String descriptionEn;
    dynamic offer;
    dynamic isDeleted;
    dynamic createdDate;
    dynamic modifiedDate;
    dynamic createdByNameId;
    dynamic modifiedByNameId;
    dynamic createdByName;
    dynamic modifiedByName;

    OfferBenefits({
        this.offerBenefitId,
        this.offerId,
        this.descriptionAr,
        this.descriptionEn,
        this.offer,
        this.isDeleted,
        this.createdDate,
        this.modifiedDate,
        this.createdByNameId,
        this.modifiedByNameId,
        this.createdByName,
        this.modifiedByName,
    });

    factory OfferBenefits.fromJson(Map<String, dynamic> json) => new OfferBenefits(
        offerBenefitId: json["offerBenefitId"] == null ? null : json["offerBenefitId"],
        offerId: json["offerId"] == null ? null : json["offerId"],
        descriptionAr: json["descriptionAr"] == null ? null : json["descriptionAr"],
        descriptionEn: json["descriptionEn"],
        offer: json["offer"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"],
        modifiedDate: json["modifiedDate"],
        createdByNameId: json["createdByNameId"],
        modifiedByNameId: json["modifiedByNameId"],
        createdByName: json["createdByName"],
        modifiedByName: json["modifiedByName"],
    );

    Map<String, dynamic> toJson() => {
        "offerBenefitId": offerBenefitId == null ? null : offerBenefitId,
        "offerId": offerId == null ? null : offerId,
        "descriptionAr": descriptionAr == null ? null : descriptionAr,
        "descriptionEn": descriptionEn,
        "offer": offer,
        "isDeleted": isDeleted,
        "createdDate": createdDate,
        "modifiedDate": modifiedDate,
        "createdByNameId": createdByNameId,
        "modifiedByNameId": modifiedByNameId,
        "createdByName": createdByName,
        "modifiedByName": modifiedByName,
    };
}


class OfferTerms {
    int offerTermId;
    int offerId;
    String descriptionAr;
    String descriptionEn;
    dynamic offer;
    dynamic isDeleted;
    dynamic createdDate;
    dynamic modifiedDate;
    dynamic createdByNameId;
    dynamic modifiedByNameId;
    dynamic createdByName;
    dynamic modifiedByName;

    OfferTerms({
        this.offerTermId,
        this.offerId,
        this.descriptionAr,
        this.descriptionEn,
        this.offer,
        this.isDeleted,
        this.createdDate,
        this.modifiedDate,
        this.createdByNameId,
        this.modifiedByNameId,
        this.createdByName,
        this.modifiedByName,
    });

    factory OfferTerms.fromJson(Map<String, dynamic> json) => new OfferTerms(
        offerTermId: json["offerTermId"] == null ? null : json["offerTermId"],
        offerId: json["offerId"] == null ? null : json["offerId"],
        descriptionAr: json["descriptionAr"] == null ? null : json["descriptionAr"],
        descriptionEn: json["descriptionEn"],
        offer: json["offer"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"],
        modifiedDate: json["modifiedDate"],
        createdByNameId: json["createdByNameId"],
        modifiedByNameId: json["modifiedByNameId"],
        createdByName: json["createdByName"],
        modifiedByName: json["modifiedByName"],
    );

    Map<String, dynamic> toJson() => {
        "offerTermId": offerTermId == null ? null : offerTermId,
        "offerId": offerId == null ? null : offerId,
        "descriptionAr": descriptionAr == null ? null : descriptionAr,
        "descriptionEn": descriptionEn,
        "offer": offer,
        "isDeleted": isDeleted,
        "createdDate": createdDate,
        "modifiedDate": modifiedDate,
        "createdByNameId": createdByNameId,
        "modifiedByNameId": modifiedByNameId,
        "createdByName": createdByName,
        "modifiedByName": modifiedByName,
    };
}
