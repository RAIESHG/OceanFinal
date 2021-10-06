// To parse this JSON data, do
//
//     final viewallResponse = viewallResponseFromMap(jsonString);

import 'dart:convert';

import '../homepageResponse/homepage_response.dart';

ViewallResponse viewAllResponseFromMap(String str) =>
    ViewallResponse.fromMap(json.decode(str));

String viewallResponseToMap(ViewallResponse data) => json.encode(data.toMap());

class ViewallResponse {
  ViewallResponse({
    this.data,
  });

  final ViewAllData? data;

  ViewallResponse copyWith({
    ViewAllData? data,
  }) =>
      ViewallResponse(
        data: data ?? this.data,
      );

  factory ViewallResponse.fromMap(Map<String, dynamic> json) => ViewallResponse(
        data: json["data"] == null ? null : ViewAllData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null ? null : data!.toMap(),
      };
}

class Data {
  Data({
    this.packageData,
    this.videoData,
    this.bookData,
    this.items,
    this.success,
    this.categories,
  });
  final List<Category>? categories;
  final List<PackageData>? packageData;
  final List<VideoData>? videoData;
  final List<BookData>? bookData;
  final bool? success;
  final List<dynamic>? items;

  Data copyWith({
    List<PackageData>? packageData,
    bool? success,
    List<VideoData>? videoData,
    List<BookData>? bookData,
    List<Category>? categories,
    List<dynamic>? items,
  }) =>
      Data(
        packageData: packageData ?? this.packageData,
        success: success ?? this.success,
        bookData: bookData ?? this.bookData,
        videoData: videoData ?? this.videoData,
        categories: categories ?? this.categories,
      );

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        items: json["bookData"] == null
            ? json["videoData"] == null
                ? List<PackageData>.from(
                    json["packageData"].map((x) => PackageData.fromMap(x)))
                : List<VideoData>.from(
                    json["videoData"].map((x) => VideoData.fromMap(x)))
            : List<BookData>.from(
                json["bookData"].map((x) => BookData.fromMap(x))),
        packageData: json["packageData"] == null
            ? null
            : List<PackageData>.from(
                json["packageData"].map((x) => PackageData.fromMap(x))),
        bookData: json["bookData"] == null
            ? null
            : List<BookData>.from(
                json["bookData"].map((x) => BookData.fromMap(x))),
        videoData: json["videoData"] == null
            ? null
            : List<VideoData>.from(
                json["videoData"].map((x) => VideoData.fromMap(x))),
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromMap(x))),
        success: json["success"] == null ? null : json["success"],
      );

  Map<String, dynamic> toMap() => {
        "packageData": packageData == null
            ? null
            : List<dynamic>.from(packageData!.map((x) => x.toMap())),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "success": success == null ? null : success,
      };
}

class ViewAllData {
  ViewAllData({
    this.packageData,
    this.videoData,
    this.bookData,
    this.items,
    this.categories,
  });
  final List<Category>? categories;
  final List<PackageData>? packageData;
  final List<VideoData>? videoData;
  final List<BookData>? bookData;
  final List<dynamic>? items;

  ViewAllData copyWith({
    List<PackageData>? packageData,
    bool? success,
    List<VideoData>? videoData,
    List<BookData>? bookData,
    List<Category>? categories,
    List<dynamic>? items,
  }) =>
      ViewAllData(
        packageData: packageData ?? this.packageData,
        bookData: bookData ?? this.bookData,
        videoData: videoData ?? this.videoData,
        categories: categories ?? this.categories,
      );

  factory ViewAllData.fromMap(Map<String, dynamic> json) => ViewAllData(
        items: json["books"] == null
            ? json["videoData"] == null
                ? List<PackageData>.from(
                    json["packageData"].map((x) => PackageData.fromMap(x)))
                : List<VideoData>.from(
                    json["videoData"].map((x) => VideoData.fromMap(x)))
            : List<BookData>.from(
                json["books"].map((x) => BookData.fromMap(x))),
        packageData: json["packageData"] == null
            ? null
            : List<PackageData>.from(
                json["packageData"].map((x) => PackageData.fromMap(x))),
        bookData: json["bookData"] == null
            ? null
            : List<BookData>.from(
                json["bookData"].map((x) => BookData.fromMap(x))),
        videoData: json["videoData"] == null
            ? null
            : List<VideoData>.from(
                json["videoData"].map((x) => VideoData.fromMap(x))),
        categories: json["categories"] == null
            ? []
            : json["books"] == null
                ? List<Category>.from(
                    //TODO: only one category is shown fix
                    json["categories"][0].map((x) => Category.fromMap(x)))
                : List<Category>.from(
                    json["categories"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "packageData": packageData == null
            ? null
            : List<dynamic>.from(packageData!.map((x) => x.toMap())),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x.toMap())),
      };
}

class Category {
  Category({
    this.id,
    this.title,
    this.slug,
    this.parentId,
    this.icon,
    this.image,
    this.status,
    this.description,
    this.childs,
  });

  final int? id;
  final String? title;
  final String? slug;
  final int? parentId;
  final dynamic icon;
  final String? image;
  final dynamic status;
  final dynamic description;
  final List<Category>? childs;

  Category copyWith({
    int? id,
    String? title,
    String? slug,
    int? parentId,
    dynamic icon,
    String? image,
    dynamic status,
    dynamic description,
    List<Category>? childs,
  }) =>
      Category(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        parentId: parentId ?? this.parentId,
        icon: icon ?? this.icon,
        image: image ?? this.image,
        status: status ?? this.status,
        description: description ?? this.description,
        childs: childs ?? this.childs,
      );

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        icon: json["icon"],
        image: json["image"] == null ? null : json["image"],
        status: json["status"] == null ? null : json["status"],
        description: json["description"],
        childs: json["childs"] == null
            ? null
            : List<Category>.from(
                json["childs"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "parent_id": parentId == null ? null : parentId,
        "icon": icon,
        "image": image == null ? null : image,
        "status": status == null ? null : status,
        "description": description,
        "childs": childs == null
            ? null
            : List<dynamic>.from(childs!.map((x) => x.toMap())),
      };
}
