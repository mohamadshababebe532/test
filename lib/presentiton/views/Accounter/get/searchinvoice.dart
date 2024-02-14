// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:holool_app/core/theme/app_theme.dart';
// import 'package:holool_app/core/widgets/waiting_dialog_widget.dart';
// import 'package:holool_app/presentiton/views/Accounter/add/addinvoice.dart';
// import 'package:holool_app/presentiton/views/Accounter/cubit/accounter_cubit.dart';
// import 'package:holool_app/presentiton/views/Accounter/get/searchinvoice.dart';
// import 'package:holool_app/presentiton/views/Accounter/model/addinvoice.dart';
// import 'package:holool_app/presentiton/views/Accounter/model/getinvoice_model.dart';
// import 'package:holool_app/presentiton/views/Accounter/update/UpdateInvoice.dart';

// class SearchInvoiceScreen extends StatelessWidget {
//   TextEditingController paiedcontroller = TextEditingController();
//   TextEditingController searchcontroller = TextEditingController();
//   var item = ['agent', 'total', 'company', 'date', 'invoice_id'];
//   String? gender;
//   SearchInvoiceScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     var cubit = BlocProvider.of<AccounterCubit>(context);
//     searchcontroller.clear();
//     return SafeArea(
//       child: Scaffold(
//         body: BlocConsumer<AccounterCubit, AccounterState>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             if (state is SearchInvoiceLoadingState) {
//               return Center(child: CircularProgressIndicator());
//             } else if (cubit.getinvoiceModel.isEmpty) {
//               return ListView(children: [
//                 Row(
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: Icon(Icons.arrow_back)),
//                     Text(
//                       'My Invoice',
//                       style:
//                           TextStyle(color: appTheme.primaryColor, fontSize: 20),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 CustomButton(
//                     onPress: () {
//                       cubit.getagent();
//                       Navigator.of(context)
//                           .push(MaterialPageRoute(builder: (context) {
//                         return AddInvoice();
//                       }));
//                     },
//                     color: appTheme.primaryColor,
//                     width: MediaQuery.of(context).size.width,
//                     height: 40,
//                     title: 'Add Invoice'),
//                 Center(
//                   child: Text('No Invoice'),
//                 ),
//               ]);
//             } else {
//               return ListView(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 children: [
//                   Row(
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: Icon(Icons.arrow_back)),
//                       Spacer(),
//                       Text(
//                         'My Invoice',
//                         style: TextStyle(
//                             color: appTheme.primaryColor, fontSize: 20),
//                       ),
//                       Spacer(),
//                       IconButton(
//                           onPressed: () {
//                             showDialog(
//                                 context: context,
//                                 builder: (context) => AlertDialog(
//                                       title: BlocConsumer<AccounterCubit,
//                                           AccounterState>(
//                                         listener: (context, state) {
//                                           if (state is SearchSucState) {
//                                             Navigator.pop(context);
//                                           } else if (state
//                                               is SearchFailedState) {
//                                             Fluttertoast.showToast(
//                                                 msg: 'No Invoice');
//                                           }
//                                         },
//                                         builder: (context, state) {
//                                           if (state is SearchLoadingState) {
//                                             return Center(
//                                               child:
//                                                   CircularProgressIndicator(),
//                                             );
//                                           } else {
//                                             return Column(
//                                               children: [
//                                                 TextFormField(
//                                                   controller: searchcontroller,
//                                                   decoration: InputDecoration(
//                                                     hintText:
//                                                         'Search by company name OR Invoice No',
//                                                     hintStyle: TextStyle(
//                                                         color: Colors.black),
//                                                     labelStyle: TextStyle(
//                                                         color: Colors.black),
//                                                     border: OutlineInputBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                         5.0,
//                                                       ),
//                                                       borderSide: BorderSide(
//                                                           width: 5.0,
//                                                           style:
//                                                               BorderStyle.solid,
//                                                           color: Color(
//                                                               0xff252b3b)),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 ElevatedButton(
//                                                     onPressed: () {
//                                                       if (searchcontroller
//                                                           .text.isEmpty) {
//                                                         return;
//                                                       }
//                                                       BlocProvider.of<
//                                                                   AccounterCubit>(
//                                                               context)
//                                                           .searchinvoice(
//                                                               filter: gender
//                                                                   .toString(),
//                                                               search:
//                                                                   searchcontroller
//                                                                       .text);
//                                                     },
//                                                     child: Text('Search')),
//                                                 Row(
//                                                   children: [
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               8.0),
//                                                       child: Text('Filter:'),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               8.0),
//                                                       child: Container(
//                                                         width: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .width /
//                                                             3,
//                                                         height: 60,
//                                                         child:
//                                                             DropdownButtonFormField(
//                                                           elevation: 5,
//                                                           decoration: const InputDecoration(
//                                                               border: OutlineInputBorder(
//                                                                   borderRadius:
//                                                                       BorderRadius.all(
//                                                                           Radius.circular(
//                                                                               0)))),
//                                                           hint: Text(
//                                                             'Filter',
//                                                             style: TextStyle(
//                                                                 color: Colors
//                                                                     .black,
//                                                                 fontSize: 12),
//                                                           ),
//                                                           items: item.map(
//                                                               (String value) {
//                                                             return DropdownMenuItem<
//                                                                 String>(
//                                                               alignment:
//                                                                   Alignment
//                                                                       .topLeft,
//                                                               value: value,
//                                                               child: Text(
//                                                                 '$value',
//                                                                 style: const TextStyle(
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         12),
//                                                               ),
//                                                             );
//                                                           }).toList(),
//                                                           onChanged:
//                                                               (newValue) {
//                                                             gender = newValue
//                                                                 .toString();
//                                                             print(gender);
//                                                           },
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             );
//                                           }
//                                         },
//                                       ),
//                                     ));
//                           },
//                           icon: Icon(
//                             Icons.search,
//                             size: 30,
//                           )),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   CustomButton(
//                       onPress: () {
//                         cubit.getagent();
//                         Navigator.of(context)
//                             .push(MaterialPageRoute(builder: (context) {
//                           return AddInvoice();
//                         }));
//                       },
//                       color: appTheme.primaryColor,
//                       width: MediaQuery.of(context).size.width / 1.2,
//                       height: 40,
//                       title: 'Add Invoice'),
//                   Container(
//                     width: double.infinity,
//                     height: MediaQuery.of(context).size.height / 1.2,
//                     child: ListView.builder(
//                       itemCount: cubit.searchinvoices.length,
//                       itemBuilder: (context, index) {
                        
