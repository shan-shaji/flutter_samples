import 'package:api_testing/api/resp_obj.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Api {
  String baseUrl = "";

  Future<RespObj> postData(String route, {String mBody, String header}) async {
    print("inside api");
    Map<String, String> mHeaders = {
      "Content-type": "application/json",
      "token": header
    };
    try {
      http.Response response =
          await http.post(baseUrl + route, headers: mHeaders, body: mBody);
      print(response.body);
      if (response.statusCode == 200) {
        return RespObj.fromJson(json.decode(response.body));
      } else {
        return RespObj(false, msg: response.body);
      }
    } catch (e) {
      print(e.toString());
      return RespObj(false, msg: "Server UnAvailable");
    }
  }
}
