// To parse this JSON data, do
//
//     final item = itemFromMap(jsonString);

import 'dart:convert';

Item itemFromMap(String str) => Item.fromMap(json.decode(str));

String itemToMap(Item data) => json.encode(data.toMap());

class Item {
  Item({
    this.message,
    this.error,
    this.code,
    this.results,
  });

  final String? message;
  final bool? error;
  final int? code;
  final Results? results;

  Item copyWith({
    String? message,
    bool? error,
    int? code,
    Results? results,
  }) =>
      Item(
        message: message ?? this.message,
        error: error ?? this.error,
        code: code ?? this.code,
        results: results ?? this.results,
      );

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        message: json["message"] == null ? null : json["message"],
        error: json["error"] == null ? null : json["error"],
        code: json["code"] == null ? null : json["code"],
        results:
            json["results"] == null ? null : Results.fromMap(json["results"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message == null ? null : message,
        "error": error == null ? null : error,
        "code": code == null ? null : code,
        "results": results == null ? null : results!.toMap(),
      };
}

class Results {
  Results({
    this.books,
    this.categories,
  });

  final List<Book>? books;
  final List<Category>? categories;

  Results copyWith({
    List<Book>? books,
    List<Category>? categories,
  }) =>
      Results(
        books: books ?? this.books,
        categories: categories ?? this.categories,
      );

  factory Results.fromMap(Map<String, dynamic> json) => Results(
        books: json["books"] == null
            ? null
            : List<Book>.from(json["books"].map((x) => Book.fromMap(x))),
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "books": books == null
            ? null
            : List<dynamic>.from(books!.map((x) => x.toMap())),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x.toMap())),
      };
}

class Book {
  Book({
    this.title,
    this.categoryId,
    this.slug,
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
  });

  final String? title;
  final int? categoryId;
  final String? slug;
  final String? book;
  final dynamic position;
  final String? image;
  final String? author;
  final String? isbnNo;
  final String? sku;
  final String? edition;
  final String? language;
  final dynamic description;
  final dynamic tableOfContent;
  final Status? status;
  final String? digitalOrHardcopy;
  final int ? quantity;

  Book copyWith({
    String? title,
    int? categoryId,
    String? slug,
    String? book,
    dynamic position,
    String? image,
    String? author,
    String? isbnNo,
    String? sku,
    String? edition,
    String? language,
    dynamic description,
    dynamic tableOfContent,
    Status? status,
    String? digitalOrHardcopy,
    int? quantity,
  }) =>
      Book(
        title: title ?? this.title,
        categoryId: categoryId ?? this.categoryId,
        slug: slug ?? this.slug,
        book: book ?? this.book,
        position: position ?? this.position,
        image: image ?? this.image,
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

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        title: json["title"] == null ? null : json["title"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        slug: json["slug"] == null ? null : json["slug"],
        book: json["book"] == null ? null : json["book"],
        position: json["position"],
        image: json["image"] == null ? null : json["image"],
        author: json["author"] == null ? null : json["author"],
        isbnNo: json["isbn_no"] == null ? null : json["isbn_no"],
        sku: json["sku"] == null ? null : json["sku"],
        edition: json["edition"] == null ? null : json["edition"],
        language: json["language"] == null ? null : json["language"],
        description: json["description"],
        tableOfContent: json["table_of_content"],
        status:
            json["status"] == null ? null : statusValues.map![json["status"]],
        digitalOrHardcopy: json["digital_or_hardcopy"] == null
            ? null
            : json["digital_or_hardcopy"],
        quantity: json["quantity"] == null ? null : json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "category_id": categoryId == null ? null : categoryId,
        "slug": slug == null ? null : slug,
        "book": book == null ? null : book,
        "position": position,
        "image": image == null ? null : image,
        "author": author == null ? null : author,
        "isbn_no": isbnNo == null ? null : isbnNo,
        "sku": sku == null ? null : sku,
        "edition": edition == null ? null : edition,
        "language": language == null ? null : language,
        "description": description,
        "table_of_content": tableOfContent,
        "status": status == null ? null : statusValues.reverse![status],
        "digital_or_hardcopy":
            digitalOrHardcopy == null ? null : digitalOrHardcopy,
        "quantity": quantity == null ? null : quantity,
      };
}

enum Status { ACTIVE, INACTIVE }

final statusValues =
    EnumValues({"Active": Status.ACTIVE, "Inactive": Status.INACTIVE});

class Category {
  Category({
    this.id,
    this.title,
    this.slug,
    this.parentId,
    this.icon,
    this.image,
    this.status,
    this.description,
    this.childs,
  });

  final int? id;
  final String? title;
  final String? slug;
  final int? parentId;
  final String? icon;
  final dynamic image;
  final Status? status;
  final String? description;
  final List<Category>? childs;

  Category copyWith({
    int? id,
    String? title,
    String ? slug,
    int? parentId,
    String? icon,
    dynamic image,
    Status? status,
    String ?description,
    List<Category>? childs,
  }) =>
      Category(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        parentId: parentId ?? this.parentId,
        icon: icon ?? this.icon,
        image: image ?? this.image,
        status: status ?? this.status,
        description: description ?? this.description,
        childs: childs ?? this.childs,
      );

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        icon: json["icon"] == null ? null : json["icon"],
        image: json["image"],
        status:
            json["status"] == null ? null : statusValues.map![json["status"]],
        description: json["description"] == null ? null : json["description"],
        childs: json["childs"] == null
            ? null
            : List<Category>.from(
                json["childs"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "parent_id": parentId == null ? null : parentId,
        "icon": icon == null ? null : icon,
        "image": image,
        "status": status == null ? null : statusValues.reverse![status],
        "description": description == null ? null : description,
        "childs": childs == null
            ? null
            : List<dynamic>.from(childs!.map((x) => x.toMap())),
      };
}

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
