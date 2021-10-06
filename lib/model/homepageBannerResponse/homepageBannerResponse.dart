// To parse this JSON data, do
//
//     final homepageBannerResponse = homepageBannerResponseFromJson(jsonString);


import 'dart:convert';

HomepageBannerResponse homepageBannerResponseFromJson(String str) => HomepageBannerResponse.fromJson(json.decode(str));

String homepageBannerResponseToJson(HomepageBannerResponse data) => json.encode(data.toJson());

class HomepageBannerResponse {
    HomepageBannerResponse({
         this.data,
         this.success,
    });

    List<Datum>? data;
    bool? success;

    factory HomepageBannerResponse.fromJson(Map<String, dynamic> json) => HomepageBannerResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
    };
}

class Datum {
    Datum({
         this.id,
         this.name,
         this.image,
    });

    int? id;
    String? name;
    String? image;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}
