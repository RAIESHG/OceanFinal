// To parse this JSON data, do
//
//     final historyIdResponse = historyIdResponseFromJson(jsonString);


import 'dart:convert';

HistoryIdResponse historyIdResponseFromJson(String str) => HistoryIdResponse.fromJson(json.decode(str));

String historyIdResponseToJson(HistoryIdResponse data) => json.encode(data.toJson());

class HistoryIdResponse {
    HistoryIdResponse({
         this.status,
         this.data,
    });

    bool? status;
    HistoryIdData? data;

    factory HistoryIdResponse.fromJson(Map<String, dynamic> json) => HistoryIdResponse(
        status: json["status"],
        data: HistoryIdData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class HistoryIdData {
    HistoryIdData({
         this.id,
         this.userId,
         this.invoiceNo,
         this.grandTotal,
         this.paymentMethod,
         this.orderItems,
    });

    int? id;
    int? userId;
    String? invoiceNo;
    int? grandTotal;
    String? paymentMethod;
    List<OrderItem>? orderItems;

    factory HistoryIdData.fromJson(Map<String, dynamic> json) => HistoryIdData(
        id: json["id"],
        userId: json["user_id"],
        invoiceNo: json["invoice_no"],
        grandTotal: json["grand_total"],
        paymentMethod: json["payment_method"],
        orderItems: List<OrderItem>.from(json["order_items"].map((x) => OrderItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "invoice_no": invoiceNo,
        "grand_total": grandTotal,
        "payment_method": paymentMethod,
        "order_items": List<dynamic>.from(orderItems!.map((x) => x.toJson())),
    };
}

class OrderItem {
    OrderItem({
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
         this.video,
         this.preview,
         this.feature,
         this.time,
         this.packageType,
         this.validTime,
         this.validTimeType,
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
    String? language;
    String? description;
    String? tableOfContent;
    String? status;
    String? digitalOrHardcopy;
    int? quantity;
    dynamic purchasePrice;
    String? type;
    String? video;
    int? preview;
    int? feature;
    String? time;
    String? packageType;
    dynamic validTime;
    String? validTimeType;

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        title: json["title"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        slug: json["slug"],
        book: json["book"] == null ? null : json["book"],
        position: json["position"],
        image: json["image"],
        price: json["price"],
        offerPrice: json["offer_price"] == null ? null : json["offer_price"],
        author: json["author"] == null ? null : json["author"],
        isbnNo: json["isbn_no"] == null ? null : json["isbn_no"],
        sku: json["sku"],
        edition: json["edition"] == null ? null : json["edition"],
        language: json["language"] == null ? null : json["language"],
        description: json["description"] == null ? null : json["description"],
        tableOfContent: json["table_of_content"] == null ? null : json["table_of_content"],
        status: json["status"],
        digitalOrHardcopy: json["digital_or_hardcopy"] == null ? null : json["digital_or_hardcopy"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        purchasePrice: json["purchase_price"],
        type: json["type"],
        video: json["video"] == null ? null : json["video"],
        preview: json["preview"] == null ? null : json["preview"],
        feature: json["feature"] == null ? null : json["feature"],
        time: json["time"] == null ? null : json["time"],
        packageType: json["package_type"] == null ? null : json["package_type"],
        validTime: json["valid_time"],
        validTimeType: json["valid_time_type"] == null ? null : json["valid_time_type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category_id": categoryId == null ? null : categoryId,
        "slug": slug,
        "book": book == null ? null : book,
        "position": position,
        "image": image,
        "price": price,
        "offer_price": offerPrice == null ? null : offerPrice,
        "author": author == null ? null : author,
        "isbn_no": isbnNo == null ? null : isbnNo,
        "sku": sku,
        "edition": edition == null ? null : edition,
        "language": language == null ? null : language,
        "description": description == null ? null : description,
        "table_of_content": tableOfContent == null ? null : tableOfContent,
        "status": status,
        "digital_or_hardcopy": digitalOrHardcopy == null ? null : digitalOrHardcopy,
        "quantity": quantity == null ? null : quantity,
        "purchase_price": purchasePrice,
        "type": type,
        "video": video == null ? null : video,
        "preview": preview == null ? null : preview,
        "feature": feature == null ? null : feature,
        "time": time == null ? null : time,
        "package_type": packageType == null ? null : packageType,
        "valid_time": validTime,
        "valid_time_type": validTimeType == null ? null : validTimeType,
    };
}
