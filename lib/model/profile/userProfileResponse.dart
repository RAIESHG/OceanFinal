// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);


import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
    ProfileResponse({
         this.status,
         this.data,
    });

    bool? status;
    ProfileData? data;

    factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
        status: json["status"],
        data: ProfileData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class ProfileData {
    ProfileData({
         this.id,
         this.firstName,
         this.lastName,
         this.image,
         this.email,
         this.phone,
         this.address,
    });

    int? id;
    String? firstName;
    String? lastName;
    String? image;
    String? email;
    dynamic phone;
    dynamic address;

    factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: json["image"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "image": image,
        "email": email,
        "phone": phone,
        "address": address,
    };
}
