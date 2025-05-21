
import 'package:laundry_app_laundry/Modela/user_model.dart';

class GetUsersModel {
    GetUsersModel({
        required this.data,
        required this.message,
        required this.status,
    });

    final List<Userdata> data;
    final String message;
    final int status;

    factory GetUsersModel.fromJson(Map<String, dynamic> json){ 
        return GetUsersModel(
            data: json["data"] == null ? [] : List<Userdata>.from(json["data"]!.map((x) => Userdata.fromJson(x))),
            message: json["message"] ?? "",
            status: json["status"] ?? 0,
        );
    }

}


