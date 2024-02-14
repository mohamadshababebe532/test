import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class FormValidator {
  String hint;
  RegExp regExp;
  String? errorMessage;
  final TextEditingController controller = TextEditingController();

  FormValidator(
      {required this.hint,   required this.regExp,    this.errorMessage});

  String? validator(String? inputText) {
    return regExp.hasMatch(inputText!) ? null : errorMessage;
  }
}

 
class InputTextForm extends StatelessWidget {
  final FormValidator? formValidator;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool showText;
  final VoidCallback? suffixPressed;
  final TextInputType textInputType;
  final TextEditingController controller;
  final String? labelText;
  final bool read;
  final Color color;

  const InputTextForm({
    Key? key,
  this.formValidator,
    this.suffixIcon,
      this.prefixIcon,
    this.suffixPressed,
    this.showText = true,
    required this.textInputType,
    required this.controller,
       this.labelText,
     this.read=false,
     this.color=Colors.white,
  }) : super(key: key);

  Widget? _getSuffixIcon() {
    if (suffixIcon == null) return null;
    return IconButton(
      onPressed: suffixPressed,
      icon: Icon(
        suffixIcon,
        color: Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        cursorColor:  appTheme.primaryColor,
        readOnly: read,
        controller: controller,
         style:   TextStyle(
                          fontSize: 14.0,
                          color:  appTheme.primaryColor,
                          
                        ),
        validator: formValidator!.validator,
        keyboardType: textInputType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          disabledBorder:   OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(

                              color:  appTheme.primaryColor,
                            ),
                          ),
                  enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(  15.0)),
                                          borderSide: BorderSide(
                                            color:  appTheme.primaryColor,
                                          ),
                                        ),
                                focusedBorder:   OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(

                              color:  appTheme.primaryColor,
                            ),
                          ),
                             border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.0)),
                                          borderSide: BorderSide(
                                              color:  appTheme.primaryColor, ),
                                        ),
                          errorBorder: const OutlineInputBorder(
                             gapPadding: 12,
                             borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
            
          labelText: labelText,
          labelStyle:   TextStyle(fontSize:18.0,  color: Colors.black ,fontWeight: FontWeight.bold),
                 hintText:formValidator!.hint,
                          hintStyle: const TextStyle(
                            fontSize: 13.0,
                            color: Color(0xFFA6A6A6)
                          ),
          
          suffixIcon: _getSuffixIcon(),
        ),
        obscureText: !showText,
      ),
    );
  }
}

// decoration: InputDecoration(
//                                         hintText: 'Add Address',
//                                         enabledBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(30.0)),
//                                           borderSide: BorderSide(
//                                             color: const Color.fromARGB(
//                                                 255, 194, 192, 192),
//                                           ),
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(30.0)),
//                                           borderSide: BorderSide(
//                                             color: const Color.fromARGB(
//                                                 255, 194, 192, 192),
//                                           ),
//                                         ),
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(30.0)),
//                                           borderSide: BorderSide(
//                                               color: appTheme.primaryColor),
//                                         ),
//                                         prefixIcon: Icon(
//                                           Icons.location_on_rounded,
//                                           color: const Color.fromARGB(
//                                               255, 194, 192, 192),
//                                         )),