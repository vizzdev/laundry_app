class GetOrdersModel {
    GetOrdersModel({
        required this.data,
        required this.message,
        required this.status,
    });

    final List<OrderData> data;
    final String message;
    final int status;

    factory GetOrdersModel.fromJson(Map<String, dynamic> json){ 
        return GetOrdersModel(
            data: json["data"] == null ? [] : List<OrderData>.from(json["data"]!.map((x) => OrderData.fromJson(x))),
            message: json["message"] ?? "",
            status: json["status"] ?? 0,
        );
    }

}

class OrderData {
    OrderData({
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
    final By? orderBy;
    final Category? category;
    final String pickupLocation;
    final String pickupDatetime;
    final String dropoffLocation;
    final String dropoffDatetime;
    final List<dynamic> selectedLaundries;
    final int weight;
    final String invoice;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int v;
    final By? receivedBy;

    factory OrderData.fromJson(Map<String, dynamic> json){ 
        return OrderData(
            pickuplocation: json["pickuplocation"] == null ? null : Location.fromJson(json["pickuplocation"]),
            dropOfflocation: json["dropOfflocation"] == null ? null : Location.fromJson(json["dropOfflocation"]),
            invoiceRequest: json["invoice_request"] == null ? null : InvoiceRequest.fromJson(json["invoice_request"]),
            id: json["_id"] ?? "",
            status: json["status"] ?? "",
            orderBy: json["order_by"] == null ? null : By.fromJson(json["order_by"]),
            category: json["category"] == null ? null : Category.fromJson(json["category"]),
            pickupLocation: json["pickup_location"] ?? "",
            pickupDatetime: json["pickup_datetime"] ?? "",
            dropoffLocation: json["dropoff_location"] ?? "",
            dropoffDatetime: json["dropoff_datetime"] ?? "",
            selectedLaundries: json["selected_laundries"] == null ? [] : List<dynamic>.from(json["selected_laundries"]!.map((x) => x)),
            weight: json["weight"] ?? 0,
            invoice: json["invoice"] ?? "",
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"] ?? 0,
            receivedBy: json["received_by"] == null ? null : By.fromJson(json["received_by"]),
        );
    }

}

class Category {
    Category({
        required this.title,
    });

    final String title;

    factory Category.fromJson(Map<String, dynamic> json){ 
        return Category(
            title: json["title"] ?? "",
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

    final String price;
    final String reason;

    factory InvoiceRequest.fromJson(Map<String, dynamic> json){ 
        return InvoiceRequest(
            price: json["price"] ?? "",
            reason: json["reason"] ?? "",
        );
    }

}

class By {
    By({
        required this.id,
        required this.email,
        required this.name,
        required this.profileImage,
    });

    final String id;
    final String email;
    final String name;
    final String profileImage;

    factory By.fromJson(Map<String, dynamic> json){ 
        return By(
            id: json["_id"] ?? "",
            email: json["email"] ?? "",
            name: json["name"] ?? "",
            profileImage: json["profile_image"] ?? "",
        );
    }

}
