import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
 

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/waiting_dialog_widget.dart';
import '../cubit/accounter_cubit.dart';
import '../model/addagent_model.dart';

class AddCustomerScreen extends StatefulWidget {
  AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController nameagentcontrller = TextEditingController();
  TextEditingController emailcontoller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController landlinecontroller = TextEditingController();
  TextEditingController companycontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  TextEditingController websitecontroller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey();
  String? gender;
  var items3 = [
    'customer',
    'supplier',
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AccounterCubit>(context);
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AccounterCubit, AccounterState>(
          listener: (context, state) {
            if (state is AddAgentsSucState) {
              Fluttertoast.showToast(
                  msg: "Add successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
    
              Navigator.pop(context);
              cubit.getagent();
            } else if (state is AddAgentsFailedState) {
              Fluttertoast.showToast(
                  msg: state.message,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          builder: (context, state) {
            if (state is AddAgentsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Form(
                key: _formkey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 25,
                            )),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'ADD Customers',
                            style: TextStyle(
                                color: appTheme.primaryColor, fontSize: 25),
                          ),
                        ),
                        Spacer(),
                        Spacer(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Personal Information',
                        style: TextStyle(
                            color: appTheme.primaryColor, fontSize: 18),
                      ),
                    ),
                    Text('Name'),
                    _textformfield(
                        hintText: 'Name',
                        controller: nameagentcontrller,
                        obsecure: false),
                    Text('Company Name'),
                    _textformfield(
                      hintText: 'Company Name',
                      controller: namecontroller,
                      obsecure: false,
                    ),
                    Text('Work Category'),
                    _textformfield(
                      hintText: 'Work Category',
                      controller: companycontroller,
                      obsecure: false,
                    ),
                    Text('Email'),
                    _textformfield(
                      hintText: 'Example@gmail.com',
                      controller: emailcontoller,
                      obsecure: false,
                    ),
                    Text('LandLine'),
                    _textformfield(
                      hintText: 'Land Line',
                      type: 'number',
                      controller: landlinecontroller,
                      obsecure: false,
                    ),
                    Text('phonenumber'),
                    _textformfield(
                      hintText: 'Phone Number',
                      type: 'number',
                      controller: phonecontroller,
                      obsecure: false,
                    ),
                    Text('Website'),
                    _textformfield(
                      hintText: 'Website',
                      controller: websitecontroller,
                      obsecure: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: DropdownButtonFormField(
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                          elevation: 5,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0))),
                          ),
                          hint: const Center(
                            child: Text(
                              'Agents',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          items: items3.map((String value) {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 9, right: 10),
                                      child: Text(
                                        // ignore: unnecessary_string_interpolations
                                        '$value',
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ));
                          }).toList(),
                          onChanged: (newValue) {
                            gender = newValue.toString();
                          }),
                    ),
                    Text('address'),
                    _textformfield(
                      hintText: 'Location',
                      controller: addresscontroller,
                      obsecure: false,
                    ),
                    Text('country'),
                    _textformfield(
                      hintText: 'Country',
                      controller: countrycontroller,
                      obsecure: false,
                    ),
                    CustomButton(
                        onPress: () {
                          if (gender == null) {
                            Fluttertoast.showToast(
                                msg: 'Select Type Of Agent',
                                backgroundColor: Colors.red);
                            return;
                          }
    
                          if (_formkey.currentState!.validate() == true) {
                            AddAgentModel addAgentModel = AddAgentModel(
                                country: countrycontroller.text,
                                email: emailcontoller.text,
                                company_name: namecontroller.text,
                                work_category: companycontroller.text,
                                phone_number: phonecontroller.text,
                                name: nameagentcontrller.text,
                                type: gender,
                                land_line: landlinecontroller.text,
                                location: addresscontroller.text,
                                website: websitecontroller.text);
                            BlocProvider.of<AccounterCubit>(context)
                                .addagient(addAgentModel: addAgentModel);
                          }
                        },
                        color:   Colors.black,
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 40,
                        title: state is AddAgentsLoadingState
                            ? 'Loading..'
                            : 'ADD')
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _textformfield({
    required String hintText,
    required TextEditingController controller,
    required bool obsecure,
    String? type,
  }) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: TextFormField(
        keyboardType: type == 'number' ? TextInputType.phone : null,
        controller: controller,
        obscureText: obsecure,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
            borderSide: BorderSide(
                width: 5.0, style: BorderStyle.solid, color: Color(0xff252b3b)),
          ),
        ),
      ),
    );
  }

  Widget _textformfield2({
    required String hintText,
    required TextEditingController controller,
    required bool obsecure,
    String? type,
  }) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: TextFormField(
        keyboardType: type == 'number' ? TextInputType.phone : null,
        validator: (input) {
          if (controller.text.isNotEmpty) {
            return null;
          } else {
            return '${hintText} Must not be empty';
          }
        },
        controller: controller,
        obscureText: obsecure,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
            borderSide: BorderSide(
                width: 5.0, style: BorderStyle.solid, color: Color(0xff252b3b)),
          ),
        ),
      ),
    );
  }
}