//                         var sear = cubit.searchinvoices[index];
//                         return Container(
//                           padding: EdgeInsets.symmetric(horizontal: 20),
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     'Invoice Id: ${sear.invoice![index].id.toString()}',
//                                     style: TextStyle(
//                                         color: appTheme.primaryColor,
//                                         fontSize: 13),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text(
//                                         'ID  ',
//                                         style: TextStyle(
//                                             color: appTheme.primaryColor,
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       Text(sear.invoice![index].agent_id
//                                           .toString()),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         'Type  ',
//                                         style: TextStyle(
//                                             color: appTheme.primaryColor,
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       Text(sear.type.toString()),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     'Website  ',
//                                     style: TextStyle(
//                                         color: appTheme.primaryColor,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Container(
//                                     width: 30,
//                                     child: Text(sear.website.toString()),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     'Name  ',
//                                     style: TextStyle(
//                                         color: appTheme.primaryColor,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Container(
//                                     width:
//                                         MediaQuery.of(context).size.width / 2,
//                                     child: Text('  ${sear.name.toString()}'),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     'Company  ',
//                                     style: TextStyle(
//                                         color: appTheme.primaryColor,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Container(
//                                     width:
//                                         MediaQuery.of(context).size.width / 2,
//                                     child:
//                                         Text('${sear.company_name.toString()}'),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text(
//                                         'Phone  ',
//                                         style: TextStyle(
//                                             color: appTheme.primaryColor,
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       Container(
//                                         child: Text(
//                                             '${sear.phone_number.toString()}'),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         'LandLine  ',
//                                         style: TextStyle(
//                                             color: appTheme.primaryColor,
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       Container(
//                                         child: Text(
//                                             '${sear.land_line.toString()}'),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     'Country  ',
//                                     style: TextStyle(
//                                         color: appTheme.primaryColor,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Container(
//                                     width:
//                                         MediaQuery.of(context).size.width / 2,
//                                     child: Text('${sear.country.toString()}'),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text(
//                                         'Date  ',
//                                         style: TextStyle(
//                                             color: appTheme.primaryColor,
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       Container(
//                                         child: Text(
//                                             '${sear.invoice![index].date.toString()}'),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Text(
//                                         'Due Date ',
//                                         style: TextStyle(
//                                             color: appTheme.primaryColor,
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       Container(
//                                         child: Text(
//                                             '${sear.invoice![index].duedate.toString()}'),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   IconButton(
//                                     onPressed: () {
//                                       showDialog(
//                                           context: context,
//                                           builder: (context) => BlocConsumer<
//                                                   AccounterCubit,
//                                                   AccounterState>(
//                                                 listener: (context, state) {
//                                                   if (state
//                                                       is DeleteInvoiceSucState) {
//                                                     Fluttertoast.showToast(
//                                                         msg:
//                                                             'Deleted Sucssyfly');
//                                                     Navigator.of(context).pop();
//                                                   } else if (state
//                                                       is DeleteInvoiceFaliedState) {
//                                                     Fluttertoast.showToast(
//                                                         msg: 'Errors Deleted');
//                                                     Navigator.pop(context);
//                                                   }
//                                                 },
//                                                 builder: (context, state) {
//                                                   return AlertDialog(
//                                                     title: Column(
//                                                       children: [
//                                                         Text(
//                                                             'Are you shure you wont delete this invoice '),
//                                                         Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceBetween,
//                                                           children: [
//                                                             ElevatedButton(
//                                                                 onPressed: () {
//                                                                   Navigator.of(
//                                                                           context)
//                                                                       .pop();
//                                                                 },
//                                                                 child:
//                                                                     Text('No')),
//                                                             ElevatedButton(
//                                                                 onPressed: () {
//                                                                   cubit.deleteinvoce(
//                                                                       id: cubit
//                                                                           .searchinvoices[
//                                                                               index]
//                                                                           .invoice![
//                                                                               index]
//                                                                           .id!);
//                                                                 },
//                                                                 child: Text(state
//                                                                         is DeleteInvoiceLoadingState
//                                                                     ? 'Loading...'
//                                                                     : 'Yes'))
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   );
//                                                 },
//                                               ));
//                                     },
//                                     icon: Icon(
//                                       Icons.delete,
//                                       color: appTheme.primaryColor,
//                                     ),
//                                   ),
//                                   IconButton(
//                                       onPressed: () async {
//                                         cubit.getagent();
//                                         Navigator.of(context).push(
//                                             MaterialPageRoute(
//                                                 builder: (context) {
//                                           return UpdateInvoice(
//                                               getInvoiceModel:
//                                                   cubit.getinvoiceModel[index]);
//                                         }));
//                                       },
//                                       icon: Icon(
//                                         Icons.edit,
//                                         color: appTheme.primaryColor,
//                                       )),
//                                   BlocConsumer<AccounterCubit, AccounterState>(
//                                     listener: (context, state) {
//                                       if (state is AddUrlLancherSucState) {
//                                         Fluttertoast.showToast(
//                                             msg: 'Generet Suc');
//                                       } else if (state
//                                           is AddUrlLancherFaieldState) {
//                                         Fluttertoast.showToast(msg: 'Errors');
//                                       }
//                                     },
//                                     builder: (context, state) {
//                                       return IconButton(
//                                           onPressed: () {
//                                             showDialog(
//                                                 context: context,
//                                                 builder:
//                                                     (context) => AlertDialog(
//                                                           title: Column(
//                                                             children: [
//                                                               Text(
//                                                                 'Print It With Stamp OR Without',
//                                                               ),
//                                                               Row(
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .spaceBetween,
//                                                                 children: [
//                                                                   ElevatedButton(
//                                                                       onPressed:
//                                                                           () {
//                                                                         Navigator.pop(
//                                                                             context);
//                                                                         cubit.urllancher(
//                                                                             point:
//                                                                                 '0',
//                                                                             id: cubit.getinvoiceModel[index].id.toString());
//                                                                       },
//                                                                       child: Text(
//                                                                           'No')),
//                                                                   ElevatedButton(
//                                                                       onPressed:
//                                                                           () {
//                                                                         Navigator.pop(
//                                                                             context);
//                                                                         cubit.urllancher(
//                                                                             point:
//                                                                                 '1',
//                                                                             id: cubit.getinvoiceModel[index].id.toString());
//                                                                       },
//                                                                       child: Text(
//                                                                           'Yes'))
//                                                                 ],
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ));
//                                           },
//                                           icon: Icon(
//                                             Icons.picture_as_pdf_rounded,
//                                             color: appTheme.primaryColor,
//                                           ));
//                                     },
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20)),
//                                 child: ExpansionTile(
//                                   backgroundColor: Colors.white,
//                                   children: [
//                                     ListView.builder(
//                                       shrinkWrap: true,
//                                       physics: NeverScrollableScrollPhysics(),
//                                       itemCount:
//                                           sear.invoice![index].orders!.length,
//                                       itemBuilder: (context, orderIndex) {
//                                         var i = orderIndex;
//                                         var order = sear.invoice![index]
//                                             .orders![orderIndex];

