// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<CategoryModel>.from(jsonData.map((x) => CategoryModel.fromJson(x)));
}

String categoryToJson(List<CategoryModel> data) {
    final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class CategoryModel {
    int categoryId;
    String nameAr;
    String nameEn;
    dynamic img;
    dynamic parentCategoryId;
    dynamic color;
    dynamic parentCategory;
    List<dynamic> childrenCategories;
    List<dynamic> shops;
    dynamic isDeleted;
    dynamic createdDate;
    dynamic modifiedDate;
    dynamic createdByNameId;
    dynamic modifiedByNameId;
    dynamic createdByName;
    dynamic modifiedByName;

    CategoryModel({
        this.categoryId,
        this.nameAr,
        this.nameEn,
        this.img,
        this.parentCategoryId,
        this.color,
        this.parentCategory,
        this.childrenCategories,
        this.shops,
        this.isDeleted,
        this.createdDate,
        this.modifiedDate,
        this.createdByNameId,
        this.modifiedByNameId,
        this.createdByName,
        this.modifiedByName,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => new CategoryModel(
        categoryId: json["categoryId"],
        nameAr: json["nameAr"],
        nameEn: json["nameEn"],
        img: json["img"],
        parentCategoryId: json["parentCategoryId"],
        color: json["color"],
        parentCategory: json["parentCategory"],
        childrenCategories: new List<dynamic>.from(json["childrenCategories"].map((x) => x)),
        shops: new List<dynamic>.from(json["shops"].map((x) => x)),
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"],
        modifiedDate: json["modifiedDate"],
        createdByNameId: json["createdByNameId"],
        modifiedByNameId: json["modifiedByNameId"],
        createdByName: json["createdByName"],
        modifiedByName: json["modifiedByName"],
    );

    Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "nameAr": nameAr,
        "nameEn": nameEn,
        "img": img,
        "parentCategoryId": parentCategoryId,
        "color": color,
        "parentCategory": parentCategory,
        "childrenCategories": new List<dynamic>.from(childrenCategories.map((x) => x)),
        "shops": new List<dynamic>.from(shops.map((x) => x)),
        "isDeleted": isDeleted,
        "createdDate": createdDate,
        "modifiedDate": modifiedDate,
        "createdByNameId": createdByNameId,
        "modifiedByNameId": modifiedByNameId,
        "createdByName": createdByName,
        "modifiedByName": modifiedByName,
    };
}
