import 'dart:convert';

import 'package:http/http.dart';

import '../Utils/helpers.dart';

final baseurl =
    "https://599d-2407-aa80-314-b27b-5d53-5b05-ab38-326e.ngrok-free.app/api/";

Future<Response> postCall(String endpoints, Map<String, dynamic> body) async {
  print("gggg${baseurl + endpoints}");
  return await post(Uri.parse(baseurl + endpoints),
      headers: <String, String>{
        "authorization": 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body));
}

Future<Response> patchCall(String endpoints, Map<String, dynamic> body) async {
  print("gggg${baseurl + endpoints}");
  print("token ${token}");
  return await patch(Uri.parse(baseurl + endpoints),
      headers: <String, String>{
        "authorization": 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body));
}

Future<Response> putCall(
    String endpoints, Map<String, dynamic> body, String param) async {
  return await put(Uri.parse(baseurl + endpoints + param),
      headers: <String, String>{"authorization": 'Bearer $token'}, body: body);
}

Future<Response> getCall(String endpoints, String parem) async {
  print("token iss $token");
  print("gggg${baseurl + endpoints + parem}");
  return await get(Uri.parse(baseurl + endpoints + parem),
      headers: <String, String>{
        "authorization": 'Bearer $token',
      });
}

Future<Response> deleteCall(String endPoint) async {
  return await delete(Uri.parse(baseurl + endPoint),
      headers: <String, String>{'authorization': 'Bearer $token'});
}

MultipartRequest mutlipartCall(String endPoint, {req = "POST"}) {
  var request = MultipartRequest(req, Uri.parse(baseurl + endPoint));
  request.headers.addAll(<String, String>{'authorization': 'Bearer $token'});
  return request;
}