//                                         return Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Text('#${i}'),
//                                               ],
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 10.0),
//                                               child: Row(
//                                                 children: [
//                                                   Text(
//                                                     'Description : ',
//                                                     style: TextStyle(
//                                                         color: appTheme
//                                                             .primaryColor),
//                                                   ),
//                                                   Container(
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .width /
//                                                             2,
//                                                     child: Text(
//                                                         '${order.description.toString()}'),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 10.0),
//                                               child: Row(
//                                                 children: [
//                                                   Text(
//                                                     'Price : ',
//                                                     style: TextStyle(
//                                                         color: appTheme
//                                                             .primaryColor),
//                                                   ),
//                                                   Text(
//                                                       '${order.price.toString()}  ${cubit.getinvoiceModel[index].currency_type}'),
//                                                 ],
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 10.0),
//                                               child: Row(
//                                                 children: [
//                                                   Text(
//                                                     'QYT : ',
//                                                     style: TextStyle(
//                                                         color: appTheme
//                                                             .primaryColor),
//                                                   ),
//                                                   Text(
//                                                       '${order.quantity.toString()}')
//                                                 ],
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 15,
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     ),
//                                   ],
//                                   title: Center(
//                                     child: Text(
//                                       'Order Details',
//                                     ),
//                                   ),
//                                   collapsedIconColor: Colors.white,
//                                   collapsedBackgroundColor:
//                                       appTheme.primaryColor,
//                                   iconColor: appTheme.primaryColor,
//                                   textColor: appTheme.primaryColor,
//                                   collapsedTextColor: Colors.white,
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Text('SubTotal : '),
//                                   Text(
//                                     '${cubit.getinvoiceModel[index].subtotal}  ${cubit.getinvoiceModel[index].currency_type}',
//                                     style:
//                                         TextStyle(color: appTheme.primaryColor),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text('Tax : '),
//                                   Text(
//                                     '${cubit.getinvoiceModel[index].tax}  ${cubit.getinvoiceModel[index].currency_type}',
//                                     style:
//                                         TextStyle(color: appTheme.primaryColor),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Text('Discount : '),
//                                   Text(
//                                     '${cubit.getinvoiceModel[index].discount}  ${cubit.getinvoiceModel[index].currency_type}',
//                                     style:
//                                         TextStyle(color: appTheme.primaryColor),
//                                   ),
//                                 ],
//                               ),

