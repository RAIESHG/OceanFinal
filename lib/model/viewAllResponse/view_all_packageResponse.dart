// To parse this JSON data, do
//
//     final viewAllPackageResponse = viewAllPackageResponseFromMap(jsonString);

import 'dart:convert';

ViewAllPackageResponse viewAllPackageResponseFromMap(String str) => ViewAllPackageResponse.fromMap(json.decode(str));

String viewAllPackageResponseToMap(ViewAllPackageResponse data) => json.encode(data.toMap());

class ViewAllPackageResponse {
    ViewAllPackageResponse({
        this.status,
        this.data,
    });

    bool? status;
    Data? data;

    factory ViewAllPackageResponse.fromMap(Map<String, dynamic> json) => ViewAllPackageResponse(
        status: json["status"],
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "data": data!.toMap(),
    };
}

class Data {
    Data({
        this.packageData,
    });

    List<PackageDatum>? packageData;

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        packageData: List<PackageDatum>.from(json["packageData"].map((x) => PackageDatum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "packageData": List<dynamic>.from(packageData!.map((x) => x.toMap())),
    };
}

class PackageDatum {
    PackageDatum({
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
    PackageType? packageType;
    dynamic validTime;
    ValidTimeType? validTimeType;
    String? description;
    Status? status;
    dynamic purchasePrice;
    Type? type;

    factory PackageDatum.fromMap(Map<String, dynamic> json) => PackageDatum(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        price: json["price"],
        offerPrice: json["offer_price"],
        image: json["image"],
        packageType: packageTypeValues.map![json["package_type"]],
        validTime: json["valid_time"],
        validTimeType: validTimeTypeValues.map![json["valid_time_type"]],
        description: json["description"],
        status: statusValues.map![json["status"]],
        purchasePrice: json["purchase_price"],
        type: typeValues.map![json["type"]],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "slug": slug,
        "price": price,
        "offer_price": offerPrice,
        "image": image,
        "package_type": packageTypeValues.reverse![packageType],
        "valid_time": validTime,
        "valid_time_type": validTimeTypeValues.reverse![validTimeType],
        "description": description,
        "status": statusValues.reverse![status],
        "purchase_price": purchasePrice,
        "type": typeValues.reverse![type],
    };
}

enum PackageType { BOOK }

final packageTypeValues = EnumValues({
    "Book": PackageType.BOOK
});

enum Status { ACTIVE }

final statusValues = EnumValues({
    "Active": Status.ACTIVE
});

enum Type { PACKAGE }

final typeValues = EnumValues({
    "package": Type.PACKAGE
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
