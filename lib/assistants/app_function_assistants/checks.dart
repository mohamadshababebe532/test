import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ChecksFunctionAssistants {
  doGet(String url) async {
    if (kDebugMode) {
      print('====================');
      print('url for get in checks is $url');
      print('====================');
    }

    var response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print('====================');
      print('status code for get in checks is ${response.statusCode}');
      print(response.body);
      print(response.reasonPhrase);
      print('====================');
    }

    return response.body;
  }

  doCheckIn(String url, String date, String mood, String latitude,
      String longitude, String checkIn, String day) async {
    String device_id = await getDeviceId();
    Map<String, dynamic> body = {
      'date': date,
      'mood': mood,
      'latitude': latitude,
      'longitude': longitude,
      'check_in': checkIn,
      'day': day,
      'device_unique_id': device_id
    };

    if (kDebugMode) {
      print('========================');
      print('url for check in is $url');
      print('body for check in us $body');
      print('========================');
    }

    var response = await http.post(Uri.parse(url), body: body);

    if (kDebugMode) {
      print('===================================================');
      print('statues code for check in is ${response.statusCode}');
      print('===================================================');
    }
    return response;
  }

  Future<http.Response> doCheckOut(
      String url,
      String date,
      String mood,
      String latitude,
      String longitude,
      String checkIn,
      String checkId,
      String dayName) async {
    String device_id = await getDeviceId();
    Map<String, dynamic> body = {
      'date': date,
      'mood_check_out': mood,
      'check_out_latitude': latitude,
      'check_out_longitude': longitude,
      'check_out': checkIn,
      'check_id': checkId,
      'day': dayName,
      'device_unique_id': device_id
    };

    if (kDebugMode) {
      print('========================');
      print('url for check out is $url');
      print('body for check out us $body');
      print('========================');
    }

    var response = await http.post(Uri.parse(url), body: body);

    if (kDebugMode) {
      print('===================================================');
      print('statues code for check out is ${response.statusCode}');
      print('===================================================');
    }
    return response;
  }

  Future<http.Response> NewDoCheckOut(
      String url,
      String text,
      String date,
      String mood,
      String latitude,
      String longitude,
      String checkIn,
      String checkId,
      String dayName) async {
    String device_id = await getDeviceId();
    Map<String, dynamic> body = {
      'date': date,
      'mood_check_out': mood,
      'check_out_latitude': latitude,
      'check_out_longitude': longitude,
      'check_out': checkIn,
      'check_id': checkId,
      'day': dayName,
      'text': text,
      'device_unique_id': device_id
    };
    final respose = await http.post(Uri.parse(url), body: body);
    return respose;
  }
}

getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    print(androidDeviceInfo);
    return androidDeviceInfo.serialNumber; // unique ID on Android
  }
}
