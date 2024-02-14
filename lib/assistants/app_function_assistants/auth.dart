
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthFunctionAssistants {
  doLogin(String url, String email, String password) async{

    if (kDebugMode) {
      print("=========================================================");
      print("The URL of doLogin is: $url");
      print("=========================================================");
    }

    var response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print("The status code of doLogin is: ${response.statusCode}");
      print("=========================================================");
    }

    return response.body;
  }

  doResetPassword (String url, String email, String newPassword) async {
    Map<String, dynamic> body = {
      'email': email,
      'password': newPassword,
    };

    if (kDebugMode) {
      print("=========================================================");
      print("The URL of doLogin is: $url");
      print("The body of doLogin is: $body");
      print("=========================================================");
    }

    var response = await http.post(Uri.parse(url), body: body);

    if (kDebugMode) {
      print("The status code of doLogin is: ${response.statusCode}");
      print("=========================================================");
    }

    return response;
  }
}