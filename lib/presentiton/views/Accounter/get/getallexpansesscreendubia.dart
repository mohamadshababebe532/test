import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../add/expansesscreen.dart';
import '../cubit/accounter_cubit.dart';
import '../update/updateExpansess.dart';

class getAllExpansessDubai extends StatelessWidget {
  getAllExpansessDubai({super.key});
  TextEditingController searchcontroller = TextEditingController();

  TextEditingController datecontrollerexcel = TextEditingController();
  TextEditingController namecontrollerexcel = TextEditingController();
  TextEditingController duedatecontrollerexcel = TextEditingController();
  TextEditingController namepdf = TextEditingController();

  var item = ['description      ', 'expenses', 'date'];
  String? gender;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AccounterCubit>(context);
    return Scaffold(
      body: Column(
        children: [
          // SizedBox(
          //   height: 25,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 9,
              ),
              CustomButtons(
                  onPress: () {
                    cubit.getagent();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ExpansesScreen(
                              nameExpanses: 'QAR',
                            )));
                  },
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width / 2,
                  height: 40,
                  title: 'Add Expanses Record',
                  iconData: Icons.add),
              // IconButton(
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //     icon: Icon(Icons.arrow_back)),
              // Spacer(),
              // Text(
              //   'Expenses Dubai',
              //   style: TextStyle(color: appTheme.primaryColor, fontSize: 25),
              // ),
              // Spacer(),
              // Spacer(),
              BlocBuilder<AccounterCubit, AccounterState>(
                  builder: (context, state) {
                return cubit.expansessModel.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: BlocConsumer<AccounterCubit,
                                        AccounterState>(
                                      listener: (context, state) {
                                        if (state is SearchExpansessSucState) {
                                          Navigator.pop(context);
                                        } else if (state
                                            is SearchExpansessFaliedState) {
                                          Fluttertoast.showToast(
                                              msg: 'No Expensess');
                                        }
                                      },
                                      builder: (context, state) {
                                        if (state is SearchIExpansessLoading) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return Column(
                                            children: [
                                              TextFormField(
                                                controller: searchcontroller,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Search by company name OR Invoice No',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black),
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5.0,
                                                    ),
                                                    borderSide: BorderSide(
                                                        width: 5.0,
                                                        style:
                                                            BorderStyle.solid,
                                                        color:
                                                            Color(0xff252b3b)),
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.black),
                                                  ),
                                                  onPressed: () {
                                                    if (searchcontroller
                                                        .text.isEmpty) {
                                                      return;
                                                    } else if (gender == null) {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Please add Value in filter');
                                                      return;
                                                    }
                                                    BlocProvider.of<
                                                                AccounterCubit>(
                                                            context)
                                                        .searchexpansess(
                                                            filter: gender
                                                                .toString(),
                                                            search:
                                                                searchcontroller
                                                                    .text);
                                                  },
                                                  child: Text('Search')),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text('Filter:'),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      height: 60,
                                                      child:
                                                          DropdownButtonFormField(
                                                        elevation: 5,
                                                        decoration: const InputDecoration(
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            0)))),
                                                        hint: Text(
                                                          'Filter',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12),
                                                        ),
                                                        items: item.map(
                                                            (String value) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            value: value,
                                                            child: Text(
                                                              '$value',
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12),
                                                            ),
                                                          );
                                                        }).toList(),
                                                        onChanged: (newValue) {
                                                          gender = newValue
                                                              .toString();
                                                          print(gender);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        }
                                      },
                                    ),
                                  ));
                        },
                        icon: Icon(
                          Icons.search,
                          size: 30,
                        ))
                    : SizedBox.shrink();
              }),
            ],
          ),
          // CustomButtons(
          //     onPress: () {
          //       cubit.getagent();
          //       Navigator.of(context).push(
          //           MaterialPageRoute(builder: (context) => ExpansesScreen()));
          //     },
          //     color: appTheme.primaryColor,
          //     width: MediaQuery.of(context).size.width / 2,
          //     height: 40,
          //     title: 'Add Expanses Record',
          //     iconData: Icons.add),
          Expanded(
            child: BlocConsumer<AccounterCubit, AccounterState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetAllIncomeLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (cubit.expansessModel.isEmpty) {
                  return Center(
                    child: Text('No Expanses'),
                  );
                } else {
                  return ListView.builder(
                      itemCount: cubit.expansessModel.length,
                      itemBuilder: (context, index) {
                        return cubit.expansessModel[index].type_value == 'QAR'
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                    height: 140,
                                    decoration:
                                        BoxDecoration(color: Color(0xFFEBEBEB)),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: ListTile(
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('Amount: ',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Text(
                                                      '${cubit.expansessModel[index].expenses.toString()} QAR',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.red),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text('Date: ',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        Text(
                                                          cubit
                                                              .expansessModel[
                                                                  index]
                                                              .date
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 13),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text('Time : ',
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        Text(
                                                          cubit
                                                              .expansessModel[
                                                                  index]
                                                              .created_at!
                                                              .substring(
                                                                  11, 19),
                                                          style: TextStyle(
                                                              fontSize: 13),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),

                                                // IconButton(
                                                //   onPressed: () {
                                                //     showDialog(
                                                //         context: context,
                                                //         builder: (context) =>
                                                //             BlocConsumer<
                                                //                 AccounterCubit,
                                                //                 AccounterState>(
                                                //               listener: (context,
                                                //                   state) {
                                                //                 if (state
                                                //                     is DeletedSucsyfllytState) {
                                                //                   Fluttertoast
                                                //                       .showToast(
                                                //                           msg:
                                                //                               'Deleted Succsyflly');
                                                //                   Navigator.pop(
                                                //                       context);
                                                //                 } else if (state
                                                //                     is DeletedFaliedState) {
                                                //                   Fluttertoast
                                                //                       .showToast(
                                                //                           msg:
                                                //                               'Errors Deleted');
                                                //                   Navigator.pop(
                                                //                       context);
                                                //                 }
                                                //               },
                                                //               builder: (context,
                                                //                   state) {
                                                //                 return AlertDialog(
                                                //                   title: Column(
                                                //                     children: [
                                                //                       Text(
                                                //                           'Are you sure you want to delete this expense ?'),
                                                //                       Row(
                                                //                         mainAxisAlignment:
                                                //                             MainAxisAlignment
                                                //                                 .spaceBetween,
                                                //                         children: [
                                                //                           ElevatedButton(
                                                //                               onPressed:
                                                //                                   () {
                                                //                                 Navigator.pop(context);
                                                //                               },
                                                //                               child:
                                                //                                   Text('No')),
                                                //                           ElevatedButton(
                                                //                               onPressed:
                                                //                                   () {
                                                //                                 cubit.deleterevenuse(id: cubit.expansessModel[index].id.toString());
                                                //                                 cubit.getallexpansess();
                                                //                               },
                                                //                               child: Text(state is DeletedLoadingState
                                                //                                   ? 'Loading...'
                                                //                                   : 'Yes'))
                                                //                         ],
                                                //                       ),
                                                //                     ],
                                                //                   ),
                                                //                 );
                                                //               },
                                                //             ));
                                                //   },
                                                //   icon: Icon(
                                                //     Icons.delete,
                                                //     color: Colors.black,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Text(
                                              //     'Office : ${cubit.expansessModel[index].type_value.toString()}',
                                              //     style:
                                              //         TextStyle(fontSize: 13)),
                                              // Row(
                                              //   children: [
                                              //     IconButton(
                                              //         onPressed: () {
                                              //           cubit.getagent();
                                              //           Navigator.of(context).push(
                                              //               MaterialPageRoute(
                                              //                   builder:
                                              //                       (context) =>
                                              //                           UpdateExpansesScreen(
                                              //                            expansessUpdateName: 'AED',
                                              //                             expansessModels:
                                              //                                 cubit.expansessModel[index],
                                              //                           )));
                                              //         },
                                              //         icon: Icon(Icons.edit)),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Row(
                                                  children: [
                                                    Text('Description: ',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black)),
                                                    Expanded(
                                                      child: Text(
                                                        cubit
                                                            .expansessModel[
                                                                index]
                                                            .description
                                                            .toString(),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              BlocConsumer<
                                                                  AccounterCubit,
                                                                  AccounterState>(
                                                                listener:
                                                                    (context,
                                                                        state) {
                                                                  if (state
                                                                      is DeletedSucsyfllytState) {
                                                                    Fluttertoast
                                                                        .showToast(
                                                                            msg:
                                                                                'Deleted Succsyflly');
                                                                    Navigator.pop(
                                                                        context);
                                                                  } else if (state
                                                                      is DeletedFaliedState) {
                                                                    Fluttertoast
                                                                        .showToast(
                                                                            msg:
                                                                                'Errors Deleted');
                                                                    Navigator.pop(
                                                                        context);
                                                                  }
                                                                },
                                                                builder:
                                                                    (context,
                                                                        state) {
                                                                  return AlertDialog(
                                                                    title:
                                                                        Column(
                                                                      children: [
                                                                        Text(
                                                                            'Are you sure you want to delete this expense ?'),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            ElevatedButton(
                                                                                style: ButtonStyle(
                                                                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set the background color here
                                                                                ),
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text('No')),
                                                                            ElevatedButton(
                                                                                style: ButtonStyle(
                                                                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set the background color here
                                                                                ),
                                                                                onPressed: () {
                                                                                  cubit.deleterevenuse(id: cubit.expansessModel[index].id.toString());
                                                                                  cubit.getallexpansess();
                                                                                },
                                                                                child: Text(state is DeletedLoadingState ? 'Loading...' : 'Yes'))
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              ));
                                                    },
                                                    icon: Icon(
                                                      Icons.delete,
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        cubit.getagent();
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        UpdateExpansesScreen(
                                                                          expansessUpdateName:
                                                                              'AED',
                                                                          expansessModels:
                                                                              cubit.expansessModel[index],
                                                                        )));
                                                      },
                                                      icon: Icon(Icons.edit)),
                                                  IconButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Description'),
                                                              content: Text(
                                                                cubit
                                                                    .expansessModel[
                                                                        index]
                                                                    .description
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: appTheme
                                                                        .primaryColor),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      icon: Icon(
                                                          Icons.visibility))
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              )
                            : Container();
                      });
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            child: BlocConsumer<AccounterCubit, AccounterState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetAllIncomeLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Row(
                    //  Text(
                    //           'Total Dubai : ${cubit.total_expenses_dubai.toString()}',
                    //           style: TextStyle(
                    //               color: Colors.green,
                    //               fontSize: 20,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                cubit.total_expenses.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        ),

                        // Text(
                        //   'Total : ${}',
                        //   style: TextStyle(
                        //       color: Colors.green,
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.bold),
                        // ),
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Column(
                                            children: [
                                              TextFormField(
                                                controller: namepdf,
                                                decoration: InputDecoration(
                                                  hintText: 'Name File pdf',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black),
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5.0,
                                                    ),
                                                    borderSide: BorderSide(
                                                        width: 5.0,
                                                        style:
                                                            BorderStyle.solid,
                                                        color:
                                                            Color(0xff252b3b)),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          30)),
                                                              borderSide: BorderSide(
                                                                  style:
                                                                      BorderStyle
                                                                          .none)),
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .calendar_today_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          border: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          30))),
                                                          hintText: 'Date',
                                                          hintStyle: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                  controller:
                                                      datecontrollerexcel,
                                                  onTap: () async {
                                                    DateTime? pickdatetime =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1900),
                                                            lastDate:
                                                                DateTime(2050));

                                                    if (pickdatetime != null) {
                                                      datecontrollerexcel.text =
                                                          DateFormat('y-MM-d')
                                                              .format(
                                                                  pickdatetime);
                                                    }
                                                  },
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          30)),
                                                              borderSide: BorderSide(
                                                                  style:
                                                                      BorderStyle
                                                                          .none)),
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .calendar_today_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          border: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          30))),
                                                          hintText: 'Due Date',
                                                          hintStyle: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                  controller:
                                                      duedatecontrollerexcel,
                                                  onTap: () async {
                                                    DateTime? pickdatetime =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1900),
                                                            lastDate:
                                                                DateTime(2050));

                                                    if (pickdatetime != null) {
                                                      duedatecontrollerexcel
                                                          .text = DateFormat(
                                                              'y-MM-d')
                                                          .format(pickdatetime);
                                                    }
                                                  },
                                                ),
                                              ),
                                              // Text(
                                              //   'Please Select Dubai or Syria',
                                              // ),
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.black),
                                                  ),
                                                  onPressed: () {
                                                    if (namepdf.text.isEmpty) {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Please Check Your Data');
                                                      return;
                                                    }
                                                    cubit.urlQatarapdfincome(
                                                        date:
                                                            datecontrollerexcel
                                                                .text,
                                                        duedate:
                                                            duedatecontrollerexcel
                                                                .text,
                                                        syria: namepdf.text);
                                                  },
                                                  child: Text(state
                                                          is AddUrlLancherPdfSyriaLoadingState
                                                      ? 'Loading...'
                                                      : 'Generate'))
                                              // ElevatedButton(
                                              //     onPressed: () {
                                              //       if (namepdf
                                              //           .text.isEmpty) {
                                              //         Fluttertoast.showToast(
                                              //             msg:
                                              //                 'Please Check Your Data');
                                              //         return;
                                              //       }
                                              //       cubit.urldubaipdfincome(
                                              //           date:
                                              //               datecontrollerexcel
                                              //                   .text,
                                              //           duedate:
                                              //               duedatecontrollerexcel
                                              //                   .text,
                                              //           dubai:
                                              //               namepdf.text);
                                              //     },
                                              //     child: Text(state
                                              //             is AddUrlLancherPdfDubiaLoadingState
                                              //         ? "Loading..."
                                              //         : 'Dubai'))
                                            ],
                                          ),
                                        ));
                              },
                              child: Text('Pdf')),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Column(
                                            children: [
                                              TextFormField(
                                                controller: namecontrollerexcel,
                                                decoration: InputDecoration(
                                                  hintText: 'Name File Excel',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black),
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5.0,
                                                    ),
                                                    borderSide: BorderSide(
                                                        width: 5.0,
                                                        style:
                                                            BorderStyle.solid,
                                                        color:
                                                            Color(0xff252b3b)),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          30)),
                                                              borderSide: BorderSide(
                                                                  style:
                                                                      BorderStyle
                                                                          .none)),
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .calendar_today_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          border: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          30))),
                                                          hintText: 'Date',
                                                          hintStyle: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                  controller:
                                                      datecontrollerexcel,
                                                  onTap: () async {
                                                    DateTime? pickdatetime =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1900),
                                                            lastDate:
                                                                DateTime(2050));

                                                    if (pickdatetime != null) {
                                                      datecontrollerexcel.text =
                                                          DateFormat('y-MM-d')
                                                              .format(
                                                                  pickdatetime);
                                                    }
                                                  },
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                child: TextFormField(
                                                  decoration:
                                                      const InputDecoration(
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          30)),
                                                              borderSide: BorderSide(
                                                                  style:
                                                                      BorderStyle
                                                                          .none)),
                                                          prefixIcon: Icon(
                                                            Icons
                                                                .calendar_today_rounded,
                                                            color: Colors.black,
                                                          ),
                                                          border: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                              borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          30))),
                                                          hintText: 'Due Date',
                                                          hintStyle: TextStyle(
                                                              color: Colors
                                                                  .black)),
                                                  controller:
                                                      duedatecontrollerexcel,
                                                  onTap: () async {
                                                    DateTime? pickdatetime =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1900),
                                                            lastDate:
                                                                DateTime(2050));

                                                    if (pickdatetime != null) {
                                                      duedatecontrollerexcel
                                                          .text = DateFormat(
                                                              'y-MM-d')
                                                          .format(pickdatetime);
                                                    }
                                                  },
                                                ),
                                              ),
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.black),
                                                  ),
                                                  onPressed: () {
                                                    String? name =
                                                        namecontrollerexcel
                                                            .text;
                                                    String? start =
                                                        datecontrollerexcel
                                                            .text;
                                                    String? end =
                                                        duedatecontrollerexcel
                                                            .text;
                                                    cubit.urlincome(
                                                        dateUrlExcel:
                                                            datecontrollerexcel
                                                                .text,
                                                        DueDateUrlExcel:
                                                            duedatecontrollerexcel
                                                                .text,
                                                        nameUrlExcel:
                                                            namecontrollerexcel
                                                                .text);
                                                  },
                                                  child: Text(state
                                                          is AddUrlLancherIncomeLoadingState
                                                      ? 'Loading...'
                                                      : 'Generate')),
                                            ],
                                          ),
                                        ));
                              },
                              child: Text('Excel')),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

// Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         'Date:   ${cubit.expansessModel[index].date.toString()}',
//                                         style: TextStyle(fontSize: 15),
//                                       ),
//                                       Text(
//                                           'Amount:  ${cubit.expansessModel[index].expenses.toString()}',
//                                           style: TextStyle(fontSize: 15)),
//                                       IconButton(
//                                         onPressed: () {
//                                           cubit.deleterevenuse(
//                                               id: cubit.expansessModel[index].id
//                                                   .toString());
//                                           cubit.getallexpansess();
//                                         },
//                                         icon: Icon(
//                                           Icons.delete,
//                                           color: Colors.black,
//                                           size: 30,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                           'Time :  ${cubit.expansessModel[index].created_at!.substring(11, 19)}',
//                                           style: TextStyle(fontSize: 15)),
//                                       Text(
//                                           'Office : ${cubit.expansessModel[index].agent_id.toString()}',
//                                           style: TextStyle(fontSize: 15)),
//                                       IconButton(
//                                           onPressed: () {
//                                             cubit.getagent();
//                                             Navigator.of(context).push(
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         UpdateExpansesScreen(
//                                                           expansessModel: cubit
//                                                                   .expansessModel[
//                                                               index],
//                                                         )));
//                                           },
//                                           icon: Icon(Icons.update))
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                           'Description:  ${cubit.expansessModel[index].description.toString()}',
//                                           style: TextStyle(fontSize: 15)),
//                                     ],
//                                   ),
//                                 ],
//                               ),