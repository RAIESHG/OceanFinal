// To parse this JSON data, do
//
//     final homepageResponse = homepageResponseFromMap(jsonString);

import 'dart:convert';

HomepageResponse homepageResponseFromMap(String str) =>
    HomepageResponse.fromMap(json.decode(str));

String homepageResponseToMap(HomepageResponse data) =>
    json.encode(data.toMap());

class HomepageResponse {
  HomepageResponse({
    this.success,
    this.data,
  });

  final bool? success;
  final HomepageData? data;

  HomepageResponse copyWith({
    bool? success,
    HomepageData? data,
  }) =>
      HomepageResponse(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  factory HomepageResponse.fromMap(Map<String, dynamic> json) =>
      HomepageResponse(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : HomepageData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data!.toMap(),
      };
}

class HomepageData {
  HomepageData({
    this.banner,
    this.books,
    this.video,
    this.packages,
  });

  final List<Banners>? banner;
  final Book? books;
  final Video? video;
  final Package? packages;

  HomepageData copyWith({
    List<Banners>? banner,
    Book? books,
    Video? video,
    Package? packages,
  }) =>
      HomepageData(
        banner: banner ?? this.banner,
        books: books ?? this.books,
        video: video ?? this.video,
        packages: packages ?? this.packages,
      );

  factory HomepageData.fromMap(Map<String, dynamic> json) => HomepageData(
        banner: json["banner"] == null
            ? null
            : List<Banners>.from(json["banner"].map((x) => Banners.fromMap(x))),
        books: json["books"] == null ? null : Book.fromMap(json["books"]),
        video: json["video"] == null ? null : Video.fromMap(json["video"]),
        packages:
            json["packages"] == null ? null : Package.fromMap(json["packages"]),
      );

  Map<String, dynamic> toMap() => {
        "banner": banner == null
            ? null
            : List<dynamic>.from(banner!.map((x) => x.toMap())),
        "books": books == null ? null : books!.toMap(),
        "video": video == null ? null : video!.toMap(),
        "packages": packages == null ? null : packages!.toMap(),
      };
}

class Banners {
  Banners({
    this.id,
    this.name,
    this.image,
  });

  final int? id;
  final String? name;
  final String? image;

  Banners copyWith({
    int? id,
    String? name,
    String? image,
  }) =>
      Banners(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
      );

  factory Banners.fromMap(Map<String, dynamic> json) => Banners(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
      };
}

class Book {
  Book({
    this.heading,
    this.data,
  });

  final String? heading;
  final List<BookData>? data;

