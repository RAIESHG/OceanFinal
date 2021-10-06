// To parse this JSON data, do
//
//     final authResponse = authResponseFromMap(jsonString);

import 'dart:convert';

AuthResponse authResponseFromMap(String str) =>
    AuthResponse.fromMap(json.decode(str));

String authResponseToMap(AuthResponse data) => json.encode(data.toMap());

class AuthResponse {
  AuthResponse({
     this.token,
     this.message,
     this.user,
     this.status,
  });

  final String? token;
  final String? message;
  final User? user;
  final bool? status;

  AuthResponse copyWith({
     String? token,
     String? message,
     User? user,
     bool? status,
  }) =>
      AuthResponse(
        token: token ?? this.token,
        message: message ?? this.message,
        user: user ?? this.user,
        status: status ?? this.status,
      );

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        token: json["token"] == null ? null : json["token"],
        message: json["message"] == null ? null : json["message"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toMap() => {
        "token": token == null ? null : token,
        "message": message == null ? null : message,
        "user": user == null ? null : user!.toMap(),
        "status": status == null ? null : status,
      };
}

class User {
  User({
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
  final dynamic? permissions;
  final DateTime? lastLogin;
  final String? firstName;
  final String? lastName;
  final dynamic? image;
  final dynamic? phone;
  final dynamic? address;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User copyWith({
    int? id,
    String? email,
    dynamic? permissions,
    DateTime? lastLogin,
    String? firstName,
    String? lastName,
    dynamic? image,
    dynamic? phone,
    dynamic? address,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      User(
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

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        permissions: json["permissions"],
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        image: json["image"],
        phone: json["phone"],
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
        "image": image,
        "phone": phone,
        "address": address,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
