import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
 
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../cubit/accounter_cubit.dart';
import '../model/expansess_model.dart';

class ExpansesScreen extends StatefulWidget {
  final String nameExpanses;
  ExpansesScreen({super.key, required this.nameExpanses});

  @override
  State<ExpansesScreen> createState() => _ExpansesScreenState();
}

class _ExpansesScreenState extends State<ExpansesScreen> {
  @override
  void initState() {
    super.initState();
    datecontroller.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  TextEditingController datecontroller = TextEditingController();

  TextEditingController desccontroller = TextEditingController();

  TextEditingController expcontroller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey();
  var item = ['sy', 'AED'];
  String? gender;
  String? selectAgents;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AccounterCubit>(context);
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AccounterCubit, AccounterState>(
          listener: (context, state) {
            if (state is AddExpansessLoadingState) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AddExpansessSucState) {
              Fluttertoast.showToast(
                  msg: "Add successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              cubit.getallexpansess();
              Navigator.of(context).pop();
            } else if (state is AddExpansessFaliedState) {
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
            if (state is AddExpansessLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Form(
                key: _formkey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 40,
                            )),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                        Text(
                          'Add Expanses Record',
                          style: TextStyle(
                              color: appTheme.primaryColor, fontSize: 25),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 1.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          borderSide: BorderSide(
                                              style: BorderStyle.none)),
                                      prefixIcon: Icon(
                                        Icons.calendar_today_rounded,
                                        color: Colors.black,
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      hintText: 'Date'),
                                  controller: datecontroller,
                                  onTap: () async {
                                    DateTime? pickdatetime =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2050));

                                    if (pickdatetime != null) {
                                      datecontroller.text = DateFormat('y-MM-d')
                                          .format(pickdatetime);
                                    }
                                  },
                                ),
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                  ),
                                  onPressed: () async {
                                    DateTime? pickdatetime =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2050));

                                    if (pickdatetime != null) {
                                      datecontroller.text = DateFormat('y-MM-d')
                                          .format(pickdatetime);
                                    }
                                  },
                                  child: Text('Choose')),
                            ],
                          ),
                          TextFormField(
                            validator: (input) {
                              if (desccontroller.text.isNotEmpty) {
                                return null;
                              } else {
                                return 'Description Must not be empty';
                              }
                            },
                            controller: desccontroller,
                            obscureText: false,
                            style: TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              hintText: 'Description',
                              hintStyle: TextStyle(color: Colors.black),
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  5.0,
                                ),
                                borderSide: BorderSide(
                                    width: 5.0,
                                    style: BorderStyle.solid,
                                    color: Color(0xff252b3b)),
                              ),
                            ),
                            maxLines: 2,
                          ),
                          Text('Amount :'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: 60,
                                  child: TextFormField(
                                    validator: (input) {
                                      if (expcontroller.text.isNotEmpty) {
                                        return null;
                                      } else {
                                        return 'Amount Must not be empty';
                                      }
                                    },
                                    cursorHeight: 20,
                                    keyboardType: TextInputType.phone,
                                    controller: expcontroller,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.black),
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          5.0,
                                        ),
                                        borderSide: BorderSide(
                                            width: 5.0,
                                            style: BorderStyle.solid,
                                            color: Color(0xff252b3b)),
                                      ),
                                    ),
                                  )),
                              Row(
                                children: [
                                  Text('Currency:  '),
                                  Container(
                                    width: 90,
                                    height: 60,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: Text("QAR"),
                                    ),
                                    // DropdownButtonFormField(
                                    //   elevation: 5,
                                    //   decoration: const InputDecoration(
                                    //       border: OutlineInputBorder(
                                    //           borderRadius: BorderRadius.all(
                                    //               Radius.circular(0)))),
                                    //   hint: Text(
                                    //     'Dxp',
                                    //     style: TextStyle(
                                    //         color: Colors.black, fontSize: 8),
                                    //   ),
                                    //   items: item.map((String value) {
                                    //     return DropdownMenuItem<String>(
                                    //       alignment: Alignment.topLeft,
                                    //       value: value,
                                    //       child: Text(
                                    //         '$value',
                                    //         style: const TextStyle(
                                    //             color: Colors.black,
                                    //             fontSize: 8),
                                    //       ),
                                    //     );
                                    //   }).toList(),
                                    //   onChanged: (newValue) {
                                    //     gender = newValue.toString();
                                    //   },
                                    // ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButtons(
                                    onPress: () {
                                      // if (gender == null) {
                                      //   Fluttertoast.showToast(
                                      //       msg: 'Select Office',
                                      //       backgroundColor: Colors.red);
                                      //   return;
                                      // }

                                      if (_formkey.currentState!.validate() ==
                                          true) {
                                        ExpansessModel expansessModel =
                                            ExpansessModel(
                                                date: datecontroller.text,
                                                type_value: 'AED',
                                                description:
                                                    desccontroller.text,
                                                expenses: expcontroller.text);
                                        BlocProvider.of<AccounterCubit>(context)
                                            .addexpenses(
                                                expansessModel: expansessModel);
                                      }
                                    },
                                    color: Colors.black,
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    height: 50,
                                    title: state is AddExpansessLoadingState
                                        ? 'Loading..'
                                        : 'Submit Record'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _textformfield(
      {required String hintText,
      required TextEditingController controller,
      required bool obsecure,
      String? type,
      required String labelText}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
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
          labelText: labelText,
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
// ElevatedButton(
//                     onPressed: () {
//                       ExpansessModel expansessModel = ExpansessModel(
//                           date: datecontroller.text,
//                           agent_id: selectAgents,
//                           description: desccontroller.text,
//                           expenses: expcontroller.text);
//                       BlocProvider.of<AccounterCubit>(context)
//                           .addexpenses(expansessModel: expansessModel);
//                     },
//                     child: Text(state is AddExpansessLoadingState
//                         ? 'Loading...'
//                         : 'Add Expansess'))

