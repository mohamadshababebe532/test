import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
 
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../cubit/accounter_cubit.dart';
import '../model/revenuess_model.dart';

class UpdaterevenuseScreen extends StatefulWidget {
  RevenuessModel revenuessModelsss;
  final String nameUpdate;
  UpdaterevenuseScreen({required this.revenuessModelsss, super.key, required this.nameUpdate});

  @override
  State<UpdaterevenuseScreen> createState() => _UpdaterevenuseScreen();
}

class _UpdaterevenuseScreen extends State<UpdaterevenuseScreen> {
  TextEditingController desccontroller = TextEditingController();

  TextEditingController incomecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  // var item = ['sy', 'AED'];
  
  String? gender;
  String? selectAgents;

  @override
  Widget build(BuildContext context) {
    desccontroller.text = widget.revenuessModelsss.description.toString();
    incomecontroller.text = widget.revenuessModelsss.income.toString();
    datecontroller.text = widget.revenuessModelsss.date.toString();
    gender = widget.revenuessModelsss.type_value.toString();
    var cubit = BlocProvider.of<AccounterCubit>(context);
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AccounterCubit, AccounterState>(
          listener: (context, state) {
            if (state is UpdateRevenusSucState) {
              Fluttertoast.showToast(
                  msg: "successfully Update",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              cubit.getresource();
    
              Navigator.of(context).pop();
            } else if (state is UpdateRevenusFaliedState) {
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
            if (state is UpdateRevenusLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
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
                      Padding(padding: EdgeInsets.symmetric(horizontal: 30)),
                      Text(
                        ' Income Record',
                        style:
                            TextStyle(color: appTheme.primaryColor, fontSize: 25),
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
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(30)),
                                        borderSide:
                                            BorderSide(style: BorderStyle.none)),
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
                                  DateTime? pickdatetime = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050));
    
                                  if (pickdatetime != null) {
                                    datecontroller.text =
                                        DateFormat('y-MM-d').format(pickdatetime);
                                  }
                                },
                              ),
                            ),
                             ElevatedButton(
                          style: ButtonStyle(
                            
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: ()
                          async {
                                  DateTime? pickdatetime = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050));
    
                                  if (pickdatetime != null) {
                                    datecontroller.text =
                                        DateFormat('y-MM-d').format(pickdatetime);
                                  }
                                }, child: Text('Choose')),
                          ],
                        ),
                        TextFormField(
                          controller: desccontroller,
                          obscureText: false,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'Description',
                            hintStyle: TextStyle(color: Color(0XFF0797A7)),
                            labelStyle: TextStyle(color: Color(0XFF0797A7)),
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
                                height: 40,
                                child: TextFormField(
                                  cursorHeight: 20,
                                  keyboardType: TextInputType.phone,
                                  controller: incomecontroller,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        TextStyle(color: Color(0XFF0797A7)),
                                    labelStyle:
                                        TextStyle(color: Color(0XFF0797A7)),
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
                                  height: 70,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: Text('QAR'),
                                  ),
                                  // child: DropdownButtonFormField(
                                  //   elevation: 5,
                                  //   decoration: const InputDecoration(
                                  //       border: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.all(
                                  //               Radius.circular(0)))),
                                  //   hint: Text(
                                  //     gender.toString(),
                                  //     style: TextStyle(
                                  //         color: Colors.black, fontSize: 8),
                                  //   ),
                                  //   items: item.map((String value) {
                                  //     return DropdownMenuItem<String>(
                                  //       value: value,
                                  //       child: Text(
                                  //         '$value',
                                  //         style: const TextStyle(
                                  //             color: Colors.black, fontSize: 8),
                                  //       ),
                                  //     );
                                  //   }).toList(),
                                  //   onChanged: (newValue) {
                                  //     gender = newValue.toString();
                                  //   },
                                  // ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: CustomButtons(
                              
                                onPress: () {
                                 
                                  RevenuessModel revenuessModel =
                                      RevenuessModel(
                                          date: datecontroller.text,
                                          description: desccontroller.text,
                                          type_value: 'AED',
                                          id: widget.revenuessModelsss.id,
                                          income: incomecontroller.text);
                                  BlocProvider.of<AccounterCubit>(context)
                                      .updaterevenus(
                                          revenuessModel: revenuessModel);
                                },
                                color:  Colors.black,
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: 50,
                                title: state is UpdateRevenusLoadingState
                                    ? 'Loading..'
                                    : 'Submit Record'),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
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

                