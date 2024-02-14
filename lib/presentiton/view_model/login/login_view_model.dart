// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';

import '../../../assistants/app_function_assistants/auth.dart';

 

class LoginViewModel extends ChangeNotifier {
  LoginViewModel();
  bool x=false;
  tooglePass(){
    x=!x;
    notifyListeners();
  }
   
  login(String email, String password) async {
    String url = 'http://senzascent.test-holooltech.com/api/admin/gt-users/login-gt-user'+
        '?email=$email&password=$password';

    var response = await AuthFunctionAssistants().doLogin(url, email, password);
    print(response);
    notifyListeners();
    return response;
  }
}
