// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:senzascent/core/theme/app_theme.dart';

import '../../../core/storage/holool_data.dart';
import '../../../core/strings/failure_string.dart';
import '../../../core/widgets/form_validator.dart';
import '../../../core/widgets/waiting_dialog_widget.dart';
import '../../view_model/login/login_view_model.dart';
import '../home/home_screen.dart';
import '../reset_password/reset_password_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  
  TextEditingController passwordController = TextEditingController();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
          body: ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        builder: (context, child) {
          return ListView(
            children: [
               
              Image.asset('assets/images/logo.jpg',height: MediaQuery.of(context).size.height/3,),
              Padding(

                padding:
                    const EdgeInsets.only(top: 45, right: 45, left: 45),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Email Address',style: TextStyle(color: Colors.white,fontSize: 15),),
                          ),
                          InputTextForm(formValidator:
                          FormValidator(
                              errorMessage:emailTypeError ,
                              hint: 'johndoe@gmail.com',
                              regExp: RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$') ,
                            )
                           , textInputType:TextInputType.emailAddress , 
                           controller: emailController, 
                           ),
                        ],
                      ),
                      
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer<LoginViewModel>(
                        builder: (context, loginViewModel, _){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Password',style: TextStyle(color: Colors.white,fontSize: 15)),
                              ),
                              InputTextForm(formValidator: FormValidator(
                                errorMessage:passwordTypeError ,
                                hint: '******',
                                regExp: RegExp(r'^.{6,}$') ,
                              ),
                               textInputType: TextInputType.visiblePassword,
                                controller: passwordController,
                                 
                                 showText: loginViewModel.x,
                                    suffixIcon: loginViewModel.x?
                                    Icons.visibility
                                        : Icons.visibility_off,
                                    suffixPressed: (){
                                     loginViewModel.tooglePass();
                                    },
                                 ),
                            ],
                          );
                        },
                        
                      ),
                       
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Forget Your Password ?',
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ,fontSize: 20),
                              ),
                              TextButton(
                           onPressed: () {
                             Navigator.of(context).push(MaterialPageRoute(
                                 builder: (context) =>
                                     ResetPasswordScreen()));
                           },
                           child: Text(
                             'Reset Password',
                             style: TextStyle(
                                 color: appTheme.primaryColor,
                                 fontSize: 20,
                                 decoration: TextDecoration.underline),
                           ),
                         ),

                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:appTheme.primaryColor,
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => WaitingDialogWidget(
                                      waitMessage: "Please wait..."));

                              Provider.of<LoginViewModel>(context,
                                      listen: false)
                                  .login(emailController.text,
                                      passwordController.text)
                                  .then((value) async {
                                Navigator.of(context);
                                var result = await jsonDecode(value);

                                bool status = result['status'];
                                String msg = result['msg'];
                                if (!status) {  
                                  Fluttertoast.showToast(msg: msg);
                                  Navigator.pop(context);
                                } else {
                                  var userInfo = result['gt_User'];
                                  await _storage.write(
                                      key: HoloolData.is_accounter,
                                      value: userInfo['is_accountant']
                                          .toString());
                                  await _storage.write(
                                      key: 'asd',
                                      value: userInfo['is_accountant']
                                          .toString());
                                  await _storage.write(
                                      key: HoloolData.isLoggedIn,
                                      value: 'true');
                                  await _storage.write(
                                      key: HoloolData.userId,
                                      value: userInfo['id'].toString());
                                  await _storage.write(
                                      key: HoloolData.firstName,
                                      value: userInfo['first_name']);
                                  await _storage.write(
                                      key: HoloolData.lastName,
                                      value: userInfo['last_name']);
                                  await _storage.write(
                                      key: HoloolData.role,
                                      value: userInfo['role']);
                                  await _storage.write(
                                      key: HoloolData.email,
                                      value: userInfo['email']);
                                  await _storage.write(
                                      key: HoloolData.phoneNumber,
                                      value: userInfo['phone_number']);
                                  await _storage.write(
                                      key: HoloolData.is_accounter,
                                      value: userInfo['is_accountant']
                                          .toString());
                                  await _storage.write(
                                      key: HoloolData.startedDay,
                                      value: userInfo['start_day']);
                                  print(await _storage.read(
                                      key: HoloolData.is_accounter));
                                  print('////////////////////////////');

                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen()),
                                      (route) => false);
                                }
                              }).catchError((error, stackTrace) {
                                if (kDebugMode) {
                                  print(
                                      "++++++++++++++++++++++++++++++++++++++++");
                                  print(
                                      "The Error of sign in Operation is: $error");
                                  print(
                                      "The stack trace of error of sign in is: $stackTrace");
                                  print(
                                      "++++++++++++++++++++++++++++++++++++++++");
                                }
                                Navigator.pop(context);
                                Fluttertoast.showToast(
                                    msg: offLineFailureString);
                              });
                            }
                          },
                          child: const Text('Sign In',style: TextStyle(fontSize: 22),)),
                      const SizedBox(
                        height: 20,
                      ),
                       
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
//  TextButton(
//                             onPressed: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) =>
//                                       ResetPasswordScreen()));
//                             },
//                             child: Text(
//                               'Reset Password',
//                               style: TextStyle(
//                                   color: Theme.of(context).primaryColor,
//                                   fontSize: 20,
//                                   decoration: TextDecoration.underline),
//                             ),
//                           ),