//                               // ListView.builder(
//                               //     shrinkWrap: true,
//                               //     physics: NeverScrollableScrollPhysics(),
//                               //     itemCount: invoiceModel.bill_payments!.length,
//                               //     itemBuilder: (context, paiedindex) {
//                               //       return Column(
//                               //         children: [
//                               //           Row(
//                               //             mainAxisAlignment:
//                               //                 MainAxisAlignment.spaceBetween,
//                               //             children: [
//                               //               Text(
//                               //                   'Paid : ${invoiceModel.bill_payments![paiedindex].paid.toString()}'),
//                               //               IconButton(
//                               //                 onPressed: () {
//                               //                   showDialog(
//                               //                       context: context,
//                               //                       builder:
//                               //                           (context) =>
//                               //                               BlocConsumer<
//                               //                                   AccounterCubit,
//                               //                                   AccounterState>(
//                               //                                 listener:
//                               //                                     (context,
//                               //                                         state) {
//                               //                                   if (state
//                               //                                       is DeletedPaiedLoadingState) {
//                               //                                     Fluttertoast
//                               //                                         .showToast(
//                               //                                             msg:
//                               //                                                 'Deleted Sucssyfly');
//                               //                                     Navigator.of(
//                               //                                             context)
//                               //                                         .pop();
//                               //                                   } else if (state
//                               //                                       is DeletedPaidFaieldState) {
//                               //                                     Fluttertoast
//                               //                                         .showToast(
//                               //                                             msg:
//                               //                                                 'Errors Deleted');
//                               //                                     Navigator.pop(
//                               //                                         context);
//                               //                                   }
//                               //                                 },
//                               //                                 builder: (context,
//                               //                                     state) {
//                               //                                   return AlertDialog(
//                               //                                     title: Column(
//                               //                                       children: [
//                               //                                         Text(
//                               //                                             'Are you shure you wont delete this paied '),
//                               //                                         Row(
//                               //                                           mainAxisAlignment:
//                               //                                               MainAxisAlignment.spaceBetween,
//                               //                                           children: [
//                               //                                             ElevatedButton(
//                               //                                                 onPressed: () {
//                               //                                                   Navigator.of(context).pop();
//                               //                                                 },
//                               //                                                 child: Text('No')),
//                               //                                             ElevatedButton(
//                               //                                                 onPressed: () {
//                               //                                                   cubit.deletepaied(id: invoiceModel.bill_payments![paiedindex].id.toString());
//                               //                                                 },
//                               //                                                 child: Text(state is DeletedPaiedLoadingState ? 'Loading...' : 'Yes'))
//                               //                                           ],
//                               //                                         ),
//                               //                                       ],
//                               //                                     ),
//                               //                                   );
//                               //                                 },
//                               //                               ));
//                               //                 },
//                               //                 icon: Icon(
//                               //                   Icons.delete,
//                               //                   color: appTheme.primaryColor,
//                               //                 ),
//                               //               ),
//                               //             ],
//                               //           ),
//                               //         ],
//                               //       );
//                               //     }),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Sum Of Paid: ${cubit.getinvoiceModel[index].all_paid.toString()}${cubit.getinvoiceModel[index].currency_type}',
//                                     style: TextStyle(
//                                         color: Colors.green, fontSize: 15),
//                                   ),
//                                   // PopupMenuItem(child: Icon(Icons.))
//                                 ],
//                               ),
//                               // تضيف بعض المساحة بين الفواتير
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text('Total : '),
//                                       Text(
//                                         '${cubit.getinvoiceModel[index].total}  ${cubit.getinvoiceModel[index].currency_type}',
//                                         style: TextStyle(
//                                             color: appTheme.primaryColor),
//                                       ),
//                                     ],
//                                   ),
//                                   ElevatedButton(
//                                       onPressed: () {
//                                         paiedcontroller.clear();
//                                         showBottomSheet(
//                                             context: context,
//                                             builder: (context) {
//                                               return BlocConsumer<
//                                                   AccounterCubit,
//                                                   AccounterState>(
//                                                 listener: (context, state) {
//                                                   if (state
//                                                       is AddPaymentSucState) {
//                                                     Fluttertoast.showToast(
//                                                         msg:
//                                                             'Add Paid Sucssyflly',
//                                                         backgroundColor:
//                                                             appTheme
//                                                                 .primaryColor);
//                                                     Navigator.pop(context);
//                                                     cubit.getinvoice();
//                                                   } else if (state
//                                                       is AddPaymentsFaieldSate) {
//                                                     Fluttertoast.showToast(
//                                                       msg: state.message,
//                                                     );
//                                                   }
//                                                 },
//                                                 builder: (context, state) {
//                                                   return Container(
//                                                     width: double.infinity,
//                                                     height:
//                                                         MediaQuery.of(context)
//                                                                 .size
//                                                                 .height /
//                                                             3,
//                                                     padding:
//                                                         EdgeInsets.symmetric(
//                                                             horizontal: 10),
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.white,
//                                                         borderRadius:
//                                                             BorderRadius.only(
//                                                                 topLeft: Radius
//                                                                     .circular(
//                                                                         30),
//                                                                 topRight: Radius
//                                                                     .circular(
//                                                                         30))),
//                                                     child: Column(
//                                                       children: [
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(20.0),
//                                                           child: TextFormField(
//                                                             keyboardType:
//                                                                 TextInputType
//                                                                     .phone,
//                                                             decoration:
//                                                                 InputDecoration(
//                                                               labelText: 'Paid',
//                                                               hintText: 'Paid',
//                                                               hintStyle: TextStyle(
//                                                                   color: Colors
//                                                                       .black),
//                                                               labelStyle: TextStyle(
//                                                                   color: Colors
//                                                                       .black),
//                                                               border:
//                                                                   OutlineInputBorder(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                   5.0,
//                                                                 ),
//                                                                 borderSide: BorderSide(
//                                                                     width: 5.0,
//                                                                     style: BorderStyle
//                                                                         .solid,
//                                                                     color: Color(
//                                                                         0xff252b3b)),
//                                                               ),
//                                                             ),
//                                                             controller:
//                                                                 paiedcontroller,
//                                                           ),
//                                                         ),
//                                                         ElevatedButton(
//                                                             onPressed: () {
//                                                               // BlocProvider
//                                                               //         .of<AccounterCubit>(
//                                                               //             context)
//                                                               //     .addPayment(
//                                                               //         id: invoiceModel
//                                                               //             .id
//                                                               //             .toString(),
//                                                               //         paid: paiedcontroller
//                                                               //             .text);
//                                                             },
//                                                             child: Text(state
//                                                                     is AddPaymentsLoadingState
//                                                                 ? 'Loading...'
//                                                                 : 'Add Payment')),
//                                                       ],
//                                                     ),
//                                                   );
//                                                 },
//                                               );
//                                             });
//                                       },
//                                       child: Text('Add Payment')),
//                                 ],
//                               ),
//                               Divider(
//                                 thickness: 3,
//                                 height: 50,
//                                 color: Colors.grey,
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
