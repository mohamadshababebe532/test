import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../../../../core/widgets/waiting_dialog_widget.dart';
import '../add/addinvoice.dart';
import '../cubit/accounter_cubit.dart';
import '../update/UpdateInvoice.dart';

class GetInvoiceScreen extends StatelessWidget {
  TextEditingController paiedcontroller = TextEditingController();
  TextEditingController searchcontroller = TextEditingController();
  TextEditingController paymentType = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var item = ['agent', 'total', 'company', 'date', 'invoice_id'];
  String? gender;
  GetInvoiceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AccounterCubit>(context);
    searchcontroller.clear();
    return Scaffold(
      body: BlocConsumer<AccounterCubit, AccounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetInvoiceLoadingState) {
            return ShimmerInvoice();
          } else if (cubit.getinvoiceModel.isEmpty) {
            return ListView(children: [
              // Row(
              //   children: [
              //     // IconButton(
              //     //     onPressed: () {
              //     //       Navigator.pop(context);
              //     //     },
              //     //     icon: Icon(Icons.arrow_back)),
              //     // Text(
              //     //   'My Invoice',
              //     //   style:
              //     //       TextStyle(color: appTheme.primaryColor, fontSize: 20),
              //     // ),
              //   ],
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      onPress: () {
                        cubit.getBank();
                        cubit.getagent();
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return AddInvoice();
                        }));
                      },
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width / 2,
                      height: 40,
                      title: 'Add Invoice'),
                  // IconButton(
                  //   onPressed: () {
                  //     showDialog(
                  //         context: context,
                  //         builder: (context) => AlertDialog(
                  //               title: BlocConsumer<AccounterCubit,
                  //                   AccounterState>(
                  //                 listener: (context, state) {
                  //                   if (state is SearchInvoiceSucState) {
                  //                     Fluttertoast.showToast(
                  //                         msg: 'Sucsess Search');
                  //                     Navigator.pop(context);
                  //                   } else if (state
                  //                       is SearchInvoiceFaieldState) {
                  //                     Fluttertoast.showToast(
                  //                         msg: 'No Invoice');
                  //                   }
                  //                 },
                  //                 builder: (context, state) {
                  //                   if (state
                  //                       is SearchInvoiceLoadingState) {
                  //                     return Center(
                  //                       child: CircularProgressIndicator(),
                  //                     );
                  //                   } else {
                  //                     return Column(
                  //                       children: [
                  //                         TextFormField(
                  //                           controller: searchcontroller,
                  //                           decoration: InputDecoration(
                  //                             hintText:
                  //                                 'Search by company name OR Invoice No',
                  //                             hintStyle: TextStyle(
                  //                                 color: Colors.black),
                  //                             labelStyle: TextStyle(
                  //                                 color: Colors.black),
                  //                             border: OutlineInputBorder(
                  //                               borderRadius:
                  //                                   BorderRadius.circular(
                  //                                 5.0,
                  //                               ),
                  //                               borderSide: BorderSide(
                  //                                   width: 5.0,
                  //                                   style:
                  //                                       BorderStyle.solid,
                  //                                   color:
                  //                                       Color(0xff252b3b)),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                         ElevatedButton(
                  //                           style: ButtonStyle(
                  //                                                           backgroundColor: MaterialStateProperty.all<Color>(Colors.black),

                  //                           ),
                  //                             onPressed: () {
                  //                               if (searchcontroller
                  //                                   .text.isEmpty) {
                  //                                 return;
                  //                               }
                  //                               BlocProvider.of<
                  //                                           AccounterCubit>(
                  //                                       context).filterItemsInv(searchcontroller.text);
                  //                                   // .searchinvoice(
                  //                                   //     filter: gender
                  //                                   //         .toString(),
                  //                                   //     search:
                  //                                   //         searchcontroller
                  //                                   //             .text);
                  //                               print('asd');
                  //                             },
                  //                             child: Text('Search')),
                  //                         // Row(
                  //                         //   children: [
                  //                         //     Padding(
                  //                         //       padding:
                  //                         //           const EdgeInsets.all(
                  //                         //               8.0),
                  //                         //       child: Text('Filter:'),
                  //                         //     ),
                  //                         //     Padding(
                  //                         //       padding:
                  //                         //           const EdgeInsets.all(
                  //                         //               8.0),
                  //                         //       child: Container(
                  //                         //         width:
                  //                         //             MediaQuery.of(context)
                  //                         //                     .size
                  //                         //                     .width /
                  //                         //                 3,
                  //                         //         height: 60,
                  //                         //         child:
                  //                         //             DropdownButtonFormField(
                  //                         //           elevation: 5,
                  //                         //           decoration: const InputDecoration(
                  //                         //               border: OutlineInputBorder(
                  //                         //                   borderRadius: BorderRadius
                  //                         //                       .all(Radius
                  //                         //                           .circular(
                  //                         //                               0)))),
                  //                         //           hint: Text(
                  //                         //             'Filter',
                  //                         //             style: TextStyle(
                  //                         //                 color:
                  //                         //                     Colors.black,
                  //                         //                 fontSize: 12),
                  //                         //           ),
                  //                         //           items: item.map(
                  //                         //               (String value) {
                  //                         //             return DropdownMenuItem<
                  //                         //                 String>(
                  //                         //               alignment: Alignment
                  //                         //                   .topLeft,
                  //                         //               value: value,
                  //                         //               child: Text(
                  //                         //                 '$value',
                  //                         //                 style: const TextStyle(
                  //                         //                     color: Colors
                  //                         //                         .black,
                  //                         //                     fontSize: 12),
                  //                         //               ),
                  //                         //             );
                  //                         //           }).toList(),
                  //                         //           onChanged: (newValue) {
                  //                         //             gender = newValue
                  //                         //                 .toString();
                  //                         //             print(gender);
                  //                         //           },
                  //                         //         ),
                  //                         //       ),
                  //                         //     ),
                  //                         //   ],
                  //                         // ),
                  //                         BlocConsumer<AccounterCubit,
                  //                             AccounterState>(
                  //                           listener: (context, state) {
                  //                             if (state
                  //                                 is GetFilterSucState) {
                  //                               Navigator.of(context).pop();
                  //                             } else if (state
                  //                                 is GetFilterFailedState) {
                  //                               Fluttertoast.showToast(
                  //                                   msg:
                  //                                       'Cheack Your Internet');
                  //                             }
                  //                           },
                  //                           builder: (context, state) {
                  //                             if (state
                  //                                 is GetFilterLoadingState) {
                  //                               return Center(
                  //                                 child:
                  //                                     CircularProgressIndicator(),
                  //                               );
                  //                             } else {
                  //                               return Row(
                  //                                 mainAxisAlignment:
                  //                                     MainAxisAlignment
                  //                                         .spaceBetween,
                  //                                 children: [
                  //                                   ElevatedButton(
                  //                                     onPressed: () {
                  //                                       cubit.filterinvocce(
                  //                                           type: 'date');
                  //                                     },
                  //                                     child: Text('Date'),
                  //                                   ),
                  //                                   ElevatedButton(
                  //                                       onPressed: () {
                  //                                         cubit.filterinvocce(
                  //                                             type:
                  //                                                 'invoice_id');
                  //                                       },
                  //                                       child: Text('ID'))
                  //                                 ],
                  //                               );
                  //                             }
                  //                           },
                  //                         )
                  //                       ],
                  //                     );
                  //                   }
                  //                 },
                  //               ),
                  //             ));
                  //   },
                  //   icon: Icon(
                  //     Icons.search,
                  //     size: 30,
                  //   )),
                ],
              ),
              Center(
                child: Text('No Invoice'),
              ),
            ]);
          } else {
            return Column(
              // padding: EdgeInsets.symmetric(horizontal: 20),
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
                    CustomButton(
                        onPress: () {
                          cubit.getBank();
                          cubit.getagent();
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return AddInvoice();
                          }));
                        },
                        color: Colors.black,
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 40,
                        title: 'Add Invoice'),
                    // IconButton(
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     },
                    //     icon: Icon(Icons.arrow_back)),
                    // Spacer(),
                    // Text(
                    //   'My Invoice',
                    //   style:
                    //       TextStyle(color: appTheme.primaryColor, fontSize: 20),
                    // ),
                    // Spacer(),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: BlocConsumer<AccounterCubit,
                                        AccounterState>(
                                      listener: (context, state) {
                                        if (state is SearchInvoiceSucState) {
                                          // Fluttertoast.showToast(
                                          //     msg: 'Sucsess Search');
                                          Navigator.pop(context);
                                        } else if (state
                                            is SearchInvoiceFaieldState) {
                                          Fluttertoast.showToast(
                                              msg: 'No Invoice');
                                        }
                                      },
                                      builder: (context, state) {
                                        if (state
                                            is SearchInvoiceLoadingState) {
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
                                                    }
                                                    BlocProvider.of<
                                                                AccounterCubit>(
                                                            context)
                                                        .filterItemsInv(
                                                            searchcontroller
                                                                .text);
                                                    // .searchinvoice(
                                                    //     filter: gender
                                                    //         .toString(),
                                                    //     search:
                                                    //         searchcontroller
                                                    //             .text);
                                                    print('asd');
                                                  },
                                                  child: Text('Search')),
                                              // Row(
                                              //   children: [
                                              //     Padding(
                                              //       padding:
                                              //           const EdgeInsets.all(
                                              //               8.0),
                                              //       child: Text('Filter:'),
                                              //     ),
                                              //     Padding(
                                              //       padding:
                                              //           const EdgeInsets.all(
                                              //               8.0),
                                              //       child: Container(
                                              //         width:
                                              //             MediaQuery.of(context)
                                              //                     .size
                                              //                     .width /
                                              //                 3,
                                              //         height: 60,
                                              //         child:
                                              //             DropdownButtonFormField(
                                              //           elevation: 5,
                                              //           decoration: const InputDecoration(
                                              //               border: OutlineInputBorder(
                                              //                   borderRadius: BorderRadius
                                              //                       .all(Radius
                                              //                           .circular(
                                              //                               0)))),
                                              //           hint: Text(
                                              //             'Filter',
                                              //             style: TextStyle(
                                              //                 color:
                                              //                     Colors.black,
                                              //                 fontSize: 12),
                                              //           ),
                                              //           items: item.map(
                                              //               (String value) {
                                              //             return DropdownMenuItem<
                                              //                 String>(
                                              //               alignment: Alignment
                                              //                   .topLeft,
                                              //               value: value,
                                              //               child: Text(
                                              //                 '$value',
                                              //                 style: const TextStyle(
                                              //                     color: Colors
                                              //                         .black,
                                              //                     fontSize: 12),
                                              //               ),
                                              //             );
                                              //           }).toList(),
                                              //           onChanged: (newValue) {
                                              //             gender = newValue
                                              //                 .toString();
                                              //             print(gender);
                                              //           },
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                              BlocConsumer<AccounterCubit,
                                                  AccounterState>(
                                                listener: (context, state) {
                                                  if (state
                                                      is GetFilterSucState) {
                                                    Navigator.of(context).pop();
                                                  } else if (state
                                                      is GetFilterFailedState) {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            'Cheack Your Internet');
                                                  }
                                                },
                                                builder: (context, state) {
                                                  if (state
                                                      is GetFilterLoadingState) {
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  } else {
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            cubit.filterinvocce(
                                                                type: 'date');
                                                          },
                                                          child: Text('Date'),
                                                        ),
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              cubit.filterinvocce(
                                                                  type:
                                                                      'invoice_id');
                                                            },
                                                            child: Text(
                                                                'date add'))
                                                      ],
                                                    );
                                                  }
                                                },
                                              )
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
                        )),
                  ],
                ),
                // SizedBox(
                //   height: 15,
                // ),
                // CustomButton(
                //     onPress: () {
                //       cubit.getBank();
                //       cubit.getagent();
                //       Navigator.of(context)
                //           .push(MaterialPageRoute(builder: (context) {
                //         return AddInvoice();
                //       }));
                //     },
                //     color: appTheme.primaryColor,
                //     width: MediaQuery.of(context).size.width / 1.2,
                //     height: 40,
                //     title: 'Add Invoice'),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.getinvoiceModel.length,
                    itemBuilder: (context, index) {
                      var invoiceModel = cubit.getinvoiceModel[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(color: Color(0xFFEBEBEB)),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              invoiceModel.agent!.company_name!.isNotEmpty
                                  ? Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Company Name : ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.8,
                                            child: Text(
                                              invoiceModel.agent!.company_name
                                                  .toString(),
                                              maxLines: 3,
                                            ))
                                      ],
                                    )
                                  : SizedBox.shrink(),
                              invoiceModel.date!.isNotEmpty
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text('Data : ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold)),
                                        Text(invoiceModel.date.toString()),
                                      ],
                                    )
                                  : SizedBox.shrink(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // invoiceModel.agent!.company_name!.isNotEmpty?    Row(
                                  //       crossAxisAlignment: CrossAxisAlignment.start,

                                  //       children: [
                                  //         Container(
                                  //           width: MediaQuery.of(context).size.width/3,
                                  //           child: Text('Company Name : ',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),)),

                                  //         SizedBox(
                                  //           width: MediaQuery.of(context).size.width/3.5,
                                  //           child: Text(invoiceModel.agent!.company_name.toString(),maxLines: 3,))
                                  //       ],
                                  //     ):SizedBox.shrink(),
                                  // invoiceModel.date!.isNotEmpty?  Row(
                                  //     children: [
                                  //       Text('Data :',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold)),
                                  //       Text(invoiceModel.date.toString()),
                                  //     ],
                                  //   ):SizedBox.shrink()
                                ],
                              ),
                              Row(
                                children: [
                                  invoiceModel.agent!.name!.isNotEmpty
                                      ? Row(
                                          children: [
                                            Text(
                                              'Name : ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(invoiceModel.agent!.name
                                                .toString())
                                          ],
                                        )
                                      : SizedBox.shrink(),
                                  Row(
                                    children: [
                                      invoiceModel.agent!.name!.isNotEmpty
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Text('Total : ',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            )
                                          : Text('Total : ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold)),
                                      Text(
                                          '${invoiceModel.total.toString()} QAR'),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xFF0F092F)),
                                      ),
                                      onPressed: () {
                                        paiedcontroller.clear();
                                        showBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return BlocConsumer<
                                                  AccounterCubit,
                                                  AccounterState>(
                                                listener: (context, state) {
                                                  if (state
                                                      is AddPaymentSucState) {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            'Add Paid Sucssyflly',
                                                        backgroundColor:
                                                            appTheme
                                                                .primaryColor);
                                                    Navigator.pop(context);
                                                    cubit.getinvoice();
                                                  } else if (state
                                                      is AddPaymentsFaieldSate) {
                                                    Fluttertoast.showToast(
                                                      msg: state.message,
                                                    );
                                                  }
                                                },
                                                builder: (context, state) {
                                                  return SingleChildScrollView(
                                                    child: Container(
                                                      width: double.infinity,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              2,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          30),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          30))),
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20.0),
                                                            child:
                                                                TextFormField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .phone,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Paid',
                                                                hintText:
                                                                    'Paid',
                                                                hintStyle: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                                labelStyle: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    5.0,
                                                                  ),
                                                                  borderSide: BorderSide(
                                                                      width:
                                                                          5.0,
                                                                      style: BorderStyle
                                                                          .solid,
                                                                      color: Color(
                                                                          0xff252b3b)),
                                                                ),
                                                              ),
                                                              controller:
                                                                  paiedcontroller,
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                              style:
                                                                  ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStateProperty.all<
                                                                            Color>(
                                                                        Color(
                                                                            0xFF0F092F)),
                                                              ),
                                                              onPressed: () {
                                                                BlocProvider.of<
                                                                            AccounterCubit>(
                                                                        context)
                                                                    .addPayment(
                                                                        id: invoiceModel
                                                                            .id
                                                                            .toString(),
                                                                        paid: paiedcontroller
                                                                            .text);
                                                              },
                                                              child: Text(state
                                                                      is AddPaymentsLoadingState
                                                                  ? 'Loading...'
                                                                  : 'Add Payment')),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            });
                                      },
                                      child: Text('Add Payment')),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => BlocConsumer<
                                                  AccounterCubit,
                                                  AccounterState>(
                                                listener: (context, state) {
                                                  if (state
                                                      is DeleteInvoiceSucState) {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            'Deleted Sucssyfly');
                                                    Navigator.of(context).pop();
                                                  } else if (state
                                                      is DeleteInvoiceFaliedState) {
                                                    Fluttertoast.showToast(
                                                        msg: 'Errors Deleted');
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                builder: (context, state) {
                                                  return AlertDialog(
                                                    title: Column(
                                                      children: [
                                                        Text(
                                                            'Are you shure you wont delete this invoice '),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            ElevatedButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all<
                                                                              Color>(
                                                                          Colors
                                                                              .black), // Set the background color here
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    Text('No')),
                                                            ElevatedButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all<
                                                                              Color>(
                                                                          Colors
                                                                              .black), // Set the background color here
                                                                ),
                                                                onPressed: () {
                                                                  cubit.deleteinvoce(
                                                                      id: cubit
                                                                          .getinvoiceModel[
                                                                              index]
                                                                          .id!);
                                                                },
                                                                child: Text(state
                                                                        is DeleteInvoiceLoadingState
                                                                    ? 'Loading...'
                                                                    : 'Yes'))
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
                                      color: appTheme.primaryColor,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        cubit.getagent();
                                        cubit.getBank();
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return UpdateInvoice(
                                              getInvoiceModel:
                                                  cubit.getinvoiceModel[index]);
                                        }));
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: appTheme.primaryColor,
                                      )),
                                  BlocConsumer<AccounterCubit, AccounterState>(
                                    listener: (context, state) {
                                      if (state is AddUrlLancherSucState) {
                                        Fluttertoast.showToast(
                                            msg: 'Generet Suc');
                                      } else if (state
                                          is AddUrlLancherFaieldState) {
                                        Fluttertoast.showToast(msg: 'Errors');
                                      }
                                    },
                                    builder: (context, state) {
                                      return IconButton(
                                          onPressed: () {
                                            cubit.urllancher(
                                                id: cubit
                                                    .getinvoiceModel[index].id
                                                    .toString());

                                            // cubit.getCarrency();
                                            //                       showDialog(
                                            //                           context: context,
                                            //                           builder: (context) => AlertDialog(
                                            //                             actions: [
                                            //                               ElevatedButton(onPressed: (){
                                            //                                 showDialog(context: context, builder:(context) {
                                            //                                   return AlertDialog(
                                            //                                     actions: [
                                            //                                       ElevatedButton(
                                            //                                         style: ButtonStyle(
                                            //                                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFC28F0F)),

                                            //                                         ),
                                            //                                         onPressed: () {
                                            //                                         if(_formKey.currentState!.validate()){
                                            //                                            cubit.addPaymentType(
                                            //                                             AddCurrencies(type: paymentType.text)
                                            //                                           );

                                            //                                         }

                                            //                                       }, child: Text('Add')),
                                            //                                       ElevatedButton(
                                            //                                         style: ButtonStyle(
                                            //                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFC28F0F)),

                                            //                                         ),
                                            //                                         onPressed: (){
                                            //                                           Navigator.of(context).pop();
                                            //                                         }, child: Text('Cancle')),

                                            //                                     ],
                                            //                                     title:Text( 'Add Currency Type'),
                                            //                                     content: BlocConsumer<AccounterCubit, AccounterState>(
                                            //                                       listener: (context, state) {
                                            //                                         if(state is AddCurrencyFaluerState){
                                            //                                            Fluttertoast.showToast(
                                            //                       msg: 'Add Error');
                                            //                       Navigator.of(context).pop();
                                            //                                         }
                                            //                                         else if(state is AddCurrencySucState){
                                            //                                               Fluttertoast.showToast(
                                            //                       msg: 'Add Succses');
                                            //                       Navigator.of(context).pop();
                                            //                                         }
                                            //                                       },
                                            //                                       builder: (context,state) {
                                            //                                         if(state is AddCurrencyLoadingState){
                                            //                                           return Center(child: CircularProgressIndicator(),);
                                            //                                         }
                                            //                                         else{
                                            //                                            return Form(
                                            //                                           key: _formKey,
                                            //                                           child: TextFormField(
                                            //                                             controller: paymentType,
                                            //                                             keyboardType: TextInputType.text,
                                            //                                             decoration: InputDecoration(
                                            //                                               filled: true,
                                            //                                              fillColor: Colors.grey,
                                            //                                               errorBorder: OutlineInputBorder(
                                            //                                                   gapPadding: 12,
                                            //                                                   borderRadius:
                                            //                                                       BorderRadius.all(Radius.circular(15.0)),
                                            //                                                   borderSide: BorderSide(
                                            //                                                     color: Colors.red,
                                            //                                                   ),
                                            //                                                 ),
                                            //                                             ),
                                            //                                             validator: (value) {
                                            //                                               if(paymentType.text.isEmpty){
                                            //                                                 return 'Please Add Payment Type ';
                                            //                                               }
                                            //                                             },

                                            //                                           ),
                                            //                                         );

                                            //                                         }

                                            //                                       }
                                            //                                     ),

                                            //                                   );
                                            //                                 },);

                                            //                               }, child: Text('Add Currency'),
                                            //                               style: ButtonStyle(
                                            //                                 backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFC28F0F)),

                                            //                               ),
                                            //                               )
                                            //                             ],
                                            //                             content: BlocConsumer<AccounterCubit, AccounterState>(
                                            //                              listener: (context, state) {
                                            //                              if(state is CurrencyFaluerState){
                                            //                                    Fluttertoast.showToast(msg:'Check Your Internet');
                                            //                                 }
                                            //                              },
                                            //                               builder: (context, state) {
                                            //                                 if(state is CurrencyLoadingState){
                                            //                                   return Center(child: CircularProgressIndicator());
                                            //                                 }

                                            //                                 else{
                                            //                                   return   SizedBox(
                                            //                                     height: MediaQuery.of(context).size.height/4.5,
                                            //                                     width: MediaQuery.of(context).size.width/4,
                                            //                                     child: ListView.builder(
                                            //                                     itemCount: cubit.currency.length,
                                            //                                     itemBuilder:(context, index) {
                                            //                                      return  Padding(
                                            //                                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                            //                                        child: GestureDetector(
                                            //                                         onTap: () {
                                            //                                            cubit.urllancher(

                                            //                                              id: cubit
                                            //                                                  .getinvoiceModel[
                                            //                                                      index]
                                            //                                                  .id
                                            //                                                  .toString());
                                            //                                         },
                                            //                                          child: Container(
                                            //                                           decoration: BoxDecoration(
                                            //                                             border: Border.all(color: Colors.black)
                                            //                                           ),
                                            //                                           child: Padding(
                                            //                                             padding: const EdgeInsets.symmetric(horizontal: 20),
                                            //                                             child: Text(cubit.currency[index].type.toString()),
                                            //                                           ),

                                            //                                          ),
                                            //                                        ),

                                            //                                      );
                                            //                                                                                         },),
                                            //                                   );
                                            //                                 }
                                            //                               },
                                            //                               //   ListView.builder(
                                            //                               //   itemCount: getAallCurrencies.currencies.length,
                                            //                               //   itemBuilder:(context, index) {

                                            //                               // },),
                                            //                             ),
                                            //                                 title: Column(
                                            //                                   children: [
                                            //                                     Text(
                                            //                                       'Choose Cyrancy Type',
                                            //                                     ),
                                            //                                     // Row(
                                            //                                     //   mainAxisAlignment:
                                            //                                     //       MainAxisAlignment
                                            //                                     //           .spaceBetween,
                                            //                                     //   children: [
                                            //                                     //     ElevatedButton(
                                            //                                     //         onPressed: () {
                                            //                                     //           Navigator.pop(
                                            //                                     //               context);
                                            //                                     //           cubit.urllancher(
                                            //                                     //               total:
                                            //                                     //                   '1',
                                            //                                     //               type: '0',
                                            //                                     //               id: cubit
                                            //                                     //                   .getinvoiceModel[
                                            //                                     //                       index]
                                            //                                     //                   .id
                                            //                                     //                   .toString());
                                            //                                     //         },
                                            //                                     //         child: Text(
                                            //                                     //             'SYP')),
                                            //                                     //     ElevatedButton(
                                            //                                     //         onPressed: () {
                                            //                                     //           Navigator.pop(
                                            //                                     //               context);
                                            //                                     //           cubit.urllancher(
                                            //                                     //               total:
                                            //                                     //                   '1',
                                            //                                     //               type: '1',
                                            //                                     //               id: cubit
                                            //                                     //                   .getinvoiceModel[
                                            //                                     //                       index]
                                            //                                     //                   .id
                                            //                                     //                   .toString());
                                            //                                     //         },
                                            //                                     //         child: Text(
                                            //                                     //             'AED')),
                                            //                                     //     ElevatedButton(
                                            //                                     //         onPressed: () {
                                            //                                     //           cubit.urllancher(
                                            //                                     //               total:
                                            //                                     //                   '1',
                                            //                                     //               type: '2',
                                            //                                     //               id: cubit
                                            //                                     //                   .getinvoiceModel[
                                            //                                     //                       index]
                                            //                                     //                   .id
                                            //                                     //                   .toString());
                                            //                                     //         },
                                            //                                     //         child: Text(
                                            //                                     //             'USD ')),
                                            //                                     //     ElevatedButton(
                                            //                                     //         onPressed: () {
                                            //                                     //           cubit.urllancher(
                                            //                                     //               total:
                                            //                                     //                   '1',
                                            //                                     //               type: '3',
                                            //                                     //               id: cubit
                                            //                                     //                   .getinvoiceModel[
                                            //                                     //                       index]
                                            //                                     //                   .id
                                            //                                     //                   .toString());
                                            //                                     //         },
                                            //                                     //         child: Text(
                                            //                                     //             'QAR '))
                                            //                                     //   ],
                                            //                                     // ),
                                            //                                   ],
                                            //                                 ),
                                            //                               ));
                                          },
                                          icon: Icon(
                                            Icons.picture_as_pdf_rounded,
                                            color: appTheme.primaryColor,
                                          ));
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Column(
                          //   children: [
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Row(
                          //           children: [
                          //             Text(
                          //               'Invoice Id: '.toUpperCase(),
                          //               style: TextStyle(
                          //                   color: appTheme.primaryColor,
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 13),
                          //             ),
                          //             Text(invoiceModel.id.toString(),style: TextStyle(),)
                          //           ],
                          //         ),
                          //         Text(cubit.getinvoiceModel[index].Convertar
                          //             .toString()),
                          //       ],
                          //     ),
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Row(
                          //           children: [
                          //             Text(cubit.getinvoiceModel[index].Convertar
                          //                 .toString()),
                          //             Text(
                          //               'ID  ',
                          //               style: TextStyle(
                          //                   color: appTheme.primaryColor,
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             Text(invoiceModel.agent_id.toString()),
                          //           ],
                          //         ),
                          //         Row(
                          //           children: [
                          //             Text(
                          //               'Type  ',
                          //               style: TextStyle(
                          //                   color: appTheme.primaryColor,
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             Text(invoiceModel.agent!.type.toString()),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //     Row(
                          //       children: [
                          //         Text(
                          //           'Website  ',
                          //           style: TextStyle(
                          //               color: appTheme.primaryColor,
                          //               fontSize: 15,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //         Container(
                          //           width: MediaQuery.of(context).size.width / 2,
                          //           child: Text(
                          //               invoiceModel.agent!.website.toString()),
                          //         ),
                          //       ],
                          //     ),
                          //     Row(
                          //       children: [
                          //         Text(
                          //           'Name  ',
                          //           style: TextStyle(
                          //               color: appTheme.primaryColor,
                          //               fontSize: 15,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //         Container(
                          //           width: MediaQuery.of(context).size.width / 2,
                          //           child: Text(
                          //               '  ${invoiceModel.agent!.name.toString()}'),
                          //         ),
                          //       ],
                          //     ),
                          //     Row(
                          //       children: [
                          //         Text(
                          //           'Company  ',
                          //           style: TextStyle(
                          //               color: appTheme.primaryColor,
                          //               fontSize: 15,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //         Container(
                          //           width: MediaQuery.of(context).size.width / 2,
                          //           child: Text(
                          //               '${invoiceModel.agent!.company_name.toString()}'),
                          //         ),
                          //       ],
                          //     ),
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Row(
                          //           children: [
                          //             Text(
                          //               'Phone  ',
                          //               style: TextStyle(
                          //                   color: appTheme.primaryColor,
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             Container(
                          //               child: Text(
                          //                   '${invoiceModel.agent!.phone_number.toString()}'),
                          //             ),
                          //           ],
                          //         ),
                          //         Row(
                          //           children: [
                          //             Text(
                          //               'LandLine  ',
                          //               style: TextStyle(
                          //                   color: appTheme.primaryColor,
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             Container(
                          //               child: Text(
                          //                   '${invoiceModel.agent!.land_line.toString()}'),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //     Row(
                          //       children: [
                          //         Text(
                          //           'Country  ',
                          //           style: TextStyle(
                          //               color: appTheme.primaryColor,
                          //               fontSize: 15,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //         Container(
                          //           width: MediaQuery.of(context).size.width / 2,
                          //           child: Text(
                          //               '${invoiceModel.agent!.country.toString()}'),
                          //         ),
                          //       ],
                          //     ),
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Row(
                          //           children: [
                          //             Text(
                          //               'Date  ',
                          //               style: TextStyle(
                          //                   color: appTheme.primaryColor,
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             Container(
                          //               child: Text(
                          //                   '${invoiceModel.date.toString()}'),
                          //             ),
                          //           ],
                          //         ),
                          //         Row(
                          //           children: [
                          //             Text(
                          //               'Due Date ',
                          //               style: TextStyle(
                          //                   color: appTheme.primaryColor,
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             Container(
                          //               child: Text(
                          //                   '${invoiceModel.duedate.toString()}'),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //     Row(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           'Note:      ',
                          //           style:
                          //               TextStyle(color: appTheme.primaryColor,fontWeight: FontWeight.bold),
                          //         ),
                          //         Container(
                          //           width: MediaQuery.of(context).size.width / 2,
                          //           child: Text(invoiceModel.note.toString()),
                          //         ),
                          //       ],
                          //     ),
                          //     Container(

                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(10),
                          //          color: Colors.grey.shade300,
                          //       ),
                          //       child: Column(
                          //         children: [
                          //         Row(
                          //       mainAxisAlignment: MainAxisAlignment.end,
                          //       children: [
                          //         IconButton(
                          //           onPressed: () {
                          //             showDialog(
                          //                 context: context,
                          //                 builder: (context) => BlocConsumer<
                          //                         AccounterCubit, AccounterState>(
                          //                       listener: (context, state) {
                          //                         if (state
                          //                             is DeleteInvoiceSucState) {
                          //                           Fluttertoast.showToast(
                          //                               msg: 'Deleted Sucssyfly');
                          //                           Navigator.of(context).pop();
                          //                         } else if (state
                          //                             is DeleteInvoiceFaliedState) {
                          //                           Fluttertoast.showToast(
                          //                               msg: 'Errors Deleted');
                          //                           Navigator.pop(context);
                          //                         }
                          //                       },
                          //                       builder: (context, state) {
                          //                         return AlertDialog(
                          //                           title: Column(
                          //                             children: [
                          //                               Text(
                          //                                   'Are you shure you wont delete this invoice '),
                          //                               Row(
                          //                                 mainAxisAlignment:
                          //                                     MainAxisAlignment
                          //                                         .spaceBetween,
                          //                                 children: [
                          //                                   ElevatedButton(
                          //                                       onPressed: () {
                          //                                         Navigator.of(
                          //                                                 context)
                          //                                             .pop();
                          //                                       },
                          //                                       child:
                          //                                           Text('No')),
                          //                                   ElevatedButton(
                          //                                       onPressed: () {
                          //                                         cubit.deleteinvoce(
                          //                                             id: cubit
                          //                                                 .getinvoiceModel[
                          //                                                     index]
                          //                                                 .id!);
                          //                                       },
                          //                                       child: Text(state
                          //                                               is DeleteInvoiceLoadingState
                          //                                           ? 'Loading...'
                          //                                           : 'Yes'))
                          //                                 ],
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         );
                          //                       },
                          //                     ));
                          //           },
                          //           icon: Icon(
                          //             Icons.delete,
                          //             color: appTheme.primaryColor,
                          //           ),
                          //         ),
                          //         IconButton(
                          //             onPressed: () async {
                          //               cubit.getagent();
                          //               cubit.getBank();
                          //               Navigator.of(context).push(
                          //                   MaterialPageRoute(builder: (context) {
                          //                 return UpdateInvoice(
                          //                     getInvoiceModel:
                          //                         cubit.getinvoiceModel[index]);
                          //               }));
                          //             },
                          //             icon: Icon(
                          //               Icons.edit,
                          //               color: appTheme.primaryColor,
                          //             )),
                          //         BlocConsumer<AccounterCubit, AccounterState>(
                          //           listener: (context, state) {
                          //             if (state is AddUrlLancherSucState) {
                          //               Fluttertoast.showToast(
                          //                   msg: 'Generet Suc');
                          //             } else if (state
                          //                 is AddUrlLancherFaieldState) {
                          //               Fluttertoast.showToast(msg: 'Errors');
                          //             }
                          //           },
                          //           builder: (context, state) {
                          //             return IconButton(
                          //                 onPressed: () {
                          //                   showDialog(
                          //                       context: context,
                          //                       builder: (context) => AlertDialog(
                          //                             title: Column(
                          //                               children: [
                          //                                 Text(
                          //                                   'Choose Cyrancy Type',
                          //                                 ),
                          //                                 Row(
                          //                                   mainAxisAlignment:
                          //                                       MainAxisAlignment
                          //                                           .spaceBetween,
                          //                                   children: [
                          //                                     ElevatedButton(
                          //                                         onPressed: () {
                          //                                           Navigator.pop(
                          //                                               context);
                          //                                           cubit.urllancher(
                          //                                               total:
                          //                                                   '1',
                          //                                               type: '0',
                          //                                               id: cubit
                          //                                                   .getinvoiceModel[
                          //                                                       index]
                          //                                                   .id
                          //                                                   .toString());
                          //                                         },
                          //                                         child: Text(
                          //                                             'SYP')),
                          //                                     ElevatedButton(
                          //                                         onPressed: () {
                          //                                           Navigator.pop(
                          //                                               context);
                          //                                           cubit.urllancher(
                          //                                               total:
                          //                                                   '1',
                          //                                               type: '1',
                          //                                               id: cubit
                          //                                                   .getinvoiceModel[
                          //                                                       index]
                          //                                                   .id
                          //                                                   .toString());
                          //                                         },
                          //                                         child: Text(
                          //                                             'AED')),
                          //                                     ElevatedButton(
                          //                                         onPressed: () {
                          //                                           cubit.urllancher(
                          //                                               total:
                          //                                                   '1',
                          //                                               type: '2',
                          //                                               id: cubit
                          //                                                   .getinvoiceModel[
                          //                                                       index]
                          //                                                   .id
                          //                                                   .toString());
                          //                                         },
                          //                                         child: Text(
                          //                                             'USD ')),
                          //                                     ElevatedButton(
                          //                                         onPressed: () {
                          //                                           cubit.urllancher(
                          //                                               total:
                          //                                                   '1',
                          //                                               type: '3',
                          //                                               id: cubit
                          //                                                   .getinvoiceModel[
                          //                                                       index]
                          //                                                   .id
                          //                                                   .toString());
                          //                                         },
                          //                                         child: Text(
                          //                                             'QAR '))
                          //                                   ],
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                           ));
                          //                 },
                          //                 icon: Icon(
                          //                   Icons.picture_as_pdf_rounded,
                          //                   color: appTheme.primaryColor,
                          //                 ));
                          //           },
                          //         ),
                          //       ],
                          //     ),
                          //     ExpansionTile(

                          //       backgroundColor: Colors.grey.shade300,
                          //       children: [
                          //         ListView.builder(
                          //           shrinkWrap: true,
                          //           physics: NeverScrollableScrollPhysics(),
                          //           itemCount: invoiceModel.orders!.length,
                          //           itemBuilder: (context, orderIndex) {
                          //             var i = orderIndex;
                          //             var order =
                          //                 invoiceModel.orders![orderIndex];

                          //             return Column(
                          //               children: [
                          //                 Row(
                          //                   children: [
                          //                     Text('#${i+1}'),
                          //                   ],
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.symmetric(
                          //                       horizontal: 10.0),
                          //                   child: Row(
                          //                     children: [
                          //                       Text(
                          //                         'Description : ',
                          //                         style: TextStyle(
                          //                             color: Colors.black,fontWeight: FontWeight.bold),
                          //                       ),
                          //                       Container(
                          //                         width: MediaQuery.of(context)
                          //                                 .size
                          //                                 .width /
                          //                             2,
                          //                         child: Text(
                          //                             '${order.description.toString()}'),
                          //                       )
                          //                     ],
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.symmetric(
                          //                       horizontal: 10.0),
                          //                   child: Row(
                          //                     children: [
                          //                       Text(
                          //                         'Price : ',
                          //                         style: TextStyle(
                          //                             color: Colors.black,fontWeight: FontWeight.bold),
                          //                       ),
                          //                       Text(
                          //                           '${order.price.toString()}  ${cubit.getinvoiceModel[index].currency_type}'),
                          //                     ],
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.symmetric(
                          //                       horizontal: 10.0),
                          //                   child: Row(
                          //                     children: [
                          //                       Text(
                          //                         'QYT : ',
                          //                         style: TextStyle(
                          //                             color: Colors.black,fontWeight: FontWeight.bold),
                          //                       ),
                          //                       Text(
                          //                           '${order.quantity.toString()}')
                          //                     ],
                          //                   ),
                          //                 ),
                          //                 SizedBox(
                          //                   height: 15,
                          //                 ),
                          //               ],
                          //             );
                          //           },
                          //         ),
                          //       ],
                          //       title: Center(
                          //         child: Text(
                          //           'Order Details',
                          //           style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                          //         ),
                          //       ),

                          //       // collapsedIconColor: Colors.white,
                          //       // collapsedBackgroundColor: appTheme.primaryColor,
                          //       // iconColor: appTheme.primaryColor,
                          //       // textColor: appTheme.primaryColor,
                          //       // collapsedTextColor: Colors.white,
                          //     ),
                          //       Row(
                          //       children: [
                          //         Text('SubTotal : ',style: TextStyle(fontWeight: FontWeight.bold),),
                          //         Text(
                          //           '${cubit.getinvoiceModel[index].subtotal}  ${cubit.getinvoiceModel[index].currency_type}',

                          //         ),
                          //       ],
                          //     ),
                          //     Row(
                          //       children: [
                          //         Text('Tax Due  : ',style: TextStyle(fontWeight: FontWeight.bold),),
                          //         Text(
                          //           '${cubit.getinvoiceModel[index].tax.toString()} ${cubit.getinvoiceModel[index].currency_type}',

                          //         ),
                          //       ],
                          //     ),
                          //     Row(
                          //       children: [
                          //         Text('Discount Due : ',style: TextStyle(fontWeight: FontWeight.bold),),
                          //         Text(
                          //           '${cubit.getinvoiceModel[index].discount.toString()} ${cubit.getinvoiceModel[index].currency_type}',

                          //         ),
                          //       ],
                          //     ),
                          //     Row(
                          //       children: [
                          //         Text('Tax  Rate:   ',style: TextStyle(fontWeight: FontWeight.bold),),
                          //         Text(
                          //           '${cubit.getinvoiceModel[index].tax_rate}   %',

                          //         ),
                          //       ],
                          //     ),

                          //     Row(
                          //       children: [
                          //         Text('Discount Rate:    ',style: TextStyle(fontWeight: FontWeight.bold),),
                          //         Text(
                          //           '${cubit.getinvoiceModel[index].discount_rate}  %',

                          //         ),
                          //       ],
                          //     ),

                          //     ListView.builder(
                          //         shrinkWrap: true,
                          //         physics: NeverScrollableScrollPhysics(),
                          //         itemCount: invoiceModel.bill_payments!.length,
                          //         itemBuilder: (context, paiedindex) {
                          //           return Column(
                          //             children: [
                          //               Row(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.spaceBetween,
                          //                 children: [
                          //                   Text(
                          //                       'Paid : ${invoiceModel.bill_payments![paiedindex].paid.toString()}',style: TextStyle(fontWeight: FontWeight.bold),),
                          //                   IconButton(
                          //                     onPressed: () {
                          //                       showDialog(
                          //                           context: context,
                          //                           builder: (context) =>
                          //                               BlocConsumer<
                          //                                   AccounterCubit,
                          //                                   AccounterState>(
                          //                                 listener:
                          //                                     (context, state) {
                          //                                   if (state
                          //                                       is DeletedPaiedLoadingState) {
                          //                                     Fluttertoast.showToast(
                          //                                         msg:
                          //                                             'Deleted Sucssyfly');
                          //                                     Navigator.of(
                          //                                             context)
                          //                                         .pop();
                          //                                   } else if (state
                          //                                       is DeletedPaidFaieldState) {
                          //                                     Fluttertoast.showToast(
                          //                                         msg:
                          //                                             'Errors Deleted');
                          //                                     Navigator.pop(
                          //                                         context);
                          //                                   }
                          //                                 },
                          //                                 builder:
                          //                                     (context, state) {
                          //                                   return AlertDialog(
                          //                                     title: Column(
                          //                                       children: [
                          //                                         Text(
                          //                                             'Are you shure you wont delete this paied '),
                          //                                         Row(
                          //                                           mainAxisAlignment:
                          //                                               MainAxisAlignment
                          //                                                   .spaceBetween,
                          //                                           children: [
                          //                                             ElevatedButton(
                          //                                                 onPressed:
                          //                                                     () {
                          //                                                   Navigator.of(context)
                          //                                                       .pop();
                          //                                                 },
                          //                                                 child: Text(
                          //                                                     'No')),
                          //                                             ElevatedButton(
                          //                                                 onPressed:
                          //                                                     () {
                          //                                                   cubit.deletepaied(
                          //                                                       id: invoiceModel.bill_payments![paiedindex].id.toString());
                          //                                                 },
                          //                                                 child: Text(state
                          //                                                         is DeletedPaiedLoadingState
                          //                                                     ? 'Loading...'
                          //                                                     : 'Yes'))
                          //                                           ],
                          //                                         ),
                          //                                       ],
                          //                                     ),
                          //                                   );
                          //                                 },
                          //                               ));
                          //                     },
                          //                     icon: Icon(
                          //                       Icons.delete,
                          //                       color: appTheme.primaryColor,
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ],
                          //           );
                          //         }),
                          //     Row(
                          //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Text(
                          //           'Sum Of Paid: ',
                          //           style: TextStyle(
                          //               color: Colors.black,
                          //               fontWeight: FontWeight.bold,
                          //               fontSize: 15),
                          //         ),
                          //         Text(' ${cubit.getinvoiceModel[index].all_paid.toString()}${cubit.getinvoiceModel[index].currency_type}')
                          //         // PopupMenuItem(child: Icon(Icons.))
                          //       ],
                          //     ),
                          //     // تضيف بعض المساحة بين الفواتير
                          //     Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Row(
                          //           children: [
                          //             Text('Total : ',style: TextStyle(fontWeight: FontWeight.bold)),
                          //             Container(
                          //               width:
                          //                   MediaQuery.of(context).size.width / 3,
                          //               child: Text(
                          //                 '${cubit.getinvoiceModel[index].total}  ${cubit.getinvoiceModel[index].currency_type}',

                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //         ElevatedButton(
                          //             onPressed: () {
                          //               paiedcontroller.clear();
                          //               showBottomSheet(
                          //                   context: context,
                          //                   builder: (context) {
                          //                     return BlocConsumer<AccounterCubit,
                          //                         AccounterState>(
                          //                       listener: (context, state) {
                          //                         if (state
                          //                             is AddPaymentSucState) {
                          //                           Fluttertoast.showToast(
                          //                               msg:
                          //                                   'Add Paid Sucssyflly',
                          //                               backgroundColor: appTheme
                          //                                   .primaryColor);
                          //                           Navigator.pop(context);
                          //                           cubit.getinvoice();
                          //                         } else if (state
                          //                             is AddPaymentsFaieldSate) {
                          //                           Fluttertoast.showToast(
                          //                             msg: state.message,
                          //                           );
                          //                         }
                          //                       },
                          //                       builder: (context, state) {
                          //                         return Container(
                          //                           width: double.infinity,
                          //                           height: MediaQuery.of(context)
                          //                                   .size
                          //                                   .height /
                          //                               3,
                          //                           padding: EdgeInsets.symmetric(
                          //                               horizontal: 10),
                          //                           decoration: BoxDecoration(
                          //                               color: Colors.white,
                          //                               borderRadius:
                          //                                   BorderRadius.only(
                          //                                       topLeft: Radius
                          //                                           .circular(30),
                          //                                       topRight: Radius
                          //                                           .circular(
                          //                                               30))),
                          //                           child: Column(
                          //                             children: [
                          //                               Padding(
                          //                                 padding:
                          //                                     const EdgeInsets
                          //                                         .all(20.0),
                          //                                 child: TextFormField(
                          //                                   keyboardType:
                          //                                       TextInputType
                          //                                           .phone,
                          //                                   decoration:
                          //                                       InputDecoration(
                          //                                     labelText: 'Paid',
                          //                                     hintText: 'Paid',
                          //                                     hintStyle: TextStyle(
                          //                                         color: Colors
                          //                                             .black),
                          //                                     labelStyle:
                          //                                         TextStyle(
                          //                                             color: Colors
                          //                                                 .black),
                          //                                     border:
                          //                                         OutlineInputBorder(
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                         5.0,
                          //                                       ),
                          //                                       borderSide: BorderSide(
                          //                                           width: 5.0,
                          //                                           style:
                          //                                               BorderStyle
                          //                                                   .solid,
                          //                                           color: Color(
                          //                                               0xff252b3b)),
                          //                                     ),
                          //                                   ),
                          //                                   controller:
                          //                                       paiedcontroller,
                          //                                 ),
                          //                               ),
                          //                               ElevatedButton(
                          //                                   onPressed: () {
                          //                                     BlocProvider.of<
                          //                                                 AccounterCubit>(
                          //                                             context)
                          //                                         .addPayment(
                          //                                             id: invoiceModel
                          //                                                 .id
                          //                                                 .toString(),
                          //                                             paid: paiedcontroller
                          //                                                 .text);
                          //                                   },
                          //                                   child: Text(state
                          //                                           is AddPaymentsLoadingState
                          //                                       ? 'Loading...'
                          //                                       : 'Add Payment')),
                          //                             ],
                          //                           ),
                          //                         );
                          //                       },
                          //                     );
                          //                   });
                          //             },
                          //             child: Text('Add Payment')
                          //             ),
                          //       ],
                          //     ),

                          //       ]),
                          //     ),

                          //     // ////////////////////////////////////////////////////////////////////////////////////////////////
                          //     Divider(
                          //       thickness: 3,
                          //       height: 50,
                          //       color: Colors.grey,
                          //     ),
                          //   ],
                          // ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