  Book copyWith({
    String? heading,
    List<BookData>? data,
  }) =>
      Book(
        heading: heading ?? this.heading,
        data: data ?? this.data,
      );

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        heading: json["heading"] == null ? null : json["heading"],
        data: json["data"] == null
            ? null
            : List<BookData>.from(json["data"].map((x) => BookData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "heading": heading == null ? null : heading,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class ExploreBook {
  ExploreBook({
    this.heading,
    this.data,
  });

  final String? heading;
  final List<BookData>? data;

  ExploreBook copyWith({
    String? heading,
    List<BookData>? data,
  }) =>
      ExploreBook(
        heading: heading ?? this.heading,
        data: data ?? this.data,
      );

  factory ExploreBook.fromMap(Map<String, dynamic> json) => ExploreBook(
        heading: json["heading"] == null ? null : json["heading"],
        data: json["bookData"] == null
            ? null
            : List<BookData>.from(
                json["bookData"].map((x) => BookData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "heading": heading == null ? null : heading,
        "bookData": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class BookData {
  BookData({
    this.id,
    this.title,
    this.categoryId,
    this.slug,
    this.book,
    this.position,
    this.image,
    this.price,
    this.offerPrice,
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
  });
  final int? id;
  final String? title;
  final int? categoryId;
  final String? slug;
  final String? book;
  final dynamic position;
  final String? image;
  final int? price;
  final int? offerPrice;
  final String? author;
  final dynamic isbnNo;
  final dynamic sku;
  final String? edition;
  final String? language;
  final dynamic description;
  final dynamic tableOfContent;
  final dynamic status;
  final String? digitalOrHardcopy;
  final int? quantity;

  BookData copyWith({
    int? id,
    String? title,
    int? categoryId,
    String? slug,
    String? book,
    dynamic position,
    String? image,
    int? price,
    int? offerPrice,
    String? author,
    dynamic isbnNo,
    dynamic sku,
    String? edition,
    String? language,
    dynamic description,
    dynamic tableOfContent,
    dynamic status,
    String? digitalOrHardcopy,
    int? quantity,
  }) =>
      BookData(
        id: id ?? this.id,
        title: title ?? this.title,
        categoryId: categoryId ?? this.categoryId,
        slug: slug ?? this.slug,
        book: book ?? this.book,
        position: position ?? this.position,
        image: image ?? this.image,
        price: price ?? this.price,
        offerPrice: offerPrice ?? this.offerPrice,
        author: author ?? this.author,
        isbnNo: isbnNo ?? this.isbnNo,
        sku: sku ?? this.sku,
        edition: edition ?? this.edition,
        language: language ?? this.language,
        description: description ?? this.description,
        tableOfContent: tableOfContent ?? this.tableOfContent,
        status: status ?? this.status,
        digitalOrHardcopy: digitalOrHardcopy ?? this.digitalOrHardcopy,
        quantity: quantity ?? this.quantity,
      );

  factory BookData.fromMap(Map<String, dynamic> json) => BookData(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        slug: json["slug"] == null ? null : json["slug"],
        book: json["book"] == null ? null : json["book"],
        position: json["position"],
        image: json["image"] == null ? null : json["image"],
        price: json["price"] == null ? null : json["price"],
        offerPrice: json["offer_price"] == null ? null : json["offer_price"],
        author: json["author"] == null ? null : json["author"],
        isbnNo: json["isbn_no"],
        sku: json["sku"],
        edition: json["edition"] == null ? null : json["edition"],
        language: json["language"] == null ? null : json["language"],
        description: json["description"],
        tableOfContent: json["table_of_content"],
        status: json["status"] == null ? null : json["status"],
        digitalOrHardcopy: json["digital_or_hardcopy"] == null
            ? null
            : json["digital_or_hardcopy"],
        quantity: json["quantity"] == null ? null : json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "category_id": categoryId == null ? null : categoryId,
        "slug": slug == null ? null : slug,
        "book": book == null ? null : book,
        "position": position,
        "image": image == null ? null : image,
        "price": price == null ? null : price,
        "offer_price": offerPrice == null ? null : offerPrice,
        "author": author == null ? null : author,
        "isbn_no": isbnNo,
        "sku": sku,
        "edition": edition == null ? null : edition,
        "language": language == null ? null : language,
        "description": description,
        "table_of_content": tableOfContent,
        "status": status == null ? null : status,
        "digital_or_hardcopy":
            digitalOrHardcopy == null ? null : digitalOrHardcopy,
        "quantity": quantity == null ? null : quantity,
      };
}

class Package {
  Package({
    this.heading,
    this.data,
  });

  final String? heading;
  final List<PackageData>? data;

  Package copyWith({
    String? heading,
    List<PackageData>? data,
  }) =>
      Package(
        heading: heading ?? this.heading,
        data: data ?? this.data,
      );

  factory Package.fromMap(Map<String, dynamic> json) => Package(
        heading: json["heading"] == null ? null : json["heading"],
        data: json["data"] == null
            ? null
            : List<PackageData>.from(
                json["data"].map((x) => PackageData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "heading": heading == null ? null : heading,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class ExplorePackage {
  ExplorePackage({
    this.heading,
    this.data,
  });

  final String? heading;
  final List<PackageData>? data;

  ExplorePackage copyWith({
    String? heading,
    List<PackageData>? data,
  }) =>
      ExplorePackage(
        heading: heading ?? this.heading,
        data: data ?? this.data,
      );

  factory ExplorePackage.fromMap(Map<String, dynamic> json) => ExplorePackage(
        heading: json["heading"] == null ? null : json["heading"],
        data: json["packageData"] == null
            ? null
            : List<PackageData>.from(
                json["packageData"].map((x) => PackageData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "heading": heading == null ? null : heading,
        "packageData": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class PackageData {
  PackageData({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.offerPrice,
    this.image,
    this.packageType,
    this.validTime,
    this.validTimeType,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.shortDescription,
  });

  final int? id;
  final String? title;
  final String? slug;
  final int? price;
  final int? offerPrice;
  final String? image;
  final String? packageType;
  final dynamic validTime;
  final String? validTimeType;
  final String? description;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? shortDescription;
  PackageData copyWith({
    int? id,
    String? title,
    String? slug,
    int? price,
    int? offerPrice,
    String? image,
    String? packageType,
    dynamic validTime,
    String? validTimeType,
    String? description,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? shortDescription,
  }) =>
      PackageData(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        price: price ?? this.price,
        offerPrice: offerPrice ?? this.offerPrice,
        image: image ?? this.image,
        packageType: packageType ?? this.packageType,
        validTime: validTime ?? this.validTime,
        validTimeType: validTimeType ?? this.validTimeType,
        description: description ?? this.description,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        shortDescription: shortDescription ?? this.shortDescription,
      );

  factory PackageData.fromMap(Map<String, dynamic> json) => PackageData(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        price: json["price"] == null ? null : json["price"],
        offerPrice: json["offer_price"] == null ? null : json["offer_price"],
        image: json["image"] == null ? null : json["image"],
        packageType: json["package_type"] == null ? null : json["package_type"],
        validTime: json["valid_time"],
        validTimeType:
            json["valid_time_type"] == null ? null : json["valid_time_type"],
        description: json["description"] == null ? null : json["description"],
        shortDescription: json["description"] == null
            ? ""
            : json["description"].toString().length > 650
                ? json["description"].replaceRange(650, null, "")
                : json["description"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "price": price == null ? null : price,
        "offer_price": offerPrice == null ? null : offerPrice,
        "image": image == null ? null : image,
        "package_type": packageType == null ? null : packageType,
        "valid_time": validTime,
        "valid_time_type": validTimeType == null ? null : validTimeType,
        "description": description == null ? null : description,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class ExploreVideo {
  ExploreVideo({
    this.heading,
    this.data,
  });

  final String? heading;
  final List<VideoData>? data;

  ExploreVideo copyWith({
    String? heading,
    List<VideoData>? data,
  }) =>
      ExploreVideo(
        heading: heading ?? this.heading,
        data: data ?? this.data,
      );

  factory ExploreVideo.fromMap(Map<String, dynamic> json) => ExploreVideo(
        heading: json["heading"] == null ? null : json["heading"],
        data: json["videoData"] == null
            ? null
            : List<VideoData>.from(
                json["videoData"].map((x) => VideoData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "heading": heading == null ? null : heading,
        "videoData": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Video {
  Video({
    this.heading,
    this.data,
  });

  final String? heading;
  final List<VideoData>? data;

  Video copyWith({
    String? heading,
    List<VideoData>? data,
  }) =>
      Video(
        heading: heading ?? this.heading,
        data: data ?? this.data,
      );

  factory Video.fromMap(Map<String, dynamic> json) => Video(
        heading: json["heading"] == null ? null : json["heading"],
        data: json["data"] == null
            ? null
            : List<VideoData>.from(
                json["data"].map((x) => VideoData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "heading": heading == null ? null : heading,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class VideoData {
  VideoData({
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
    this.shortDescription,
    this.status,
  });

  final int? id;
  final String? title;
  final int? categoryId;
  final String? slug;
  final int? price;
  final int? offerPrice;
  final String? video;
  final int? preview;
  final int? feature;
  final dynamic position;
  final String? image;
  final String? author;
  final String? time;
  final String? description;
  final String? tableOfContent;
  final String? status;
  final String? shortDescription;

  VideoData copyWith({
    int? id,
    String? title,
    int? categoryId,
    String? slug,
    String? shortDescription,
    int? price,
    int? offerPrice,
    String? video,
    int? preview,
    int? feature,
    dynamic position,
    String? image,
    String? author,
    String? time,
    String? description,
    String? tableOfContent,
    String? status,
  }) =>
      VideoData(
        id: id ?? this.id,
        title: title ?? this.title,
        categoryId: categoryId ?? this.categoryId,
        slug: slug ?? this.slug,
        price: price ?? this.price,
        offerPrice: offerPrice ?? this.offerPrice,
        video: video ?? this.video,
        preview: preview ?? this.preview,
        feature: feature ?? this.feature,
        position: position ?? this.position,
        image: image ?? this.image,
        author: author ?? this.author,
        time: time ?? this.time,
        description: description ?? this.description,
        shortDescription: shortDescription ?? this.shortDescription,
        tableOfContent: tableOfContent ?? this.tableOfContent,
        status: status ?? this.status,
      );

  factory VideoData.fromMap(Map<String, dynamic> json) => VideoData(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        slug: json["slug"] == null ? null : json["slug"],
        price: json["price"] == null ? null : json["price"],
        offerPrice: json["offer_price"] == null ? null : json["offer_price"],
        video: json["video"] == null ? null : json["video"],
        preview: json["preview"] == null ? null : json["preview"],
        feature: json["feature"] == null ? null : json["feature"],
        position: json["position"],
        image: json["image"] == null ? null : json["image"],
        author: json["author"] == null ? null : json["author"],
        time: json["time"] == null ? null : json["time"],
        description: json["description"] == null ? null : json["description"],
        tableOfContent:
            json["table_of_content"] == null ? null : json["table_of_content"],
        shortDescription: json["description"] == null
            ? ""
            : json["description"].toString().length > 650
                ? json["description"].replaceRange(650, null, "")
                : json["description"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "category_id": categoryId == null ? null : categoryId,
        "slug": slug == null ? null : slug,
        "price": price == null ? null : price,
        "offer_price": offerPrice == null ? null : offerPrice,
        "video": video == null ? null : video,
        "preview": preview == null ? null : preview,
        "feature": feature == null ? null : feature,
        "position": position,
        "image": image == null ? null : image,
        "author": author == null ? null : author,
        "time": time == null ? null : time,
        "description": description == null ? null : description,
        "table_of_content": tableOfContent == null ? null : tableOfContent,
        "status": status == null ? null : status,
      };
}
