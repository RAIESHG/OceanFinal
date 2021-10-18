// To parse this JSON data, do
//
//     final viewAllBookResponse = viewAllBookResponseFromMap(jsonString?);

import 'dart:convert';

ViewAllBookResponse viewAllBookResponseFromMap(String? str) => ViewAllBookResponse.fromMap(json.decode(str!));

String? viewAllBookResponseToMap(ViewAllBookResponse data) => json.encode(data.toMap());

class ViewAllBookResponse {
    ViewAllBookResponse({
        this.message,
        this.status,
        this.code,
        this.data,
    });

    String? message;
    bool? status;
    int? code;
    Data? data;

    factory ViewAllBookResponse.fromMap(Map<String?, dynamic> json) => ViewAllBookResponse(
        message: json["message"],
        status: json["status"],
        code: json["code"],
        data: Data.fromMap(json["data"]),
    );

    Map<String?, dynamic> toMap() => {
        "message": message,
        "status": status,
        "code": code,
        "data": data!.toMap(),
    };
}

class Data {
    Data({
        this.books,
        this.categories,
    });

    List<Book>? books;
    List<Category>? categories;

    factory Data.fromMap(Map<String?, dynamic> json) => Data(
        books: List<Book>.from(json["books"].map((x) => Book.fromMap(x))),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromMap(x))),
    );

    Map<String?, dynamic> toMap() => {
        "books": List<dynamic>.from(books!.map((x) => x.toMap())),
        "categories": List<dynamic>.from(categories!.map((x) => x.toMap())),
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
    int? offerPrice;
    String? author;
    String? isbnNo;
    dynamic sku;
    String? edition;
    Language? language;
    dynamic description;
    String? tableOfContent;
    Status? status;
    DigitalOrHardcopy? digitalOrHardcopy;
    int? quantity;
    dynamic purchasePrice;
    Type? type;

    factory Book.fromMap(Map<String?, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        categoryId: json["category_id"],
        slug: json["slug"],
        book: json["book"],
        position: json["position"],
        image: json["image"],
        price: json["price"],
        offerPrice: json["offer_price"] == null ? null : json["offer_price"],
        author: json["author"],
        isbnNo: json["isbn_no"] == null ? null : json["isbn_no"],
        sku: json["sku"],
        edition: json["edition"],
        language: languageValues.map![json["language"]],
        description: json["description"],
        tableOfContent: json["table_of_content"] == null ? null : json["table_of_content"],
        status: statusValues.map![json["status"]],
        digitalOrHardcopy: digitalOrHardcopyValues.map![json["digital_or_hardcopy"]],
        quantity: json["quantity"] == null ? null : json["quantity"],
        purchasePrice: json["purchase_price"],
        type: typeValues.map![json["type"]],
    );

    Map<String?, dynamic> toMap() => {
        "id": id,
        "title": title,
        "category_id": categoryId,
        "slug": slug,
        "book": book,
        "position": position,
        "image": image,
        "price": price,
        "offer_price": offerPrice == null ? null : offerPrice,
        "author": author,
        "isbn_no": isbnNo == null ? null : isbnNo,
        "sku": sku,
        "edition": edition,
        "language": languageValues.reverse[language],
        "description": description,
        "table_of_content": tableOfContent == null ? null : tableOfContent,
        "status": statusValues.reverse[status],
        "digital_or_hardcopy": digitalOrHardcopyValues.reverse[digitalOrHardcopy],
        "quantity": quantity == null ? null : quantity,
        "purchase_price": purchasePrice,
        "type": typeValues.reverse[type],
    };
}

enum DigitalOrHardcopy { DIGITAL_COPY }

final digitalOrHardcopyValues = EnumValues({
    "DigitalCopy": DigitalOrHardcopy.DIGITAL_COPY
});

enum Language { ENGLISH, NEPALI, ENGLISH_NEPALI }

final languageValues = EnumValues({
    "English": Language.ENGLISH,
    "English, Nepali": Language.ENGLISH_NEPALI,
    "Nepali": Language.NEPALI
});

enum Status { ACTIVE }

final statusValues = EnumValues({
    "Active": Status.ACTIVE
});

enum Type { BOOK }

final typeValues = EnumValues({
    "book": Type.BOOK
});

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

    int? id;
    String? title;
    String? slug;
    int? parentId;
    dynamic icon;
    String? image;
    Status? status;
    dynamic description;
    List<Category>? childs;

    factory Category.fromMap(Map<String?, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        parentId: json["parent_id"],
        icon: json["icon"],
        image: json["image"],
        status: statusValues.map![json["status"]],
        description: json["description"],
        childs: List<Category>.from(json["childs"].map((x) => Category.fromMap(x))),
    );

    Map<String?, dynamic> toMap() => {
        "id": id,
        "title": title,
        "slug": slug,
        "parent_id": parentId,
        "icon": icon,
        "image": image,
        "status": statusValues.reverse[status],
        "description": description,
        "childs": List<dynamic>.from(childs!.map((x) => x.toMap())),
    };
}

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String?> get reverse {
        if (reverseMap == null) {
            reverseMap = map!.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
