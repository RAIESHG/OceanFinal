// To parse this JSON data, do
//
//     final letsExploreResponse = letsExploreResponseFromMap(jsonString);

import 'dart:convert';

import '../homepageResponse/homepage_response.dart';

LetsExploreResponse letsExploreResponseFromMap(String str) =>
    LetsExploreResponse.fromMap(json.decode(str));

String letsExploreResponseToMap(LetsExploreResponse data) =>
    json.encode(data.toMap());

class LetsExploreResponse {
  LetsExploreResponse({
    this.data,
    this.success,
  });

  final LetsExploreData? data;
  final bool? success;

  LetsExploreResponse copyWith({
    LetsExploreData? data,
    bool? success,
  }) =>
      LetsExploreResponse(
        data: data ?? this.data,
        success: success ?? this.success,
      );

  factory LetsExploreResponse.fromMap(Map<String, dynamic> json) =>
      LetsExploreResponse(
        data:
            json["data"] == null ? null : LetsExploreData.fromMap(json["data"]),
        success: json["success"] == null ? null : json["success"],
      );

  Map<String, dynamic> toMap() => {
        "data": data == null ? null : data!.toMap(),
        "success": success == null ? null : success,
      };
}

class LetsExploreData {
  LetsExploreData({
    this.items,
  });

  final List<dynamic>? items;

  LetsExploreData copyWith({
    List<dynamic>? books,
  }) =>
      LetsExploreData(
        items: books ?? this.items,
      );

  factory LetsExploreData.fromMap(Map<String, dynamic> json) => LetsExploreData(
        items: json["books"] == null
            ? json["video"] == null
                ? List<ExplorePackage>.from(
                    json["packages"].map((x) => ExplorePackage.fromMap(x)))
                : List<ExploreVideo>.from(
                    json["video"].map((x) => ExploreVideo.fromMap(x)))
            : List<ExploreBook>.from(
                json["books"].map((x) => ExploreBook.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "books": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}
