// To parse this JSON data, do
//
//     final userProfile = userProfileFromMap(jsonString);

import 'dart:convert';



import 'package:ocean_publication/constants.dart';

import '../../helpers/requests.dart';

UserProfile userProfileFromMap(String str) =>
    UserProfile.fromMap(json.decode(str));

String userProfileToMap(UserProfile data) => json.encode(data.toMap());

class UserProfile {
  UserProfile({
    this.id,
    this.email,
    this.permissions,
    this.lastLogin,
    this.firstName,
    this.lastName,
    this.image,
    this.phone,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? email;
  final dynamic permissions;
  final DateTime? lastLogin;
  final String? firstName;
  final String? lastName;
  final String? image;
  final String? phone;
  final dynamic address;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserProfile copyWith({
    int? id,
    String? email,
    dynamic permissions,
    DateTime? lastLogin,
    String? firstName,
    String? lastName,
    String? image,
    String? phone,
    dynamic address,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserProfile(
        id: id ?? this.id,
        email: email ?? this.email,
        permissions: permissions ?? this.permissions,
        lastLogin: lastLogin ?? this.lastLogin,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        image: image ?? this.image,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserProfile.fromMap(Map<String, dynamic> json) => UserProfile(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        permissions: json["permissions"],
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        image: json["image"] == null ? null : baseUrl + json["image"],
        phone: json["phone"] == null ? null : json["phone"],
        address: json["address"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "permissions": permissions,
        "last_login": lastLogin == null ? null : lastLogin!.toIso8601String(),
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "image": image == null ? null : image,
        "phone": phone == null ? null : phone,
        "address": address,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
