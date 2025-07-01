class NotificationModel {
    NotificationModel({
        required this.data,
        required this.message,
        required this.status,
    });

    final List<NotificationsData> data;
    final String message;
    final int status;

    factory NotificationModel.fromJson(Map<String, dynamic> json){ 
        return NotificationModel(
            data: json["data"] == null ? [] : List<NotificationsData>.from(json["data"]!.map((x) => NotificationsData.fromJson(x))),
            message: json["message"] ?? "",
            status: json["status"] ?? 0,
        );
    }

}

class NotificationsData {
    NotificationsData({
        required this.id,
        required this.userId,
        required this.title,
        required this.body,
        required this.data,
        required this.v,
    });

    final String id;
    final String userId;
    final String title;
    final String body;
    final Data? data;
    final int v;

    factory NotificationsData.fromJson(Map<String, dynamic> json){ 
        return NotificationsData(
            id: json["_id"] ?? "",
            userId: json["user_id"] ?? "",
            title: json["title"] ?? "",
            body: json["body"] ?? "",
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
            v: json["__v"] ?? 0,
        );
    }

}

class Data {
    Data({
        required this.pickuplocation,
        required this.dropOfflocation,
        required this.invoiceRequest,
        required this.id,
        required this.status,
        required this.orderBy,
        required this.category,
        required this.pickupLocation,
        required this.pickupDatetime,
        required this.dropoffLocation,
        required this.dropoffDatetime,
        required this.selectedLaundries,
        required this.weight,
        required this.invoice,
        required this.upfront,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.receivedBy,
    });

    final Location? pickuplocation;
    final Location? dropOfflocation;
    final InvoiceRequest? invoiceRequest;
    final String id;
    final String status;
    final String orderBy;
    final String category;
    final String pickupLocation;
    final String pickupDatetime;
    final String dropoffLocation;
    final String dropoffDatetime;
    final List<dynamic> selectedLaundries;
    final int weight;
    final int invoice;
    final int upfront;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int v;
    final String receivedBy;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            pickuplocation: json["pickuplocation"] == null ? null : Location.fromJson(json["pickuplocation"]),
            dropOfflocation: json["dropOfflocation"] == null ? null : Location.fromJson(json["dropOfflocation"]),
            invoiceRequest: json["invoice_request"] == null ? null : InvoiceRequest.fromJson(json["invoice_request"]),
            id: json["_id"] ?? "",
            status: json["status"] ?? "",
            orderBy: json["order_by"] ?? "",
            category: json["category"] ?? "",
            pickupLocation: json["pickup_location"] ?? "",
            pickupDatetime: json["pickup_datetime"] ?? "",
            dropoffLocation: json["dropoff_location"] ?? "",
            dropoffDatetime: json["dropoff_datetime"] ?? "",
            selectedLaundries: json["selected_laundries"] == null ? [] : List<dynamic>.from(json["selected_laundries"]!.map((x) => x)),
            weight: json["weight"] ?? 0,
            invoice: json["invoice"] ?? 0,
            upfront: json["upfront"] ?? 0,
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"] ?? 0,
            receivedBy: json["received_by"] ?? "",
        );
    }

}

class Location {
    Location({
        required this.type,
        required this.coordinates,
    });

    final String type;
    final List<double> coordinates;

    factory Location.fromJson(Map<String, dynamic> json){ 
        return Location(
            type: json["type"] ?? "",
            coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x)),
        );
    }

}

class InvoiceRequest {
    InvoiceRequest({
        required this.price,
        required this.reason,
    });

    final dynamic price;
    final String reason;

    factory InvoiceRequest.fromJson(Map<String, dynamic> json){ 
        return InvoiceRequest(
            price: json["price"],
            reason: json["reason"] ?? "",
        );
    }

}
