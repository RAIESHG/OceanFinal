// To parse this JSON data, do
//
//     final allCoursesResponse = allCoursesResponseFromJson(jsonString);

import 'dart:convert';

AllCoursesResponse allCoursesResponseFromJson(String str) => AllCoursesResponse.fromJson(json.decode(str));

String allCoursesResponseToJson(AllCoursesResponse data) => json.encode(data.toJson());

class AllCoursesResponse {
    AllCoursesResponse({
        this.status,
        this.data,
    });

    bool? status;
    AllCourseData? data;

    factory AllCoursesResponse.fromJson(Map<String, dynamic> json) => AllCoursesResponse(
        status: json["status"],
        data: AllCourseData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class AllCourseData {
    AllCourseData({
        this.videos,
        this.books,
        this.packages,
    });

    List<Video>? videos;
    List<Book>? books;
    List<Package>? packages;

    factory AllCourseData.fromJson(Map<String, dynamic> json) => AllCourseData(
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
        packages: List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "videos": List<dynamic>.from(videos!.map((x) => x.toJson())),
        "books": List<dynamic>.from(books!.map((x) => x.toJson())),
        "packages": List<dynamic>.from(packages!.map((x) => x.toJson())),
    };
}

class Book {
    Book({
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
        this.purchasePrice,
        this.type,
    });

    int? id;
    String? title;
    int? categoryId;
    String? slug;
    String? book;
    dynamic position;
    String? image;
    int? price;
    dynamic offerPrice;
    String? author;
    String? isbnNo;
    dynamic sku;
    String? edition;
    String? language;
    dynamic description;
    String? tableOfContent;
    String? status;
    String? digitalOrHardcopy;
    int? quantity;
    int? purchasePrice;
    String? type;

    factory Book.fromJson(Map<String?, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        categoryId: json["category_id"],
        slug: json["slug"],
        book: json["book"],
        position: json["position"],
        image: json["image"],
        price: json["price"],
        offerPrice: json["offer_price"],
        author: json["author"],
        isbnNo: json["isbn_no"],
        sku: json["sku"],
        edition: json["edition"],
        language: json["language"],
        description: json["description"],
        tableOfContent: json["table_of_content"],
        status: json["status"],
        digitalOrHardcopy: json["digital_or_hardcopy"],
        quantity: json["quantity"],
        purchasePrice: json["purchase_price"],
        type: json["type"],
    );

    Map<String?, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category_id": categoryId,
        "slug": slug,
        "book": book,
        "position": position,
        "image": image,
        "price": price,
        "offer_price": offerPrice,
        "author": author,
        "isbn_no": isbnNo,
        "sku": sku,
        "edition": edition,
        "language": language,
        "description": description,
        "table_of_content": tableOfContent,
        "status": status,
        "digital_or_hardcopy": digitalOrHardcopy,
        "quantity": quantity,
        "purchase_price": purchasePrice,
        "type": type,
    };
}

class Package {
    Package({
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
        this.purchasePrice,
        this.type,
    });

    int? id;
    String? title;
    String? slug;
    int? price;
    int? offerPrice;
    String? image;
    String? packageType;
    dynamic validTime;
    String? validTimeType;
    String? description;
    String? status;
    int? purchasePrice;
    String? type;

    factory Package.fromJson(Map<String?, dynamic> json) => Package(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        price: json["price"],
        offerPrice: json["offer_price"],
        image: json["image"],
        packageType: json["package_type"],
        validTime: json["valid_time"],
        validTimeType: json["valid_time_type"],
        description: json["description"],
        status: json["status"],
        purchasePrice: json["purchase_price"],
        type: json["type"],
    );

    Map<String?, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "price": price,
        "offer_price": offerPrice,
        "image": image,
        "package_type": packageType,
        "valid_time": validTime,
        "valid_time_type": validTimeType,
        "description": description,
        "status": status,
        "purchase_price": purchasePrice,
        "type": type,
    };
}

class Video {
    Video({
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
    String? status;
    int? purchasePrice;
    String? type;

    factory Video.fromJson(Map<String?, dynamic> json) => Video(
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
        status: json["status"],
        purchasePrice: json["purchase_price"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
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
        "status": status,
        "purchase_price": purchasePrice,
        "type": type,
    };
}
