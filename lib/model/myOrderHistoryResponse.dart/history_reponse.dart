import 'dart:convert';

HistoryResponse historyResponseFromJson(String str) => HistoryResponse.fromJson(json.decode(str));

String historyResponseToJson(HistoryResponse data) => json.encode(data.toJson());

class HistoryResponse {
    HistoryResponse({
         this.status,
         this.data,
    });

    bool? status;
    List<HistoryData>? data;

    factory HistoryResponse.fromJson(Map<String, dynamic> json) => HistoryResponse(
        status: json["status"],
        data: List<HistoryData>.from(json["data"].map((x) => HistoryData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class HistoryData {
    HistoryData({
         this.id,
         this.userId,
         this.invoiceNo,
         this.grandTotal,
         this.paymentMethod,
    });

    int? id;
    int? userId;
    String? invoiceNo;
    int? grandTotal;
    String? paymentMethod;

    factory HistoryData.fromJson(Map<String, dynamic> json) => HistoryData(
        id: json["id"],
        userId: json["user_id"],
        invoiceNo: json["invoice_no"],
        grandTotal: json["grand_total"],
        paymentMethod: json["payment_method"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "invoice_no": invoiceNo,
        "grand_total": grandTotal,
        "payment_method": paymentMethod,
    };
}
