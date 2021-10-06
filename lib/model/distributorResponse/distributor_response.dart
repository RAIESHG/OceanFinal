// To parse this JSON data, do
//
//     final distributorResponse = distributorResponseFromJson(jsonString?);


import 'dart:convert';

DistributorResponse distributorResponseFromJson(String str) => DistributorResponse.fromJson(json.decode(str));

String? distributorResponseToJson(DistributorResponse data) => json.encode(data.toJson());

class DistributorResponse {
    DistributorResponse({
         this.status,
         this.data,
    });

    bool? status;
    List<DistributorData>? data;

    factory DistributorResponse.fromJson(Map<String?, dynamic> json) => DistributorResponse(
        status: json["status"],
        data: List<DistributorData>.from(json["data"].map((x) => DistributorData.fromJson(x))),
    );

    Map<String?, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),

    };
}

class DistributorData {
    DistributorData({
         this.id,
         this.name,
         this.slug,
         this.image,
         this.address,
         this.contactPerson,
         this.phoneNumber,
    });

    int? id;
    String? name;
    String? slug;
    String? image;
    String? address;
    String? contactPerson;
    String? phoneNumber;

    factory DistributorData.fromJson(Map<String?, dynamic> json) => DistributorData(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        address: json["address"],
        contactPerson: json["contact_person"],
        phoneNumber: json["phone_number"],
    );

    Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "address": address,
        "contact_person": contactPerson,
        "phone_number": phoneNumber,
    };
}
