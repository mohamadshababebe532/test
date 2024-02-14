import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../assistants/app_constants_assistatnts/app_constants_urls.dart';
import '../../../assistants/app_function_assistants/auth.dart';
 

class ResetPasswordViewModel with ChangeNotifier{
  ResetPasswordViewModel();

  resetPassword (String email, String newPassword) async{
    String url = ConstantsUrl.newLink + ConstantsUrl.resetPasswordUrl;

    var response = await AuthFunctionAssistants().doResetPassword(url, email, newPassword);

    var result= await jsonDecode(response.body);

    bool status = result['status'];

    if(!status){
      Fluttertoast.showToast(msg: 'User not found');
      notifyListeners();
      return ;
    }

    else if(response.statusCode == 200){
      Fluttertoast.showToast(msg: 'Password Updated');
      notifyListeners();
      return ;
    }

    else{
      Fluttertoast.showToast(msg: 'Check Your Internet Connection');
      notifyListeners();
      return;
    }

  }
}