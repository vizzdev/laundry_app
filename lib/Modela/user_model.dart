class UserModel {
    UserModel({
        required this.data,
        required this.message,
        required this.status,
    });

    final Userdata? data;
    final String message;
    final int status;

    factory UserModel.fromJson(Map<String, dynamic> json){ 
        return UserModel(
            data: json["data"] == null ? null : Userdata.fromJson(json["data"]),
            message: json["message"] ?? "",
            status: json["status"] ?? 0,
        );
    }

}

class Userdata {
    Userdata({
        required this.email,
        required this.name,
        required this.profileImage,
        required this.address,
        required this.rating,
        required this.orders,
        required this.deviceToken,
        required this.role,
        required this.location,
        required this.id,
        required this.v,
        required this.token,
    });

     String email;
     String name;
     String profileImage;
     String address;
     int rating;
     int orders;
     List<dynamic> deviceToken;
     int role;
     Location? location;
     String id;
     int v;
     String token;

    factory Userdata.fromJson(Map<String, dynamic> json){ 
        return Userdata(
            email: json["email"] ?? "",
            name: json["name"] ?? "",
            profileImage: json["profile_image"] ?? "",
            address: json["address"] ?? "",
            rating: json["rating"] ?? 0,
            orders: json["orders"] ?? 0,
            deviceToken: json["deviceToken"] == null ? [] : List<dynamic>.from(json["deviceToken"]!.map((x) => x)),
            role: json["role"] ?? 0,
            location: json["location"] == null ? null : Location.fromJson(json["location"]),
            id: json["_id"] ?? "",
            v: json["__v"] ?? 0,
            token: json["token"] ?? "",
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
            coordinates: json["coordinates"] == null ||json["coordinates"] == [0,0] ? [] : List<double>.from(json["coordinates"]!.map((x) => x)),
        );
    }

}
