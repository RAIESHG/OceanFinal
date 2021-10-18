// To parse this JSON data, do
//
//     final viewAllVideoResponse = viewAllVideoResponseFromMap(jsonString?);

import 'dart:convert';

import 'package:ocean_publication/model/viewAllResponse/view_all_bookResponse.dart';

ViewAllVideoResponse viewAllVideoResponseFromMap(String? str) => ViewAllVideoResponse.fromMap(json.decode(str!));

String? viewAllVideoResponseToMap(ViewAllVideoResponse data) => json.encode(data.toMap());

class ViewAllVideoResponse {
    ViewAllVideoResponse({
        this.data,
    });

    Data? data;

    factory ViewAllVideoResponse.fromMap(Map<String?, dynamic> json) => ViewAllVideoResponse(
        data: Data.fromMap(json["data"]),
    );

    Map<String?, dynamic> toMap() => {
        "data": data!.toMap(),
    };
}

class Data {
    Data({
        this.videoData,
        this.categories,
        this.success,
    });

    List<VideoDatum>? videoData;
    List<List<Category>>? categories;
    bool? success;

    factory Data.fromMap(Map<String?, dynamic> json) => Data(
        videoData: List<VideoDatum>.from(json["videoData"].map((x) => VideoDatum.fromMap(x))),
        categories: List<List<Category>>.from(json["categories"].map((x) => List<Category>.from(x.map((x) => Category.fromMap(x))))),
        success: json["success"],
    );

    Map<String?, dynamic> toMap() => {
        "videoData": List<dynamic>.from(videoData!.map((x) => x.toMap())),
        "categories": List<dynamic>.from(categories!.map((x) => List<dynamic>.from(x.map((x) => x.toMap())))),
        "success": success,
    };
}

// class Category {
//     Category({
//         this.id,
//         this.title,
//         this.slug,
//         this.parentId,
//         this.icon,
//         this.image,
//         this.status,
//         this.description,
//         this.createdAt,
//         this.updatedAt,
//         this.deletedAt,
//         this.childs,
//     });

//     int? id;
//     String? title;
//     String? slug;
//     int? parentId;
//     dynamic icon;
//     dynamic image;
//     Status? status;
//     dynamic description;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     dynamic deletedAt;
//     List<Category>? childs;

//     factory Category.fromMap(Map<String?, dynamic> json) => Category(
//         id: json["id"],
//         title: json["title"],
//         slug: json["slug"],
//         parentId: json["parent_id"],
//         icon: json["icon"],
//         image: json["image"],
//         status: statusValues.map![json["status"]],
//         description: json["description"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         deletedAt: json["deleted_at"],
//         childs: List<Category>.from(json["childs"].map((x) => Category.fromMap(x))),
//     );

//     Map<String?, dynamic> toMap() => {
//         "id": id,
//         "title": title,
//         "slug": slug,
//         "parent_id": parentId,
//         "icon": icon,
//         "image": image,
//         "status": statusValues.reverse![status],
//         "description": description,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//         "deleted_at": deletedAt,
//         "childs": List<dynamic>.from(childs!.map((x) => x.toMap())),
//     };
// }

enum Status { ACTIVE }

final statusValues = EnumValues({
    "Active": Status.ACTIVE
});

class VideoDatum {
    VideoDatum({
        this.id,
        this.title,
        this.categoryId,
        this.slug,
        this.price,
        this.offerPrice,
        this.video,
        this.preview,
        this.feature,
        this.position,
        this.image,
        this.author,
        this.time,
        this.description,
        this.tableOfContent,
        this.status,
        this.purchasePrice,
        this.type,
    });

    int? id;
    String? title;
    int? categoryId;
    String? slug;
    int? price;
    int? offerPrice;
    String? video;
    int? preview;
    int? feature;
    dynamic position;
    String? image;
    String? author;
    String? time;
    String? description;
    dynamic tableOfContent;
    Status? status;
    dynamic purchasePrice;
    String? type;

    factory VideoDatum.fromMap(Map<String?, dynamic> json) => VideoDatum(
        id: json["id"],
        title: json["title"],
        categoryId: json["category_id"],
        slug: json["slug"],
        price: json["price"],
        offerPrice: json["offer_price"],
        video: json["video"],
        preview: json["preview"],
        feature: json["feature"],
        position: json["position"],
        image: json["image"],
        author: json["author"],
        time: json["time"],
        description: json["description"],
        tableOfContent: json["table_of_content"],
        status: statusValues.map![json["status"]],
        purchasePrice: json["purchase_price"],
        type: json["type"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "category_id": categoryId,
        "slug": slug,
        "price": price,
        "offer_price": offerPrice,
        "video": video,
        "preview": preview,
        "feature": feature,
        "position": position,
        "image": image,
        "author": author,
        "time": time,
        "description": description,
        "table_of_content": tableOfContent,
        "status": statusValues.reverse![status],
        "purchase_price": purchasePrice,
        "type": type,
    };
}

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String?>? get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
