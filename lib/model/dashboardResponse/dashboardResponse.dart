// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

import 'dart:convert';

DashboardResponse dashboardResponseFromJson(String str) => DashboardResponse.fromJson(json.decode(str));

String dashboardResponseToJson(DashboardResponse data) => json.encode(data.toJson());

class DashboardResponse {
    DashboardResponse({
         this.status,
         this.data,
    });

    bool? status;
    DashBoardData? data;

    factory DashboardResponse.fromJson(Map<String, dynamic> json) => DashboardResponse(
        status: json["status"],
        data: DashBoardData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class DashBoardData {
    DashBoardData({
         this.totalSaveCourse,
         this.totalPurchaseCourse,
         this.notifications,
    });

    int? totalSaveCourse;
    int? totalPurchaseCourse;
    List<Notification>? notifications;

    factory DashBoardData.fromJson(Map<String, dynamic> json) => DashBoardData(
        totalSaveCourse: json["total_save_course"],
        totalPurchaseCourse: json["total_purchase_course"],
        notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_save_course": totalSaveCourse,
        "total_purchase_course": totalPurchaseCourse,
        "notifications": List<dynamic>.from(notifications!.map((x) => x.toJson())),
    };
}

class Notification {
    Notification({
         this.title,
         this.date,
         this.paymentMethod,
         this.amount,
         this.id,
    });

    String? title;
    String? date;
    String? paymentMethod;
    int? amount;
    int? id;

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        title: json["title"],
        date: json["date"],
        paymentMethod: json["payment_method"],
        amount: json["amount"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "date": date,
        "payment_method": paymentMethod,
        "amount": amount,
        "id": id,
    };
}
