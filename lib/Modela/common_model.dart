class Common {
  bool? success;
  String? message;

  Common({required this.success, required this.message});

  factory Common.fromJson(Map<String, dynamic> json) {
    // Handle both `success` and `status` fields
    bool isSuccess = false;
    if (json.containsKey('success')) {
      isSuccess = json['success'] == true;
    } else if (json.containsKey('status')) {
      isSuccess = json['status'] == 200;
    }

    return Common(
      success: isSuccess,
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}
