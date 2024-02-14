import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/theme/app_theme.dart';
import '../cubit/accounter_cubit.dart';
import '../model/banck_model.dart';
 

class GetBank extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  GetBank({super.key});

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
            children: [
              // IconButton(
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //     icon: Icon(
              //       Icons.arrow_back,
              //     )),
              // Spacer(),
              // Text(
              //   'Bank Accounting',
              //   style: TextStyle(fontSize: 25, color: appTheme.primaryColor),
              // ),
              // Spacer(),
              // Spacer(),
            ],
          ),
          BlocConsumer<AccounterCubit, AccounterState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is GetBankLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetBankFaieldState) {
                return Center(
                  child: Text('Please Check Your Internet'),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                      itemCount: cubit.bankModel.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                          child: Card(
                              elevation: 5,
                              color: Color(0xFFEBEBEB),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Information Bank :',
                                              style: TextStyle(
                                                  color: appTheme.primaryColor),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: Text(cubit
                                                  .bankModel[index].name
                                                  .toString()),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.7,
                                              child: Text(cubit
                                                  .bankModel[index].account
                                                  .toString()),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: BlocConsumer<
                                                              AccounterCubit,
                                                              AccounterState>(
                                                            listener: (context,
                                                                state) {
                                                              if (state
                                                                  is UpdateBankSucState) {
                                                                Fluttertoast
                                                                    .showToast(
                                                                        msg:
                                                                            'Update successfully');
                                                                Navigator.pop(
                                                                    context);
                                                                cubit.getBank();
                                                              } else if (state
                                                                  is UpdateBankFlaiedState) {
                                                                Fluttertoast
                                                                    .showToast(
                                                                        msg:
                                                                            'Invalied Data');
                                                              }
                                                            },
                                                            builder: (context,
                                                                state) {
                                                              namecontroller
                                                                      .text =
                                                                  cubit
                                                                      .bankModel[
                                                                          index]
                                                                      .name
                                                                      .toString();
                                                              textEditingController
                                                                      .text =
                                                                  cubit
                                                                      .bankModel[
                                                                          index]
                                                                      .account
                                                                      .toString();
                                                              if (state
                                                                  is UpdateBankLoadingState) {
                                                                return Center(
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                );
                                                              } else {
                                                                return Column(
                                                                  children: [
                                                                    TextFormField(
                                                                      obscureText:
                                                                          false,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'Name',
                                                                        hintStyle:
                                                                            TextStyle(color: Colors.black),
                                                                        labelStyle:
                                                                            TextStyle(color: Colors.black),
                                                                        border:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                            5.0,
                                                                          ),
                                                                          borderSide: BorderSide(
                                                                              width: 5.0,
                                                                              style: BorderStyle.solid,
                                                                              color: Color(0xff252b3b)),
                                                                        ),
                                                                      ),
                                                                      maxLines:
                                                                          1,
                                                                      controller:
                                                                          namecontroller,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    TextFormField(
                                                                      obscureText:
                                                                          false,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'Account',
                                                                        hintStyle:
                                                                            TextStyle(color: Colors.black),
                                                                        labelStyle:
                                                                            TextStyle(color: Colors.black),
                                                                        border:
                                                                            OutlineInputBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                            5.0,
                                                                          ),
                                                                          borderSide: BorderSide(
                                                                              width: 5.0,
                                                                              style: BorderStyle.solid,
                                                                              color: Color(0xff252b3b)),
                                                                        ),
                                                                      ),
                                                                      maxLines:
                                                                          2,
                                                                      controller:
                                                                          textEditingController,
                                                                    ),
                                                                    ElevatedButton(
                                                                      style: ButtonStyle(
                                                             backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                                                            ),
                                                                        onPressed:
                                                                            () {
                                                                          BankModel bankModel = BankModel(
                                                                              account: textEditingController.text,
                                                                              id: cubit.bankModel[index].id,
                                                                              name: namecontroller.text);
                                                                          BlocProvider.of<AccounterCubit>(context)
                                                                              .updateBank(bankModel: bankModel);
                                                                        },
                                                                        child: Text(
                                                                            'Update Bank'))
                                                                  ],
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        );
                                                      });
                                                },
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: appTheme.primaryColor,
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return BlocConsumer<
                                                            AccounterCubit,
                                                            AccounterState>(
                                                          listener:
                                                              (context, state) {
                                                            if (state
                                                                is DeleteBankSucState) {
                                                              Fluttertoast
                                                                  .showToast(
                                                                      msg:
                                                                          'Delete successfully');
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            } else if (state
                                                                is DeleteBankFaliedState) {
                                                              Fluttertoast
                                                                  .showToast(
                                                                      msg:
                                                                          'Check You Internet');
                                                            }
                                                          },
                                                          builder:
                                                              (context, state) {
                                                            if (state
                                                                is DelteBankLoadingState) {
                                                              return Center(
                                                                child:
                                                                    CircularProgressIndicator(),
                                                              );
                                                            } else {
                                                              return AlertDialog(
                                                                title: Column(
                                                                  children: [
                                                                    Text(
                                                                        'Are You Shure You Wont Delete This Account'),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        ElevatedButton(
                                                                          style: ButtonStyle(
                                                                              backgroundColor:   MaterialStateProperty.all<Color>(Colors.black), // Set the background color here
                                                                              ),
                                                                            onPressed:
                                                                                () {
                                                                              BlocProvider.of<AccounterCubit>(context).deleteBank(id: cubit.bankModel[index].id.toString());
                                                                            },
                                                                            child:
                                                                                Text('Yes')),
                                                                        ElevatedButton(
                                                                          style: ButtonStyle(
                                                                              backgroundColor:   MaterialStateProperty.all<Color>(Colors.black), // Set the background color here
                                                                              ),
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Text('No')),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        );
                                                      });
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: appTheme.primaryColor,
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        );
                      }),
                );
              }
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
               ),
              onPressed: () {
                textEditingController.clear();
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: BlocConsumer<AccounterCubit, AccounterState>(
                          listener: (context, state) {
                            if (state is AddBankSucState) {
                              Fluttertoast.showToast(msg: 'Add successfully');
                              cubit.getBank();
                              Navigator.pop(context);
                            } else if (state is AddBankFaieldState) {
                              Fluttertoast.showToast(msg: 'Invalied Data');
                            }
                          },
                          builder: (context, state) {
                            if (state is AddBankLoadingState) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Column(
                                children: [
                                  TextFormField(
                                    obscureText: false,
                                    style: TextStyle(fontSize: 14),
                                    decoration: InputDecoration(
                                      hintText: 'name',
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
                                    maxLines: 1,
                                    controller: namecontroller,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    obscureText: false,
                                    style: TextStyle(fontSize: 14),
                                    decoration: InputDecoration(
                                      hintText: 'Account',
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
                                    maxLines: 2,
                                    controller: textEditingController,
                                  ),
                                  ElevatedButton(

                                    style: ButtonStyle(
                                                             backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                                                            ),
                                      onPressed: () {
                                        BankModel bankModel = BankModel(
                                            name: namecontroller.text,
                                            account:
                                                textEditingController.text);
                                        BlocProvider.of<AccounterCubit>(context)
                                            .addBank(bankModel: bankModel);
                                      },
                                      child: Text('Add Bank'))
                                ],
                              );
                            }
                          },
                        ),
                      );
                    });
              },
              child: Text('Add new Accounting')),
        ],
      ),
    );
  }
}