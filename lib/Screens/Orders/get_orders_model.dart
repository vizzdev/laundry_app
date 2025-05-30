class GetOrdersModel {
  GetOrdersModel({
    required this.data,
    required this.message,
    required this.status,
  });

  final List<OrderData> data;
  final String message;
  final int status;

  factory GetOrdersModel.fromJson(Map<String, dynamic> json) {
    return GetOrdersModel(
      data: json["data"] == null
          ? []
          : List<OrderData>.from(
              json["data"]!.map((x) => OrderData.fromJson(x))),
      message: json["message"] ?? "",
      status: json["status"] ?? 0,
    );
  }
}

class OrderData {
  OrderData({
    required this.pickuplocation,
    required this.dropOfflocation,
    required this.id,
    required this.status,
    required this.orderBy,
    required this.receivedBy,
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
  });

  final Location? pickuplocation;
  final Location? dropOfflocation;
  final String id;
  final String status;
  final String orderBy;
  final String receivedBy;
  final Category? category;
  final String pickupLocation;
  final String pickupDatetime;
  final String dropoffLocation;
  final String dropoffDatetime;
  final List<String> selectedLaundries;
  final double weight;
  final String invoice;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int v;

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      pickuplocation: json["pickuplocation"] == null
          ? null
          : Location.fromJson(json["pickuplocation"]),
      dropOfflocation: json["dropOfflocation"] == null
          ? null
          : Location.fromJson(json["dropOfflocation"]),
      id: json["_id"] ?? "",
      status: json["status"] ?? "",
      orderBy: json["order_by"] ?? "",
      receivedBy: json["received_by"] ?? "",
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
      pickupLocation: json["pickup_location"] ?? "",
      pickupDatetime: json["pickup_datetime"] ?? "",
      dropoffLocation: json["dropoff_location"] ?? "",
      dropoffDatetime: json["dropoff_datetime"] ?? "",
      selectedLaundries: json["selected_laundries"] == null
          ? []
          : List<String>.from(json["selected_laundries"]!.map((x) => x)),
      weight: (json["weight"] is int)
          ? (json["weight"] as int).toDouble()
          : (json["weight"] is double)
              ? json["weight"]
              : 0.0,
      invoice: json["invoice"] ?? "",
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"] ?? 0,
    );
  }
}

class Category {
  Category({
    required this.title,
  });

  final String title;

  factory Category.fromJson(Map<String, dynamic> json) {
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

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json["type"] ?? "",
      coordinates: json["coordinates"] == null
          ? []
          : List<double>.from(json["coordinates"]!.map((x) => x)),
    );
  }
}
