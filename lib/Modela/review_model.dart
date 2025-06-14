class ReviewModel {
    ReviewModel({
        required this.data,
        required this.message,
        required this.status,
    });

    final List<ReviewData> data;
    final String message;
    final int status;

    factory ReviewModel.fromJson(Map<String, dynamic> json){ 
        return ReviewModel(
            data: json["data"] == null ? [] : List<ReviewData>.from(json["data"]!.map((x) => ReviewData.fromJson(x))),
            message: json["message"] ?? "",
            status: json["status"] ?? 0,
        );
    }

}

class ReviewData {
    ReviewData({
        required this.id,
        required this.senderId,
        required this.receiverId,
        required this.rating,
        required this.review,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String id;
    final ErId? senderId;
    final ErId? receiverId;
    final int rating;
    final String review;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int v;

    factory ReviewData.fromJson(Map<String, dynamic> json){ 
        return ReviewData(
            id: json["_id"] ?? "",
            senderId: json["sender_id"] == null ? null : ErId.fromJson(json["sender_id"]),
            receiverId: json["receiver_id"] == null ? null : ErId.fromJson(json["receiver_id"]),
            rating: json["rating"] ?? 0,
            review: json["review"] ?? "",
            createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
            updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
            v: json["__v"] ?? 0,
        );
    }

}

class ErId {
    ErId({
        required this.id,
        required this.name,
        required this.profileImage,
    });

    final String id;
    final String name;
    final String profileImage;

    factory ErId.fromJson(Map<String, dynamic> json){ 
        return ErId(
            id: json["_id"] ?? "",
            name: json["name"] ?? "",
            profileImage: json["profile_image"] ?? "",
        );
    }

}
