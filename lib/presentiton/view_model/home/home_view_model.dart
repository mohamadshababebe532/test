// ignore_for_file: must_call_super

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
 
import 'package:overlay_support/overlay_support.dart';

import '../../../assistants/app_constants_assistatnts/app_constants_urls.dart';
import '../../../core/storage/holool_data.dart';

class HomeViewModel extends ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
    notifyListeners();
  }
  String _is_accountant = '';
  String get is_accounter => _is_accountant;
  set is_accounter(String value) {
    _is_accountant = value;
    notifyListeners();
  }
  String _role = '';
  String get role => _role;
  set role(String value) {
    _role = value;
    notifyListeners();
  }
  DateTime _timeNow = DateTime.now();
  DateTime get timeNow => _timeNow;
  set timeNow(DateTime value) {
    _timeNow = value;
    notifyListeners();
  }
  DateTime _addtime = DateTime.now();
  DateTime get addtime => _addtime;
  set addtime(DateTime value) {
    _timeNow = value;
    notifyListeners();
  }
  HomeViewModel() {
    init();
  }
  @override
  void dispose() async {
    var timeruser =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => getTime());
    var timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => decrementHour());
    timer.cancel();
    timeruser.cancel();
  }

  init() async {
    print(_role);

    Timer.periodic(const Duration(seconds: 1), (Timer t) => getTime());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => decrementHour());
    await readData();
  
    getToken(userId);
  }




  readData() async {
    _userId = (await _storage.read(key: HoloolData.userId))!;
    _role = (await _storage.read(key: HoloolData.role))!;

    notifyListeners();
  }

  void decrementHour() {
    DateTime currentTime = DateTime.now();

    DateTime newTime = currentTime.subtract(Duration(hours: 1));
    _addtime = newTime;

    notifyListeners();
  }

  getTime() {
    final DateTime now1 = DateTime.now();
    // final DateTime now1 = DateTime.now().subtract(Duration(hours: 1));

    _timeNow = now1;

    notifyListeners();
  }

  getToken(userId) async {



   

    // FirebaseMessaging.onMessage.listen((event) {
    //   showSimpleNotification(
    //     Container(child: Text(event.data['title'].toString(), style: TextStyle(color: Colors.black))),
    //     position: NotificationPosition.top,
    //   );
    //   NotificationMethod.showNotification(id:0, title: event.data['title'], body: event.data['body']);
    // });
    notifyListeners();
  }
}
