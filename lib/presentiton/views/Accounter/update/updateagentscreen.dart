import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
 

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/waiting_dialog_widget.dart';
import '../cubit/accounter_cubit.dart';
import '../model/addagent_model.dart';

class UpdateAgentsScreen extends StatelessWidget {
  AddAgentModel addAgentModelsss;
  UpdateAgentsScreen({required this.addAgentModelsss, super.key});

  TextEditingController namecontroller = TextEditingController();

  TextEditingController emailcontoller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  TextEditingController landlinecontroller = TextEditingController();

  TextEditingController companycontroller = TextEditingController();

  TextEditingController addresscontroller = TextEditingController();

  TextEditingController countrycontroller = TextEditingController();

  TextEditingController websitecontroller = TextEditingController();
  TextEditingController nameagentcontroller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey();

  String? gender;

  var items3 = [
    'customer',
    'supplier',
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AccounterCubit>(context);
    nameagentcontroller.text = addAgentModelsss.name.toString();
    emailcontoller.text = addAgentModelsss.email.toString();
    namecontroller.text = addAgentModelsss.company_name.toString();
    companycontroller.text = addAgentModelsss.work_category.toString();
    landlinecontroller.text = addAgentModelsss.land_line.toString();
    phonecontroller.text = addAgentModelsss.phone_number.toString();
    gender = addAgentModelsss.type.toString();
    websitecontroller.text = addAgentModelsss.website.toString();
    addresscontroller.text = addAgentModelsss.location.toString();
    countrycontroller.text = addAgentModelsss.country.toString();
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   leading:  IconButton(
        //                     onPressed: () {
        //                       Navigator.of(context).pop();
        //                     },
        //                     icon: Icon(
        //                       Icons.arrow_back,
        //                       size: 25,
        //                       color: Colors.black,
        //                     )),
        //   centerTitle: true,
           
            
           
        //   title: Text(
        //                   'Update Agent',
        //                   style: TextStyle(
        //                       color: appTheme.primaryColor, fontSize: 30),
        //                 ),
        // ),
        body: BlocConsumer<AccounterCubit, AccounterState>(
          listener: (context, state) {
            if (state is UpdateAgentsSucState) {
              Fluttertoast.showToast(
                  msg: "Update successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
    
              Navigator.pop(context);
              cubit.getagent();
            } else if (state is UpdateAgentsFaliedState) {
              Fluttertoast.showToast(
                  msg: "Errors",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          builder: (context, state) {
            if (state is UpdateAgentsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Form(
                key: _formkey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                     
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
                             SizedBox(
                              width: MediaQuery.of(context).size.width/10,
                             ),
                        Text(
                          'Update Agent',
                          style: TextStyle(
                              color: appTheme.primaryColor, fontSize: 30),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,top: 20),
                      child: Text(
                        'Personal Information',
                        style:
                            TextStyle(color: appTheme.primaryColor, fontSize: 18),
                      ),
                    ),
                    Text('Add Agent'),
                    _textformfield(
                      hintText: 'Name Agent',
                      controller: nameagentcontroller,
                      obsecure: false,
                    ),
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
                    Text('Phone Number'),
                    _textformfield(
                      hintText: 'Phone Number',
                      type: 'number',
                      controller: phonecontroller,
                      obsecure: false,
                    ),
                    Text('Webiste'),
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
                          hint: Text(
                            gender.toString(),
                            style: TextStyle(color: Colors.black),
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
                                        '$value',
                                        style:
                                            const TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ));
                          }).toList(),
                          onChanged: (newValue) {
                            gender = newValue.toString();
                          }),
                    ),
                    Text('Address'),
                    _textformfield(
                      hintText: 'Location',
                      controller: addresscontroller,
                      obsecure: false,
                    ),
                    Text('Country'),
                    _textformfield(
                      hintText: 'Country',
                      controller: countrycontroller,
                      obsecure: false,
                    ),
                    CustomButton(
                        onPress: () {
                          AddAgentModel addAgentModel = AddAgentModel(
                              name: nameagentcontroller.text.toString(),
                              country: countrycontroller.text.toString(),
                              email: emailcontoller.text.toString(),
                              id: addAgentModelsss.id,
                              company_name: namecontroller.text.toString(),
                              work_category: companycontroller.text.toString(),
                              phone_number: phonecontroller.text.toString(),
                              type: gender.toString(),
                              land_line: landlinecontroller.text.toString(),
                              location: addresscontroller.text.toString(),
                              website: websitecontroller.text.toString());
                          print('/////////////////////////////');
                          print(nameagentcontroller.text);
                          BlocProvider.of<AccounterCubit>(context)
                              .updateagents(addAgentModel: addAgentModel);
                        },
                        color:   Colors.black,
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 40,
                        title: state is UpdateAgentsLoadingState
                            ? 'Loading...'
                            : 'Update'.toUpperCase())
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
          hintStyle: TextStyle(color: Color(0XFF0797A7)),
          labelStyle: TextStyle(color: Color(0XFF0797A7)),
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
