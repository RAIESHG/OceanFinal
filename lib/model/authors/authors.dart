// To parse this JSON data, do
//
//     final author = authorFromMap(jsonString);

import 'dart:convert';

import '../homepageResponse/homepage_response.dart';

Author authorFromMap(String str) => Author.fromMap(json.decode(str));

String authorToMap(Author data) => json.encode(data.toMap());

class Author {
  Author({
    this.data,
  });

  final List<AuthorData>? data;

  Author copyWith({
    List<AuthorData>? data,
  }) =>
      Author(
        data: data ?? this.data,
      );

  factory Author.fromMap(Map<String, dynamic> json) => Author(
        data: json["data"] == null
            ? null
            : List<AuthorData>.from(
                json["data"].map((x) => AuthorData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class AuthorData {
  AuthorData({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.subjects,
  });

  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? subjects;

  AuthorData copyWith({
    int? id,
    String? name,
    String? slug,
    String? image,
    String? subjects,
  }) =>
      AuthorData(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        image: image ?? this.image,
        subjects: subjects ?? this.subjects,
      );

  factory AuthorData.fromMap(Map<String, dynamic> json) => AuthorData(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        image: json["image"] == null ? null : json["image"],
        subjects: json["subjects"] == null ? null : json["subjects"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "image": image == null ? null : image,
        "subjects": subjects == null ? null : subjects,
      };
}
