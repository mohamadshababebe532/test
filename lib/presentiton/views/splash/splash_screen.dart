
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
 
import 'package:http/http.dart';

import '../../../core/storage/holool_data.dart';
import '../home/home_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Map<String, String> data = {};

  String? loggedIn;

  @override
  void initState() {
    super.initState();
    // RemoteMessage? initialMessage =
    //     await FirebaseMessaging.instance.getInitialMessage();
    // if (initialMessage != null) {
    //   if (initialMessage.data['screen'] != null) {
    //     Navigator.of(context)
    //         .pushReplacementNamed(initialMessage.data['screen']);
    //     return;
    //   }
    // }
    readAllData();
  }

  readAllData() async {
    data = await _storage.readAll();
    loggedIn = data[HoloolData.isLoggedIn];

    if (data[HoloolData.isLoggedIn] != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    }
  }


  // function to do on tap to notification on background no in terminated

  // show notification just when app is running

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset("assets/images/logo.jpg"),
      ),
    );
  }
}
