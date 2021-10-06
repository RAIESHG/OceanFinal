// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.data,
  });

  List<Datum>? data;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.categoryId,
    this.slug,
    this.price,
    this.offerPrice,
    this.book,
    this.position,
    this.image,
    this.author,
    this.isbnNo,
    this.sku,
    this.edition,
    this.language,
    this.description,
    this.tableOfContent,
    this.status,
    this.digitalOrHardcopy,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.video,
    this.preview,
    this.feature,
    this.time,
    this.packageType,
    this.validTime,
    this.validTimeType,
  });

  int? id;
  String? title;
  int? categoryId;
  String? slug;
  int? price;
  int? offerPrice;
  String? book;
  dynamic position;
  String? image;
  String? author;
  String? isbnNo;
  dynamic sku;
  String? edition;
  Language? language;
  String? description;
  String? tableOfContent;
  Status? status;
  DigitalOrHardcopy? digitalOrHardcopy;
  int? quantity;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? video;
  int? preview;
  int? feature;
  String? time;
  PackageType? packageType;
  dynamic validTime;
  ValidTimeType? validTimeType;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    slug: json["slug"],
    price: json["price"],
    offerPrice: json["offer_price"] == null ? null : json["offer_price"],
    book: json["book"] == null ? null : json["book"],
    position: json["position"],
    image: json["image"],
    author: json["author"] == null ? null : json["author"],
    isbnNo: json["isbn_no"] == null ? null : json["isbn_no"],
    sku: json["sku"],
    edition: json["edition"] == null ? null : json["edition"],
    language: json["language"] == null ? null : languageValues.map![json["language"]],
    description: json["description"] == null ? null : json["description"],
    tableOfContent: json["table_of_content"] == null ? null : json["table_of_content"],
    status: statusValues.map![json["status"]],
    digitalOrHardcopy: json["digital_or_hardcopy"] == null ? null : digitalOrHardcopyValues.map![json["digital_or_hardcopy"]],
    quantity: json["quantity"] == null ? null : json["quantity"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    video: json["video"] == null ? null : json["video"],
    preview: json["preview"] == null ? null : json["preview"],
    feature: json["feature"] == null ? null : json["feature"],
    time: json["time"] == null ? null : json["time"],
    packageType: json["package_type"] == null ? null : packageTypeValues.map![json["package_type"]],
    validTime: json["valid_time"],
    validTimeType: json["valid_time_type"] == null ? null : validTimeTypeValues.map![json["valid_time_type"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "category_id": categoryId == null ? null : categoryId,
    "slug": slug,
    "price": price,
    "offer_price": offerPrice == null ? null : offerPrice,
    "book": book == null ? null : book,
    "position": position,
    "image": image,
    "author": author == null ? null : author,
    "isbn_no": isbnNo == null ? null : isbnNo,
    "sku": sku,
    "edition": edition == null ? null : edition,
    "language": language == null ? null : languageValues.reverse![language],
    "description": description == null ? null : description,
    "table_of_content": tableOfContent == null ? null : tableOfContent,
    "status": statusValues.reverse![status],
    "digital_or_hardcopy": digitalOrHardcopy == null ? null : digitalOrHardcopyValues.reverse![digitalOrHardcopy],
    "quantity": quantity == null ? null : quantity,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "deleted_at": deletedAt,
    "video": video == null ? null : video,
    "preview": preview == null ? null : preview,
    "feature": feature == null ? null : feature,
    "time": time == null ? null : time,
    "package_type": packageType == null ? null : packageTypeValues.reverse![packageType],
    "valid_time": validTime,
    "valid_time_type": validTimeType == null ? null : validTimeTypeValues.reverse![validTimeType],
  };
}

enum DigitalOrHardcopy { DIGITAL_COPY }

final digitalOrHardcopyValues = EnumValues({
  "DigitalCopy": DigitalOrHardcopy.DIGITAL_COPY
});

enum Language { ENGLISH, NEPALI, ENGLISH_NEPALI }

final languageValues = EnumValues({
  "English": Language.ENGLISH,
  "English, Nepali": Language.ENGLISH_NEPALI,
  "Nepali": Language.NEPALI
});

enum PackageType { BOOK }

final packageTypeValues = EnumValues({
  "Book": PackageType.BOOK
});

enum Status { ACTIVE }

final statusValues = EnumValues({
  "Active": Status.ACTIVE
});

enum ValidTimeType { DAY }

final validTimeTypeValues = EnumValues({
  "Day": ValidTimeType.DAY
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
