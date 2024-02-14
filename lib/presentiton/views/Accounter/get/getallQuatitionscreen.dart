// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
 
import 'package:intl/intl.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/shimmer_widget.dart';
import '../../../../core/widgets/waiting_dialog_widget.dart';
import '../add/addqutaionscreen.dart';
import '../cubit/accounter_cubit.dart';
import '../update/updateQuationScreen.dart';
class GetQuationScreen extends StatelessWidget {
   GetQuationScreen({super.key});
  TextEditingController searchcontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  var item = ['agent', 'total', 'company', 'date', 'invoice_id'];
  String? gender;
  @override
  Widget build(BuildContext context) {
    searchcontroller.clear();
    var cubit = BlocProvider.of<AccounterCubit>(context);
    return Scaffold(
      body: BlocConsumer<AccounterCubit, AccounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetQuatitionLoadingState) {
            return ShimmerInvoice();
          } else if (cubit.getQuationModel.isEmpty) {
            return ListView(
             
              children: [
              
              SizedBox(
                height: 15,
              ),
              Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   
                  CustomButton(
                      onPress: () {
                        cubit.getagent();
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return AddQuatirions();
                        }));
                      },
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width/1.5,
                      height: 40,
                      title: 'Add Qoutation'),
                      // IconButton(
                      //   onPressed: () {
                      //     showDialog(
                      //         context: context,
                      //         builder: (context) => AlertDialog(
                      //               title: BlocConsumer<AccounterCubit,
                      //                   AccounterState>(
                      //                 listener: (context, state) {
                      //                   if (state is SearchQSucState) {
                      //                     Navigator.pop(context);
                      //                   } else if (state
                      //                       is SearchQFailedState) {
                      //                     Fluttertoast.showToast(
                      //                         msg: 'No Invoice');
                      //                   }
                      //                 },
                      //                 builder: (context, state) {
                      //                   if (state is SearchQLoadingState) {
                      //                     return Center(
                      //                       child:
                      //                           CircularProgressIndicator(),
                      //                     );
                      //                   } else {
                      //                     return Column(
                      //                       children: [
                      //                         TextFormField(
                      //                           controller:
                      //                               searchcontroller,
                      //                           decoration: InputDecoration(
                      //                             labelText: 'Search',
                      //                             hintText:
                      //                                 'Search by company name',
                      //                             hintStyle: TextStyle(
                      //                                 color: Colors.black),
                      //                             labelStyle: TextStyle(
                      //                                 color: Colors.black),
                      //                             border:
                      //                                 OutlineInputBorder(
                      //                               borderRadius:
                      //                                   BorderRadius
                      //                                       .circular(

                      //                                 5.0,
                      //                               ),
                      //                               borderSide: BorderSide(
                      //                                   width: 5.0,
                      //                                   style: BorderStyle
                      //                                       .solid,
                      //                                   color: Color(
                      //                                       0xff252b3b)),
                      //                             ),
                      //                           ),
                      //                         ),
                      //                         ElevatedButton(
                      //                           style: ButtonStyle(
                      //                                                           backgroundColor: MaterialStateProperty.all<Color>(Colors.black),

                      //                           ),
                      //                             onPressed: () {
                      //                               BlocProvider.of<
                      //                                           AccounterCubit>(
                      //                                       context).
                      //                                       filterItems(searchcontroller.text);
                      //                                   // .searchqoutaion(
                      //                                   //     filter: gender
                      //                                   //         .toString(),
                      //                                   //     search:
                      //                                   //         searchcontroller
                      //                                   //             .text);
                      //                             },
                      //                             child: Text('Search')),
                      //                         // Row(
                      //                         //   children: [
                      //                         //     Padding(
                      //                         //       padding:
                      //                         //           const EdgeInsets
                      //                         //               .all(8.0),
                      //                         //       child: Text('Filter:'),
                      //                         //     ),
                      //                         //     Padding(
                      //                         //       padding:
                      //                         //           const EdgeInsets
                      //                         //               .all(8.0),
                      //                         //       child: Container(
                      //                         //         width: MediaQuery.of(
                      //                         //                     context)
                      //                         //                 .size
                      //                         //                 .width /
                      //                         //             3,
                      //                         //         height: 60,
                      //                         //         child:
                      //                         //             DropdownButtonFormField(
                      //                         //           elevation: 5,
                      //                         //           decoration: const InputDecoration(
                      //                         //               border: OutlineInputBorder(
                      //                         //                   borderRadius:
                      //                         //                       BorderRadius.all(
                      //                         //                           Radius.circular(0)))),
                      //                         //           hint: Text(
                      //                         //             'Filter',
                      //                         //             style: TextStyle(
                      //                         //                 color: Colors
                      //                         //                     .black,
                      //                         //                 fontSize: 12),
                      //                         //           ),
                      //                         //           items: item.map(
                      //                         //               (String value) {
                      //                         //             return DropdownMenuItem<
                      //                         //                 String>(
                      //                         //               alignment:
                      //                         //                   Alignment
                      //                         //                       .topLeft,
                      //                         //               value: value,
                      //                         //               child: Text(
                      //                         //                 '$value',
                      //                         //                 style: const TextStyle(
                      //                         //                     color: Colors
                      //                         //                         .black,
                      //                         //                     fontSize:
                      //                         //                         12),
                      //                         //               ),
                      //                         //             );
                      //                         //           }).toList(),
                      //                         //           onChanged:
                      //                         //               (newValue) {
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
                      //                                 is GetFilterQSucState) {
                      //                               Navigator.of(context)
                      //                                   .pop();
                      //                             } else if (state
                      //                                 is GetFilterQfalidState) {
                      //                               Fluttertoast.showToast(
                      //                                   msg:
                      //                                       'CheackYourInternet');
                      //                             }
                      //                           },
                      //                           builder: (context, state) {
                      //                             if (state
                      //                                 is GetFilterQLoadingState) {
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
                      //                                       onPressed: () {
                      //                                         cubit.filterQutation(
                      //                                             type:
                      //                                                 'Date');
                      //                                       },
                      //                                       child: Text(
                      //                                           'Date')),
                      //                                   ElevatedButton(
                      //                                       onPressed: () {
                      //                                         cubit.filterQutation(
                      //                                             type:
                      //                                                 'invoice_id');
                      //                                       },
                      //                                       child:
                      //                                           Text('ID')),
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
                child: Text('No Qoutation'),
              )
            ]);
          } else {
            return Column (
              
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width/9,
                    ),
                     CustomButton(
                    onPress: () {
                      cubit.getagent();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return AddQuatirions();
                      }));
                    },
                    color:  Colors.black,
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 40,
                    title: 'Add Qoutation',
                    ),
                   
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: BlocConsumer<AccounterCubit,
                                        AccounterState>(
                                      listener: (context, state) {
                                        if (state is SearchQSucState) {
                                          Navigator.pop(context);
                                        } else if (state
                                            is SearchQFailedState) {
                                          Fluttertoast.showToast(
                                              msg: 'No Invoice');
                                        }
                                      },
                                      builder: (context, state) {
                                        if (state is SearchQLoadingState) {
                                          return Center(
                                            child:
                                                CircularProgressIndicator(),
                                          );
                                        } else {
                                          return Column(
                                            children: [
                                              TextFormField(
                                                controller:
                                                    searchcontroller,
                                                decoration: InputDecoration(
                                                  labelText: 'Search',
                                                  hintText:
                                                      'Search by company name',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black),
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  border:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                      5.0,
                                                    ),
                                                    borderSide: BorderSide(
                                                        width: 5.0,
                                                        style: BorderStyle
                                                            .solid,
                                                        color: Color(
                                                            0xff252b3b)),
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                style:ButtonStyle(
                                                                                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),

                                                ),
                                                  onPressed: () {
                                                    BlocProvider.of<
                                                                AccounterCubit>(
                                                            context).filterItems(searchcontroller.text);
                                                        // .searchqoutaion(
                                                        //     filter: gender
                                                        //         .toString(),
                                                        //     search:
                                                        //         searchcontroller
                                                        //             .text);
                                                  },
                                                  child: Text('Search')),
                                              // Row(
                                              //   children: [
                                              //     Padding(
                                              //       padding:
                                              //           const EdgeInsets
                                              //               .all(8.0),
                                              //       child: Text('Filter:'),
                                              //     ),
                                              //     Padding(
                                              //       padding:
                                              //           const EdgeInsets
                                              //               .all(8.0),
                                              //       child: Container(
                                              //         width: MediaQuery.of(
                                              //                     context)
                                              //                 .size
                                              //                 .width /
                                              //             3,
                                              //         height: 60,
                                              //         child:
                                              //             DropdownButtonFormField(
                                              //           elevation: 5,
                                              //           decoration: const InputDecoration(
                                              //               border: OutlineInputBorder(
                                              //                   borderRadius:
                                              //                       BorderRadius.all(
                                              //                           Radius.circular(0)))),
                                              //           hint: Text(
                                              //             'Filter',
                                              //             style: TextStyle(
                                              //                 color: Colors
                                              //                     .black,
                                              //                 fontSize: 12),
                                              //           ),
                                              //           items: item.map(
                                              //               (String value) {
                                              //             return DropdownMenuItem<
                                              //                 String>(
                                              //               alignment:
                                              //                   Alignment
                                              //                       .topLeft,
                                              //               value: value,
                                              //               child: Text(
                                              //                 '$value',
                                              //                 style: const TextStyle(
                                              //                     color: Colors
                                              //                         .black,
                                              //                     fontSize:
                                              //                         12),
                                              //               ),
                                              //             );
                                              //           }).toList(),
                                              //           onChanged:
                                              //               (newValue) {
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
                                                      is GetFilterQSucState) {
                                                    Navigator.of(context)
                                                        .pop();
                                                  } else if (state
                                                      is GetFilterQfalidState) {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            'CheackYourInternet');
                                                  }
                                                },
                                                builder: (context, state) {
                                                  if (state
                                                      is GetFilterQLoadingState) {
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
                                                              cubit.filterQutation(
                                                                  type:
                                                                      'Date');
                                                            },
                                                            child: Text(
                                                                'Date')),
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              cubit.filterQutation(
                                                                  type:
                                                                      'invoice_id');
                                                            },
                                                            child:
                                                                Text('date add')),
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
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.getQuationModel.length,
                    itemBuilder:(context, index) {

                      var invoiceModel = cubit.getQuationModel[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(color: Color(0xFFEBEBEB)),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               invoiceModel.agent!.company_name!.isNotEmpty?   
                                Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      
                                      children: [
                                        Text('Company Name : ',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                        
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width/1.8,
                                          child: Text(invoiceModel.agent!.company_name.toString(),maxLines: 3,))
                                      ],
                                    ):SizedBox.shrink(),
                                      invoiceModel.date!.isNotEmpty?  Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Data : ',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold)),
                                        Text(invoiceModel.date.toString()),
                                      ],
                                    ):SizedBox.shrink(),
                                    Row(
                                      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                
                                children: [
                                 invoiceModel.agent!.name!.isNotEmpty? Row(
                                    children: [
                                       Text('Name : ',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                                                  
                                      Text(invoiceModel.agent!.name.toString())
                                    ],
                                  ):SizedBox.shrink(),
                                  Row(
                                    
                                    children: [
                                 invoiceModel.agent!.name!.isNotEmpty?     Padding(
                                   padding: const EdgeInsets.only(left:20.0),
                                   child: Text('Total : ',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold)),
                                 ):Text('Total : ',style: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold)),
                                      Text('${invoiceModel.total.toString()} QAR'),
                                    ],
                                     )
                                                  
                                ],
                              ),
                             
                                 
                                                
                                      ],
                                    ),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                       children: [
                                           IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      BlocConsumer<
                                                          AccounterCubit,
                                                          AccounterState>(
                                                        listener: (context,
                                                            state) {
                                                          if (state
                                                              is DeleteInvoiceSucState) {
                                                            Fluttertoast
                                                                .showToast(
                                                                    msg:
                                                                        'Deleted Sucssyfly');
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            cubit
                                                                .getquatition();
                                                          } else if (state
                                                              is DeleteInvoiceFaliedState) {
                                                            Fluttertoast
                                                                .showToast(
                                                                    msg:
                                                                        'Errors Deleted');
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                        },
                                                        builder: (context,
                                                            state) {
                                                          return AlertDialog(
                                                            title: Column(
                                                              children: [
                                                                Text(
                                                                    'Are you shure you wont delete this Qoutation '),
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
                                                                          Navigator.of(context).pop();
                                                                        },
                                                                        child:
                                                                            Text('No')),
                                                                    ElevatedButton(
                                                                      style: ButtonStyle(
                                                                              backgroundColor:   MaterialStateProperty.all<Color>(Colors.black), // Set the background color here
                                                                              ),
                                                                        onPressed:
                                                                            () {
                                                                          cubit.deleteinvoce(id: cubit.getQuationModel[index].id!);
                                                                        },
                                                                        child: Text(state is DeleteInvoiceLoadingState
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
                                            )),
                                             IconButton(
                                        onPressed: () {
                                          cubit.getagent();
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return UpdataQuatition(
                                                getInvoiceModel:
                                                    cubit.getQuationModel[
                                                        index]);
                                          }));
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: appTheme.primaryColor,
                                        )),
                                           BlocConsumer<AccounterCubit,
                                        AccounterState>(
                                      listener: (context, state) {
                                        if (state
                                            is AddUrlLancherSucState) {
                                          Fluttertoast.showToast(
                                              msg: 'Generet Suc');
                                        } else if (state
                                            is AddUrlLancherFaieldState) {
                                          Fluttertoast.showToast(
                                              msg: 'Errors');
                                        }
                                      },
                                      builder: (context, state) {
                                        return IconButton(
                                            onPressed: () {
                                              cubit.urllancher(  id: cubit.getQuationModel[index].id.toString(), );
                                              // showDialog(
                                              //     context: context,
                                              //     builder:
                                              //         (context) =>
                                              //             AlertDialog(
                                              //               title: Column(
                                              //                 children: [
                                              //                   Text(
                                              //                     'Choose Cyrancy Type',
                                              //                   ),
                                              //                   Row(
                                              //                     mainAxisAlignment:
                                              //                         MainAxisAlignment
                                              //                             .spaceBetween,
                                              //                     children: [
                                              //                       ElevatedButton(
                                              //                           onPressed:
                                              //                               () {
                                              //                             Navigator.of(context).pop();
                                              //                             // cubit.urllancher(total: cubit.cheacks == false ? '0' : '1', id: cubit.getQuationModel[index].id.toString(), type: '0');
                                              //                           },
                                              //                           child:
                                              //                               Text('SYP')),
                                              //                       ElevatedButton(
                                              //                           onPressed:
                                              //                               () {
                                              //                             Navigator.of(context).pop();
                                              //                             // cubit.urllancher(total: cubit.cheacks == false ? '0' : '1', id: cubit.getQuationModel[index].id.toString(), type: '2');
                                              //                           },
                                              //                           child:
                                              //                               Text('USD')),
                                              //                       ElevatedButton(
                                              //                           onPressed:
                                              //                               () {
                                              //                             Navigator.pop(context);
                                              //                             // cubit.urllancher(total: cubit.cheacks == true ? '1' : '0', id: cubit.getQuationModel[index].id.toString(), type: '1');
                                              //                           },
                                              //                           child:
                                              //                               Text('AED')),
                                              //                       ElevatedButton(
                                              //                           onPressed:
                                              //                               () {
                                              //                             Navigator.pop(context);
                                              //                             // cubit.urllancher(total: cubit.cheacks == true ? '1' : '0', id: cubit.getQuationModel[index].id.toString(), type: '3');
                                              //                           },
                                              //                           child:
                                              //                               Text('QAR'))
                                              //                     ],
                                              //                   ),
                                              //                 ],
                                              //               ),
                                              //             ));
                                            },
                                            icon: Icon(
                                              Icons.picture_as_pdf_rounded,
                                              color: appTheme.primaryColor,
                                            ));
                                      },
                                                                       ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return BlocConsumer<
                                                    AccounterCubit, AccounterState>(
                                                  listener:
                                                      (context, state) {
                                                    if (state
                                                        is GenerateToInvoiceSucState) {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Convert Successfully');
                                                      Navigator.pop(
                                                          context);
                                                    } else if (state
                                                        is GenerateToInvoiceFaluerState) {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Please Check Your Internet');
                                                    }
                                                  },
                                                  builder:
                                                      (context, state) {
                                                    if (state
                                                        is GenerateToInvoiceLoadingState) {
                                                      return Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      );
                                                    } else {
                                                      return AlertDialog(
                                                        title: Text('Convert To Invoice'),
                                                        actions: [
                                                          ElevatedButton(
                                                            style: ButtonStyle(
                                                             backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                                                            ),
                                                            onPressed: (){
                                                            if(cubit.convert.isEmpty){
                                                              Fluttertoast.showToast(msg: 'Please Choose DueDate');
                                                            }
                                                            else{
                                                              cubit
                                                                .GenerateToInvoice(
                                                              dueDate:
                                                                 cubit.convert,
                                                              id: cubit
                                                                  .getQuationModel[index]
                                                                  .id
                                                                  .toString(),
                                                            );
                                                            }
                                                          }, child:Text('Convert')),
                                                          ElevatedButton(
                                                            style: ButtonStyle(
                                                             backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                                                            ),
                                                            onPressed: (){
                                                            Navigator.of(context).pop();
                                                            cubit.convert="";
                                                          }, child:Text('Cancle')),
                                                        ],
                                                        content: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          children: [
                                                            ElevatedButton(
                                                              style: ButtonStyle(
                                                             backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                                                            ),
                                                              onPressed: ()async{
                                                                                  DateTime? pickdatetime = await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate: DateTime
                                                                                .now(),
                                                                            firstDate: DateTime(
                                                                                1900),
                                                                            lastDate:
                                                                                DateTime(2050));
                                                                                if (pickdatetime !=
                                                                            null){
                                                                               String formattedDate = DateFormat('yyyy-MM-dd').format(pickdatetime);
                                                                              cubit.newDueDate(formattedDate);
                                                                            }
                                                                                                     
                                                            }, child:Text('Due Date') ),
                                                            Container(
                                                              width: MediaQuery.of(context).size.width/3,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10),
                                                                border: Border.all(
                                                                  color: Colors.black,
                                                                  width: 2
                                                                )
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                                                                child: BlocBuilder<  AccounterCubit, AccounterState>(
                                                                  builder: (context,state) {
                                                                    return Text(cubit.convert);
                                                                  }
                                                                ),
                                                              )),
                                                          ],
                                                        ),
                                                        // Column(
                                                        //   children: [
                                                        //     Container(
                                                        //       width: MediaQuery.of(
                                                        //                   context)
                                                        //               .size
                                                        //               .width /
                                                        //           3,
                                                        //       child:
                                                        //           Row(
                                                        //             mainAxisAlignment: MainAxisAlignment.start,
                                                        //             crossAxisAlignment: CrossAxisAlignment.start,
                                                        //             children: [
                                                        //               ElevatedButton(onPressed: (){}, child: Text('Choose')),
                                                        //               Expanded(
                                                        //                 child: TextFormField(
                                                        //                  decoration: const InputDecoration(
                                                        //                   focusedBorder: OutlineInputBorder(
                                                        //                       borderRadius: BorderRadius.all(Radius.circular(
                                                        //                           30)),
                                                        //                       borderSide: BorderSide(
                                                        //                           style: BorderStyle
                                                        //                               .none)),
                                                        //                   border: OutlineInputBorder(
                                                        //                       borderSide: BorderSide
                                                        //                           .none,
                                                        //                       borderRadius: BorderRadius.all(Radius.circular(
                                                        //                           30))),
                                                        //                   hintText:
                                                        //                       'Due Date'),
                                                        //                     controller:
                                                        //                   datecontroller,
                                                        //                  onTap:
                                                        //                   () async {
                                                        //                 DateTime? pickdatetime = await showDatePicker(
                                                        //                     context:
                                                        //                         context,
                                                        //                     initialDate: DateTime
                                                        //                         .now(),
                                                        //                     firstDate: DateTime(
                                                        //                         1900),
                                                        //                     lastDate:
                                                        //                         DateTime(2050));
                                                                                                                               
                                                        //                 if (pickdatetime !=
                                                        //                     null) {
                                                        //                   datecontroller
                                                        //                       .text = DateFormat(
                                                        //                           'y-MM-d')
                                                        //                       .format(pickdatetime);
                                                        //                 }
                                                        //                                                                               },
                                                        //                                                                             ),
                                                        //               ),
                                                        //             ],
                                                        //           ),
                                                        //     ),
                                                        //     ElevatedButton(
                                                        //         onPressed:
                                                        //             () {
                                                        //           if (datecontroller
                                                        //               .text
                                                        //               .isEmpty) {
                                                        //             Fluttertoast.showToast(
                                                        //                 msg:
                                                        //                     'Due Date Must Be Requaierd');
                                                        //             return;
                                                        //           }
                                                        //           cubit
                                                        //               .GenerateToInvoice(
                                                        //             dueDate:
                                                        //                 datecontroller.text,
                                                        //             id: cubit
                                                        //                 .getQuationModel[index]
                                                        //                 .id
                                                        //                 .toString(),
                                                        //           );
                                                        //         },
                                                        //         child: Text(
                                                        //             'Save')),
                                                        //   ],
                                                        // ),
                                                      );
                                                    }
                                                  },
                                                );
                                              });
                                        },
                                        icon: Icon(
                                          Icons.cloud_upload_outlined,
                                          color: appTheme.primaryColor,
                                        ))
                                     
                                                                   ],
                                                                 ),
                                    
                            ],
                          ),
                        ),
                      );
                    
                  },),
                  // ListView.builder(
                  //   itemCount: cubit.getQuationModel.length,
                  //   itemBuilder: (context, index) {
                  //     var invoiceModel = cubit.getQuationModel[index];
                  //     return Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 20),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Row(
                  //             children: [
                  //               Text(
                  //                 'Qoutation Id:  '.toUpperCase(), 
                  //                 style: TextStyle(
                  //                     color: appTheme.primaryColor,
                  //                     fontSize: 13,
                  //                     fontWeight: FontWeight.bold
                  //                     ),
                  //               ),
                  //               Text(invoiceModel.id.toString())
                  //             ],
                  //           ),
                  //           Row(
                  //             mainAxisAlignment:
                  //                 MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Text(
                  //                     'ID  ',
                  //                     style: TextStyle(
                  //                         color: appTheme.primaryColor,
                  //                         fontSize: 15,
                  //                         fontWeight: FontWeight.bold),
                  //                   ),
                  //                   Text(invoiceModel.agent_id.toString()),
                  //                 ],
                  //               ),
                  //               Row(
                  //                 children: [
                  //                   Text(
                  //                     'Type  ',
                  //                     style: TextStyle(
                  //                         color: appTheme.primaryColor,
                  //                         fontSize: 15,
                  //                         fontWeight: FontWeight.bold),
                  //                   ),
                  //                   Text(invoiceModel.agent!.type
                  //                       .toString()),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //           Row(
                  //             children: [
                  //               Text(
                  //                 'Website  ',
                  //                 style: TextStyle(
                  //                     color: appTheme.primaryColor,
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //               Container(
                  //                 width:
                  //                     MediaQuery.of(context).size.width / 2,
                  //                 child: Text(invoiceModel.agent!.website
                  //                     .toString()),
                  //               ),
                  //             ],
                  //           ),
                  //           Row(
                  //             children: [
                  //               Text(
                  //                 'Name  ',
                  //                 style: TextStyle(
                  //                     color: appTheme.primaryColor,
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //               Container(
                  //                 width:
                  //                     MediaQuery.of(context).size.width / 2,
                  //                 child: Text(
                  //                     '  ${invoiceModel.agent!.name.toString()}'),
                  //               ),
                  //             ],
                  //           ),
                  //           Row(
                  //             children: [
                  //               Text(
                  //                 'Company  ',
                  //                 style: TextStyle(
                  //                     color: appTheme.primaryColor,
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //               Container(
                  //                 width:
                  //                     MediaQuery.of(context).size.width / 2,
                  //                 child: Text(
                  //                     '${invoiceModel.agent!.company_name.toString()}'),
                  //               ),
                  //             ],
                  //           ),
                  //           Row(
                  //             mainAxisAlignment:
                  //                 MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Text(
                  //                     'Phone  ',
                  //                     style: TextStyle(
                  //                         color: appTheme.primaryColor,
                  //                         fontSize: 15,
                  //                         fontWeight: FontWeight.bold),
                  //                   ),
                  //                   Container(
                  //                     child: Text(
                  //                         '${invoiceModel.agent!.phone_number.toString()}'),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Row(
                  //                 children: [
                  //                   Text(
                  //                     'LandLine  ',
                  //                     style: TextStyle(
                  //                         color: appTheme.primaryColor,
                  //                         fontSize: 15,
                  //                         fontWeight: FontWeight.bold),
                  //                   ),
                  //                   Container(
                  //                     child: Text(
                  //                         '${invoiceModel.agent!.land_line.toString()}'),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //           Row(
                  //             children: [
                  //               Text(
                  //                 'Country  ',
                  //                 style: TextStyle(
                  //                     color: appTheme.primaryColor,
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //               Container(
                  //                 width:
                  //                     MediaQuery.of(context).size.width / 2,
                  //                 child: Text(
                  //                     '${invoiceModel.agent!.country.toString()}'),
                  //               ),
                  //             ],
                  //           ),
                  //           Row(
                  //             children: [
                  //               Text(
                  //                 'Date  ',
                  //                 style: TextStyle(
                  //                     color: appTheme.primaryColor,
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //               Container(
                  //                 child: Text(
                  //                     '${invoiceModel.date.toString()}'),
                  //               ),
                  //             ],
                  //           ),
                  //           Container(
                  //             decoration: BoxDecoration(
                  //                borderRadius: BorderRadius.circular(10),
                  //                color: Colors.grey.shade300,

                  //             ),
                  //             child: Column(
                  //               children: [
                  //                 Row(
                  //             mainAxisAlignment:
                  //                 MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Text(''),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.end,
                  //                 children: [
                  //                   Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.end,
                  //                     children: [
                  //                       IconButton(
                  //                           onPressed: () {
                  //                             showDialog(
                  //                                 context: context,
                  //                                 builder: (context) =>
                  //                                     BlocConsumer<
                  //                                         AccounterCubit,
                  //                                         AccounterState>(
                  //                                       listener: (context,
                  //                                           state) {
                  //                                         if (state
                  //                                             is DeleteInvoiceSucState) {
                  //                                           Fluttertoast
                  //                                               .showToast(
                  //                                                   msg:
                  //                                                       'Deleted Sucssyfly');
                  //                                           Navigator.of(
                  //                                                   context)
                  //                                               .pop();
                  //                                           cubit
                  //                                               .getquatition();
                  //                                         } else if (state
                  //                                             is DeleteInvoiceFaliedState) {
                  //                                           Fluttertoast
                  //                                               .showToast(
                  //                                                   msg:
                  //                                                       'Errors Deleted');
                  //                                           Navigator.pop(
                  //                                               context);
                  //                                         }
                  //                                       },
                  //                                       builder: (context,
                  //                                           state) {
                  //                                         return AlertDialog(
                  //                                           title: Column(
                  //                                             children: [
                  //                                               Text(
                  //                                                   'Are you shure you wont delete this Qoutation '),
                  //                                               Row(
                  //                                                 mainAxisAlignment:
                  //                                                     MainAxisAlignment
                  //                                                         .spaceBetween,
                  //                                                 children: [
                  //                                                   ElevatedButton(
                  //                                                       onPressed:
                  //                                                           () {
                  //                                                         Navigator.of(context).pop();
                  //                                                       },
                  //                                                       child:
                  //                                                           Text('No')),
                  //                                                   ElevatedButton(
                  //                                                       onPressed:
                  //                                                           () {
                  //                                                         cubit.deleteinvoce(id: cubit.getQuationModel[index].id!);
                  //                                                       },
                  //                                                       child: Text(state is DeleteInvoiceLoadingState
                  //                                                           ? 'Loading...'
                  //                                                           : 'Yes'))
                  //                                                 ],
                  //                                               ),
                  //                                             ],
                  //                                           ),
                  //                                         );
                  //                                       },
                  //                                     ));
                  //                           },
                  //                           icon: Icon(
                  //                             Icons.delete,
                  //                             color: appTheme.primaryColor,
                  //                           )),
                  //                     ],
                  //                   ),
                  //                   IconButton(
                  //                       onPressed: () {
                  //                         cubit.getagent();
                  //                         Navigator.of(context).push(
                  //                             MaterialPageRoute(
                  //                                 builder: (context) {
                  //                           return UpdataQuatition(
                  //                               getInvoiceModel:
                  //                                   cubit.getQuationModel[
                  //                                       index]);
                  //                         }));
                  //                       },
                  //                       icon: Icon(
                  //                         Icons.edit,
                  //                         color: appTheme.primaryColor,
                  //                       )),
                  //                   BlocConsumer<AccounterCubit,
                  //                       AccounterState>(
                  //                     listener: (context, state) {
                  //                       if (state
                  //                           is AddUrlLancherSucState) {
                  //                         Fluttertoast.showToast(
                  //                             msg: 'Generet Suc');
                  //                       } else if (state
                  //                           is AddUrlLancherFaieldState) {
                  //                         Fluttertoast.showToast(
                  //                             msg: 'Errors');
                  //                       }
                  //                     },
                  //                     builder: (context, state) {
                  //                       return IconButton(
                  //                           onPressed: () {
                  //                             showDialog(
                  //                                 context: context,
                  //                                 builder:
                  //                                     (context) =>
                  //                                         AlertDialog(
                  //                                           title: Column(
                  //                                             children: [
                  //                                               Text(
                  //                                                 'Choose Cyrancy Type',
                  //                                               ),
                  //                                               Row(
                  //                                                 mainAxisAlignment:
                  //                                                     MainAxisAlignment
                  //                                                         .spaceBetween,
                  //                                                 children: [
                  //                                                   ElevatedButton(
                  //                                                       onPressed:
                  //                                                           () {
                  //                                                         Navigator.of(context).pop();
                  //                                                         // cubit.urllancher(total: cubit.cheacks == false ? '0' : '1', id: cubit.getQuationModel[index].id.toString(), type: '0');
                  //                                                       },
                  //                                                       child:
                  //                                                           Text('SYP')),
                  //                                                   ElevatedButton(
                  //                                                       onPressed:
                  //                                                           () {
                  //                                                         Navigator.of(context).pop();
                  //                                                         // cubit.urllancher(total: cubit.cheacks == false ? '0' : '1', id: cubit.getQuationModel[index].id.toString(), type: '2');
                  //                                                       },
                  //                                                       child:
                  //                                                           Text('USD')),
                  //                                                   ElevatedButton(
                  //                                                       onPressed:
                  //                                                           () {
                  //                                                         Navigator.pop(context);
                  //                                                         // cubit.urllancher(total: cubit.cheacks == true ? '1' : '0', id: cubit.getQuationModel[index].id.toString(), type: '1');
                  //                                                       },
                  //                                                       child:
                  //                                                           Text('AED')),
                  //                                                   ElevatedButton(
                  //                                                       onPressed:
                  //                                                           () {
                  //                                                         Navigator.pop(context);
                  //                                                         // cubit.urllancher(total: cubit.cheacks == true ? '1' : '0', id: cubit.getQuationModel[index].id.toString(), type: '3');
                  //                                                       },
                  //                                                       child:
                  //                                                           Text('QAR'))
                  //                                                 ],
                  //                                               ),
                  //                                             ],
                  //                                           ),
                  //                                         ));
                  //                           },
                  //                           icon: Icon(
                  //                             Icons.picture_as_pdf_rounded,
                  //                             color: appTheme.primaryColor,
                  //                           ));
                  //                     },
                  //                   ),
                  //                   IconButton(
                  //                       onPressed: () {
                  //                         showDialog(
                  //                             context: context,
                  //                             builder: (context) {
                  //                               return BlocConsumer<
                  //                                   AccounterCubit,
                  //                                   AccounterState>(
                  //                                 listener:
                  //                                     (context, state) {
                  //                                   if (state
                  //                                       is GenerateToInvoiceSucState) {
                  //                                     Fluttertoast.showToast(
                  //                                         msg:
                  //                                             'Convert Successfully');
                  //                                     Navigator.pop(
                  //                                         context);
                  //                                   } else if (state
                  //                                       is GenerateToInvoiceFaluerState) {
                  //                                     Fluttertoast.showToast(
                  //                                         msg:
                  //                                             'Please Check Your Internet');
                  //                                   }
                  //                                 },
                  //                                 builder:
                  //                                     (context, state) {
                  //                                   if (state
                  //                                       is GenerateToInvoiceLoadingState) {
                  //                                     return Center(
                  //                                       child:
                  //                                           CircularProgressIndicator(),
                  //                                     );
                  //                                   } else {
                  //                                     return AlertDialog(
                  //                                       title: Column(
                  //                                         children: [
                  //                                           Container(
                  //                                             width: MediaQuery.of(
                  //                                                         context)
                  //                                                     .size
                  //                                                     .width /
                  //                                                 3,
                  //                                             child:
                  //                                                 TextFormField(
                  //                                               decoration: const InputDecoration(
                  //                                                   focusedBorder: OutlineInputBorder(
                  //                                                       borderRadius: BorderRadius.all(Radius.circular(
                  //                                                           30)),
                  //                                                       borderSide: BorderSide(
                  //                                                           style: BorderStyle
                  //                                                               .none)),
                  //                                                   border: OutlineInputBorder(
                  //                                                       borderSide: BorderSide
                  //                                                           .none,
                  //                                                       borderRadius: BorderRadius.all(Radius.circular(
                  //                                                           30))),
                  //                                                   hintText:
                  //                                                       'Due Date'),
                  //                                               controller:
                  //                                                   datecontroller,
                  //                                               onTap:
                  //                                                   () async {
                  //                                                 DateTime? pickdatetime = await showDatePicker(
                  //                                                     context:
                  //                                                         context,
                  //                                                     initialDate: DateTime
                  //                                                         .now(),
                  //                                                     firstDate: DateTime(
                  //                                                         1900),
                  //                                                     lastDate:
                  //                                                         DateTime(2050));
                      
                  //                                                 if (pickdatetime !=
                  //                                                     null) {
                  //                                                   datecontroller
                  //                                                       .text = DateFormat(
                  //                                                           'y-MM-d')
                  //                                                       .format(pickdatetime);
                  //                                                 }
                  //                                               },
                  //                                             ),
                  //                                           ),
                  //                                           ElevatedButton(
                  //                                               onPressed:
                  //                                                   () {
                  //                                                 if (datecontroller
                  //                                                     .text
                  //                                                     .isEmpty) {
                  //                                                   Fluttertoast.showToast(
                  //                                                       msg:
                  //                                                           'Due Date Must Be Requaierd');
                  //                                                   return;
                  //                                                 }
                  //                                                 cubit
                  //                                                     .GenerateToInvoice(
                  //                                                   dueDate:
                  //                                                       datecontroller.text,
                  //                                                   id: cubit
                  //                                                       .getQuationModel[index]
                  //                                                       .id
                  //                                                       .toString(),
                  //                                                 );
                  //                                               },
                  //                                               child: Text(
                  //                                                   'Save')),
                  //                                         ],
                  //                                       ),
                  //                                     );
                  //                                   }
                  //                                 },
                  //                               );
                  //                             });
                  //                       },
                  //                       icon: Icon(
                  //                         Icons.cloud_upload_outlined,
                  //                         color: appTheme.primaryColor,
                  //                       ))
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                             
                  //           ExpansionTile(
                  //               backgroundColor: Colors.grey.shade300,
                  //               // collapsedIconColor: Colors.white,
                  //               // collapsedBackgroundColor:
                  //               //     appTheme.primaryColor,
                  //               // iconColor: appTheme.primaryColor,
                  //               // textColor: appTheme.primaryColor,
                  //               // collapsedTextColor: Colors.white,
                  //               title: Center(child: Text('Order Detials',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                  //               children: [
                  //                 ListView.builder(
                  //                   shrinkWrap: true,
                  //                   physics: NeverScrollableScrollPhysics(),
                  //                   itemCount: invoiceModel.orders!.length,
                  //                   itemBuilder: (context, orderIndex) {
                  //                     var order =
                  //                         invoiceModel.orders![orderIndex];
                      
                  //                     return Column(
                  //                       children: [
                  //                         Row(
                                            
                  //                           children: [
                  //                             Expanded(
                  //                               child: Container(
                  //                                 width:
                  //                                     MediaQuery.of(context)
                  //                                             .size
                  //                                             .width /
                  //                                         2,
                  //                                 child: Row(
                  //                                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                                   children: [
                  //                                     Expanded(
                  //                                       child: Text(
                  //                                           'Description :  ',style: TextStyle(fontWeight: FontWeight.bold),),
                  //                                     ),
                  //                                         Expanded(child: Text(order.description.toString()))
                  //                                   ],
                  //                                 ),
                  //                               ),
                  //                             )
                  //                           ],
                  //                         ),
                  //                         Row(
                  //                           children: [
                  //                             Text(
                  //                                 'Price :  ',style: TextStyle(fontWeight: FontWeight.bold)),
                  //                                 Text(' ${order.price.toString()} ${cubit.getQuationModel[index].currency_type}')
                  //                           ],
                  //                         ),
                  //                         Row(
                  //                           children: [
                  //                             Text(
                  //                                 'QYT : ',style: TextStyle(fontWeight: FontWeight.bold)),
                  //                                 Text(order.quantity.toString())
                  //                           ],
                  //                         ),
                  //                         SizedBox(
                  //                           height: 15,
                  //                         ),
                  //                       ],
                  //                     );
                  //                   },
                  //                 ),
                  //               ]),
                  //           Row(
                  //             children: [
                  //               Text('Tax Due:      ',style: TextStyle(fontWeight:FontWeight.bold ),),
                  //               Text(
                  //                 '${cubit.getQuationModel[index].tax}    ${cubit.getQuationModel[index].currency_type}',
                                  
                  //               ),
                  //             ],
                  //           ),
                  //           Row(
                  //             children: [
                  //               Text('Discount Due:     ',style: TextStyle(fontWeight:FontWeight.bold )),
                  //               Text(
                  //                 '${cubit.getQuationModel[index].discount}    ${cubit.getQuationModel[index].currency_type}',
                                   
                  //               ),
                  //             ],
                  //           ),
                  //           Row(
                  //             children: [
                  //               Text('Tax  Rate:   ',style: TextStyle(fontWeight:FontWeight.bold )),
                  //               Text(
                  //                 '${cubit.getQuationModel[index].tax_rate}   %',
                                   
                  //               ),
                  //             ],
                  //           ),
                  //           Row(
                  //             children: [
                  //               Text('Discount Rate:    ',style: TextStyle(fontWeight:FontWeight.bold )),
                  //               Text(
                  //                 '${cubit.getQuationModel[index].discount_rate}  %',
                                  
                  //               ),
                  //             ],
                  //           ),
                  //           Row(
                  //             children: [
                  //               Text('Show ',style: TextStyle(fontWeight:FontWeight.bold )),
                  //               BlocConsumer<AccounterCubit,
                  //                   AccounterState>(
                  //                 listener: (context, state) {},
                  //                 builder: (context, state) {
                  //                   return Checkbox(
                  //                     activeColor: appTheme.primaryColor,
                  //                     value: cubit.cheacks,
                  //                     onChanged: (value) {
                  //                       cubit.cheacks = value ?? false;
                  //                       cubit.boolvalue();
                  //                       print(cubit.cheacks);
                  //                     },
                  //                   );
                  //                 },
                  //               ),
                  //             ],
                  //           ),
                  //           if (cubit.cheacks == true)
                  //             Row(
                  //               children: [
                  //                 Text('Total :',style: TextStyle(fontWeight:FontWeight.bold )),
                  //                 Text(
                  //                   '${cubit.getQuationModel[index].total}${cubit.getQuationModel[index].currency_type}',
                                    
                  //                 ),
                  //               ],
                  //             ),
                  //           if (cubit.cheacks == true)
                  //             Row(
                  //               children: [
                  //                 Text('SubTotal :',style: TextStyle(fontWeight:FontWeight.bold )),
                  //                 Container(
                  //                   width:
                  //                       MediaQuery.of(context).size.width /
                  //                           2,
                  //                   child: Text(
                  //                     '${cubit.getQuationModel[index].subtotal}',
                                      
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           Row(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text('note :',style: TextStyle(fontWeight:FontWeight.bold )),
                  //               Container(
                  //                 width: MediaQuery.of(context).size.width /
                  //                     1.5,
                  //                 child: Text(
                  //                   '${cubit.getQuationModel[index].note}',
                                    
                  //                 ),
                  //               ),
                  //             ],
                  //           ),

                  //               ],
                  //             ),
                  //           ),
                           
                  //           //////////////////////////////////////////////////////////////
                  //           Divider(
                  //             thickness: 3,
                            
                  //             color: Colors.grey,
                  //           ),
                          
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
