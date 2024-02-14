// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
 
import 'package:provider/provider.dart';
import 'package:senzascent/core/theme/app_theme.dart';
 
import '../../../core/strings/failure_string.dart';
import '../../../core/widgets/waiting_dialog_widget.dart';
import '../../view_model/login/reset_password_viewmodel.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController validatePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        backgroundColor: Colors.black,
        body: ChangeNotifierProvider(
          create: (context) => ResetPasswordViewModel(),
          builder: (context, child){
            return Form(
              key: _formKey,

              child: ListView(
                padding: const EdgeInsets.only(right: 35, left: 35),
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: BackButton(
                              color: Colors.white,
                            ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Image.asset('assets/images/logo.jpg',height:MediaQuery.of(context).size.height/4)),
 
                  const Text('Reset Password', style: TextStyle(fontSize: 20, color:  Colors.white, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
                  const SizedBox(height: 30),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Email Address',style: TextStyle(color: Colors.white,fontSize: 15),),
                          ),
                      TextFormField(
                           style:   TextStyle(
                              fontSize: 14.0,
                              color: appTheme.primaryColor,
                              
                            ),
                        
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (String? email){
                          if (email == null) {
                            return emptyEmail;
                          }
                          else if (!email.contains('@') || !email.contains('.com')) {
                            return emailTypeError;
                          }
                          return null;
                        },
                        

                        decoration:   InputDecoration(
                           filled: true,
          fillColor: Colors.white,

                          

                          hintText: 'johndoe@gmail.com',
                          hintStyle: TextStyle(
                            fontSize: 13.0,
                          ),

                          disabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(

                              color: appTheme.primaryColor,
                            ),
                          ),
                  enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(  15.0)),
                                          borderSide: BorderSide(
                                            color: appTheme.primaryColor,
                                          ),
                                        ),
                                focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(

                              color: appTheme.primaryColor,
                            ),
                          ),
                             border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0)),
                                          borderSide: BorderSide(
                                              color: appTheme.primaryColor),
                                        ),
                          errorBorder: OutlineInputBorder(
                             gapPadding: 12,
                             borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),

                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Password',style: TextStyle(color: Colors.white,fontSize: 15),),
                          ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (String? password){
                          if (password == null) {
                            return emptyPassword;
                          }
                          else if (password.length <6) {
                            return passwordTypeError;
                          }
                          return null;
                        },
                      style: const TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFFA6A6A6),
                              
                            ),
                        decoration:   InputDecoration(
                          filled: true,
          fillColor: Colors.white,
                          

                          hintText: '******',
                          hintStyle: const TextStyle(
                            fontSize: 13.0,
                          ),

                          disabledBorder:   OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(

                              color: appTheme.primaryColor,
                            ),
                          ),
                  enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(  15.0)),
                                          borderSide: BorderSide(
                                            color: appTheme.primaryColor,
                                          ),
                                        ),
                                focusedBorder:   OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(

                              color: appTheme.primaryColor,
                            ),
                          ),
                             border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0)),
                                          borderSide: BorderSide(
                                              color: appTheme.primaryColor, ),
                                        ),
                          errorBorder: OutlineInputBorder(
                             gapPadding: 12,
                             borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),

                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                            padding:   EdgeInsets.only(left: 15),
                            child: Text('Confirm Password',style: TextStyle(color: Colors.white,fontSize: 15),),
                          ),
                      TextFormField(
                        controller: validatePasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (String? password){
                          if (password == null) {
                            return emptyPassword;
                          }
                          else if (password.length <6) {
                            return passwordTypeError;
                          }
                          else if(validatePasswordController.text != passwordController.text){
                            return "Password and Validate Password must be the same";
                          }
                          return null;
                        },
                      style: const TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFFA6A6A6),
                              
                            ),

                        decoration:   InputDecoration(
                          filled: true,
          fillColor: Colors.white,
                          hintText: '******',
                          hintStyle: TextStyle(
                            fontSize: 13.0,
                          ),

                         disabledBorder:   OutlineInputBorder(
                            borderRadius: 
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(

                              color: appTheme.primaryColor,
                            ),
                          ),
                  enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(  15.0)),
                                          borderSide: BorderSide(
                                            color: appTheme.primaryColor,
                                          ),
                                        ),
                                focusedBorder:   OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(

                              color: appTheme.primaryColor,
                            ),
                          ),
                             border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15.0)),
                                          borderSide: BorderSide(
                                              color: appTheme.primaryColor, ),
                                        ),
                          errorBorder: const OutlineInputBorder(
                             gapPadding: 12,
                             borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),

                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appTheme.primaryColor,
                        minimumSize: Size(MediaQuery.of(context).size.width, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      onPressed: ()async{
                        if (_formKey.currentState!.validate())  {
                          showDialog(context: context, barrierDismissible: false, builder: (context) => WaitingDialogWidget(waitMessage: "Please wait..."));

                          await Provider.of<ResetPasswordViewModel>(context, listen: false).resetPassword(emailController.text, passwordController.text);
                       
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Reset Password',style: TextStyle(fontSize: 22))),
                ],
              ),
            );
          },
      )),
    );
  }
}
// royal-choice.test-holooltech.com