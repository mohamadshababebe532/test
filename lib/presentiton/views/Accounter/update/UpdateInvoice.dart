import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/waiting_dialog_widget.dart';
import '../add/addcustomerscreen.dart';
import '../cubit/accounter_cubit.dart';
import '../model/getinvoice_model.dart';
import '../model/updateinvoiceModel.dart';

class UpdateInvoice extends StatefulWidget {
  GetInvoiceModel getInvoiceModel;
  String? gender;
  UpdateInvoice({required this.getInvoiceModel, super.key});

  @override
  State<UpdateInvoice> createState() => _UpdateInvoiceState();
}

class _UpdateInvoiceState extends State<UpdateInvoice> {
  TextEditingController quantityController = TextEditingController();
  TextEditingController servicecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController taxcontroller = TextEditingController();
  TextEditingController notecontroller = TextEditingController();
  TextEditingController totalcontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController dueDatecontroller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey();
  GlobalKey<FormState> _formkey2 = GlobalKey();

  TextEditingController other = TextEditingController();
  String? selectAgents;
  String? selectBank;
  int quantity = 1;
  var items = ['invoice', 'qoutation'];
  String? typeinvoice;

  @override
  void initState() {
    var cubit = BlocProvider.of<AccounterCubit>(context);

    print(cubit.totalUpdate);
    cubit.updateinvoice.clear();
    cubit.tax.clear();
    cubit.paid.clear();
    cubit.resetForm();
    for (int i = 0; i < widget.getInvoiceModel.orders!.length; i++) {
      TextEditingController newServiceController = TextEditingController();
      TextEditingController newDescriptionController = TextEditingController();
      TextEditingController newpricecontroller = TextEditingController();
      print(cubit.updateinvoice.length);
      UpdateInvoiceModel updateInvoiceModel = UpdateInvoiceModel(
          descontroller: newDescriptionController,
          price: newpricecontroller,
          namecontroller: newServiceController);
      setState(() {
        cubit.Updateform(updateInvoiceModel: updateInvoiceModel);
        cubit.calculateTotalUpdate();
      });
      cubit.updateinvoice[i].namecontroller!.text =
          widget.getInvoiceModel.orders![i].order.toString();
      cubit.updateinvoice[i].price!.text =
          widget.getInvoiceModel.orders![i].price.toString();
      cubit.updateinvoice[i].quantitys =
          widget.getInvoiceModel.orders![i].quantity!;
      cubit.updateinvoice[i].descontroller!.text =
          widget.getInvoiceModel.orders![i].description!;
    }
    print(widget.getInvoiceModel.agent!.company_name);
    cubit.totalUpdate = widget.getInvoiceModel.total!;
    cubit.endtotalUpdate = widget.getInvoiceModel.subtotal!;
    selectAgents = widget.getInvoiceModel.agent!.id.toString();

    widget.gender = widget.getInvoiceModel.agent!.company_name.toString();
    print(widget.getInvoiceModel.total);
    dueDatecontroller.text = DateFormat('yyyy-MM-dd').format(DateTime.now());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var item = ['SYP', 'AED', 'USD', 'Other'];
    String? Curuncy_Type;
    var cubit = BlocProvider.of<AccounterCubit>(context);
    dueDatecontroller.text = widget.getInvoiceModel.duedate.toString();
    notecontroller.text = widget.getInvoiceModel.note.toString();
    datecontroller.text = widget.getInvoiceModel.date.toString();
    Curuncy_Type = widget.getInvoiceModel.currency_type.toString();
    cubit.paid.text = widget.getInvoiceModel.all_paid.toString();
    cubit.total = widget.getInvoiceModel.total!;
    //////////////////////////////////////
    // cubit.taxsubtotalUpdate = widget.getInvoiceModel.tax_rate!;
    // cubit.discountsubtotalUpdate = widget.getInvoiceModel.discount_rate!;
    // cubit.taxUpdate.text = widget.getInvoiceModel.tax.toString();
    // cubit.discount.text = widget.getInvoiceModel.discount.toString();
    cubit.taxUpdate.text = widget.getInvoiceModel.tax_rate.toString();
    cubit.taxsubtotalUpdate =
        double.parse(widget.getInvoiceModel.tax.toString());
    cubit.discountsubtotalUpdate =
        double.parse(widget.getInvoiceModel.discount.toString());
    cubit.discountUpdate.text = widget.getInvoiceModel.discount_rate.toString();
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AccounterCubit, AccounterState>(
          listener: (context, state) {
            if (state is AddInvoiceSucState) {
              Fluttertoast.showToast(msg: 'asd');
            } else if (state is AddInvoiceFiledState) {
              Fluttertoast.showToast(msg: 'qwe');
            }
          },
          builder: (context, state) {
            return Form(
              key: _formkey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 25),
                children: [
                  // SizedBox(
                  //   height: 25,
                  // ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      // Spacer(),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 7),
                            child: Text(
                              'Update Invoice',
                              style: TextStyle(
                                  fontSize: 20, color: appTheme.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      // Spacer(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black)),
                              onPressed: () async {
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
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Text('Date'),
                              )),
                          // Text(
                          //   'Date',
                          //   style: TextStyle(fontSize: 12),
                          // ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      borderSide:
                                          BorderSide(style: BorderStyle.none)),
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
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black)),
                              onPressed: () {},
                              child: Text('Due Date')),
                          // Text(
                          //   'DueDate',
                          //   style: TextStyle(fontSize: 10),
                          // ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      borderSide:
                                          BorderSide(style: BorderStyle.none)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  hintText: 'Date'),
                              controller: dueDatecontroller,
                              onTap: () async {
                                DateTime? pickdatetime = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2050));

                                if (pickdatetime != null) {
                                  dueDatecontroller.text =
                                      DateFormat('y-MM-d').format(pickdatetime);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 0.0),
                    child: Text('Choose Customer From The List'),
                  ),
                  DropdownButtonFormField(
                      elevation: 5,
                      hint: Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Text(
                            widget.gender.toString(),
                            style: TextStyle(color: Colors.black),
                          )),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                      ),
                      value: selectAgents == null ? 'asdasdasd' : null,
                      items: cubit.addAgentModel
                          .map((e) => DropdownMenuItem<String>(
                              value: e.id.toString(),
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: Text(e.company_name.toString()))))
                          .toList(),
                      onChanged: (myvalue) {
                        selectAgents = myvalue.toString();
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButtons(
                        onPress: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return AddCustomerScreen();
                          }));
                        },
                        color: Colors.black,
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 40,
                        iconData: Icons.add_circle_outline_outlined,
                        title: 'Add New Customer'),
                  ),
                  Divider(
                    color: Colors.green,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 4,
                    child: ListView.builder(
                        itemCount: cubit.updateinvoice.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                TextEditingController
                                                    newServiceController =
                                                    TextEditingController();
                                                TextEditingController
                                                    newDescriptionController =
                                                    TextEditingController();
                                                TextEditingController
                                                    newpricecontroller =
                                                    TextEditingController();
                                                TextEditingController
                                                    newtaxcontroller =
                                                    TextEditingController();

                                                UpdateInvoiceModel
                                                    updateInvoiceModel =
                                                    UpdateInvoiceModel(
                                                  descontroller:
                                                      newDescriptionController,
                                                  namecontroller:
                                                      newServiceController,
                                                  price: newpricecontroller,
                                                );
                                                setState(() {
                                                  cubit.Updateform(
                                                      updateInvoiceModel:
                                                          updateInvoiceModel);
                                                  cubit.calculateTotalUpdate();
                                                });
                                                print(
                                                    cubit.updateinvoice.length);
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  cubit.updateremoveform(
                                                      updateInvoiceModel:
                                                          cubit.updateinvoice[
                                                              index]);
                                                  cubit.calculateTotalUpdate();
                                                });
                                                return;
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              TextFormField(
                                validator: (input) {
                                  if (cubit.updateinvoice[index].descontroller!
                                      .text.isNotEmpty) {
                                    return null;
                                  } else {
                                    return 'Description Must not be empty';
                                  }
                                },
                                controller:
                                    cubit.updateinvoice[index].descontroller,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('QTY'),
                                  IconButton(
                                      onPressed: () {
                                        if (cubit.updateinvoice[index]
                                                .quantitys <
                                            1) {
                                          return;
                                        }
                                        setState(() {
                                          cubit.updateremovequantity(
                                              quantitys: cubit
                                                  .updateinvoice[index]
                                                  .quantitys,
                                              index: index);
                                          cubit.calculateTotalUpdate();
                                        });
                                      },
                                      icon: Icon(Icons.remove_circle,
                                          color: Colors.black)),
                                  Text(cubit.updateinvoice[index].quantitys
                                      .toStringAsFixed(0)),

                                  InkWell(
                                    onLongPress: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Column(
                                                children: [
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        decoration:
                                                            InputDecoration(
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                          labelStyle: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              5.0,
                                                            ),
                                                            borderSide: BorderSide(
                                                                width: 5.0,
                                                                style:
                                                                    BorderStyle
                                                                        .solid,
                                                                color: Color(
                                                                    0xff252b3b)),
                                                          ),
                                                        ),
                                                        controller:
                                                            quantityController,
                                                      )),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        cubit
                                                                .updateinvoice[
                                                                    index]
                                                                .quantitys =
                                                            double.parse(
                                                                quantityController
                                                                    .text);
                                                        cubit
                                                            .calculateTotalUpdate();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Save')),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    child: IconButton(
                                        onPressed: () {
                                          print(cubit
                                              .updateinvoice[index].quantitys);
                                          cubit.updateaddquantitys(
                                              quantitys: cubit
                                                  .updateinvoice[index]
                                                  .quantitys,
                                              index: index);
                                          print(cubit
                                              .updateinvoice[index].quantitys);
                                          cubit.calculateTotalUpdate();
                                        },
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: Colors.black,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text('Price'),
                                  ),
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      height: 65,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: TextFormField(
                                          style: TextStyle(fontSize: 13),
                                          validator: (input) {
                                            if (cubit.updateinvoice[index]
                                                .price!.text.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Price Must not be empty';
                                            }
                                          },
                                          cursorHeight: 20,
                                          keyboardType: TextInputType.phone,
                                          controller:
                                              cubit.updateinvoice[index].price,
                                          onChanged: (_) => setState(() {
                                            cubit.calculateTotalUpdate();
                                          }),
                                          decoration: InputDecoration(
                                            hintStyle:
                                                TextStyle(color: Colors.black),
                                            labelStyle:
                                                TextStyle(color: Colors.black),
                                            border: OutlineInputBorder(
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
                                        ),
                                      )),

                                  // Text(),
                                ],
                              ),
                              Divider(
                                height: 40,
                                color: Colors.black,
                              ),
                            ],
                          );
                        }),
                  ),
                  Divider(
                    color: Colors.green,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'SubTotal:  ${cubit.endtotalUpdate.toStringAsFixed(2)}'),
                      Row(
                        children: [
                          // Container(
                          //   width: 80,
                          //   height: 60,
                          //   child: DropdownButtonFormField(
                          //     elevation: 5,
                          //     decoration: const InputDecoration(
                          //         border: OutlineInputBorder(
                          //             borderRadius:
                          //                 BorderRadius.all(Radius.circular(0)))),
                          //     hint: Text(
                          //       '${Curuncy_Type}',
                          //       style:
                          //           TextStyle(color: Colors.black, fontSize: 13),
                          //     ),
                          //     items: item.map((String value) {
                          //       return DropdownMenuItem<String>(
                          //         alignment: Alignment.topLeft,
                          //         value: value,
                          //         child: Text(
                          //          value=='Other'&&other.text!=''?other.text:value,
                          //         style: const TextStyle(
                          //             color: Colors.black, fontSize: 9),
                          //       ),
                          //       );
                          //     }).toList(),
                          //     onChanged: (newValue) {
                          //       if(newValue.toString()=='Other'){
                          //           showDialog(context: context,barrierDismissible: false, builder:(context) {
                          //             return AlertDialog(
                          //                 title: Text('Currency Code'),
                          //                 content: Form(
                          //                   key: _formkey2,
                          //                   child: TextFormField(
                          //                     controller: other,
                          //                     validator: (value) {
                          //                       if(value!.isEmpty){
                          //                         return 'Please Enter Currency Code';
                          //                       }
                          //                       return null;
                          //                     },
                          //                   ),
                          //                 ),
                          //                 actions: [
                          //                   TextButton(
                          //                     onPressed: (){
                          //                     if(!_formkey2.currentState!.validate()){
                          //                         return;
                          //                       }

                          //                  setState(() {
                          //                    Curuncy_Type = other.text;
                          //                   //  item[3]='Other';
                          //                  });

                          //                       Navigator.of(context).pop();
                          //                       print(Curuncy_Type);
                          //                   }, child: Text('OK'))
                          //                 ],
                          //             );
                          //           },);
                          //         }
                          //         else{
                          //         Curuncy_Type = newValue.toString();
                          //        }

                          //       // if(newValue=='Other'){

                          //       // }
                          //       // Curuncy_Type = newValue.toString();
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text('TaxRate'),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height: 35,
                                  child: TextFormField(
                                    cursorHeight: 20,
                                    keyboardType: TextInputType.phone,
                                    controller: cubit.taxUpdate,
                                    onChanged: (value) =>
                                        cubit.calculateTotalUpdate(),
                                    // onChanged: (value) => setState(() {
                                    //   print(cubit.total);
                                    //   cubit.calculateTotalUpdate();
                                    //   print(cubit.tax);
                                    // }),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('DiscountRate'),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height: 40,
                                  child: TextFormField(
                                    cursorHeight: 20,
                                    keyboardType: TextInputType.phone,
                                    // initialValue: '',
                                    controller: cubit.discountUpdate,
                                    onChanged: (value) =>
                                        cubit.calculateTotalUpdate(),
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  child: Text(
                                    'Total:  ${cubit.totalUpdate.toStringAsFixed(2)} ',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Tax Due :  ${cubit.taxsubtotalUpdate.toString()}'),
                            Text(
                                'Discount Due :  ${cubit.discountsubtotalUpdate.toString()}'),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BlocConsumer<AccounterCubit, AccounterState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is GetNoteLoadingState) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return TextFormField(
                                maxLines: 2,
                                controller: notecontroller,
                                decoration: InputDecoration(
                                  hintText: 'Note',
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
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BlocConsumer<AccounterCubit, AccounterState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is GetNoteLoadingState) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return DropdownButtonFormField(
                                  hint: Text('Choose Bank'),
                                  elevation: 5,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(0))),
                                  ),
                                  value: selectBank,
                                  items: cubit.bankModel
                                      .map((e) => DropdownMenuItem<String>(
                                          value: e.id.toString(),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              child: Text(e.name.toString()))))
                                      .toList(),
                                  onChanged: (myvalue) async {
                                    notecontroller.clear();

                                    selectBank = myvalue.toString();
                                    print(myvalue);
                                    await cubit.showbank(
                                        id: myvalue.toString());
                                    if (state is GetNoteLoadingState) {
                                      notecontroller.clear();
                                      print('asdasdasd');
                                    }
                                    notecontroller.text =
                                        cubit.account.toString();
                                    print(notecontroller.text);
                                    print(cubit.account.toString());
                                  });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                      onPress: () async {
                        if (_formkey.currentState!.validate() == true) {
                          if (selectAgents == null) {
                            Fluttertoast.showToast(
                                msg: 'Please Select Customer',
                                backgroundColor: Colors.red);
                            return;
                          }
                          if (cubit.tax.text == '') {
                            cubit.tax.text = '0';
                          }
                          if (cubit.discount.text == '') {
                            cubit.discount.text = '0';
                          }

                          if (cubit.updateinvoice.isEmpty) {
                            Fluttertoast.showToast(
                                msg: 'Plase Add Invoice',
                                backgroundColor: Colors.red);
                          }
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoadingWidget2()));

                          UpdateModel model = UpdateModel(
                            subtotal: cubit.endtotalUpdate.toString(),
                            date: datecontroller.text,
                            duedate: dueDatecontroller.text,
                            currency_type: "QAR",
                            agent_id: selectAgents.toString(),
                            type: 'invoice',
                            tax: cubit.taxUpdate.text,
                            discount: cubit.discountUpdate.text,
                            total: cubit.totalUpdate.toString(),
                            paid: cubit.paid.text,
                            note: notecontroller.text,
                          );
                          List<Map<String, String>> orderData = [];
                          for (int i = 0; i < cubit.updateinvoice.length; i++) {
                            UpdateInvoiceModel order = cubit.updateinvoice[i];
                            Map<String, String> orderMap = {
                              'order': order.namecontroller!.text,
                              'description': order.descontroller!.text,
                              'quantity': order.quantitys.toString(),
                              'price': order.price!.text,
                            };
                            print(orderMap['order']);
                            print('asdasdasdasdasdasdasd');
                            orderData.add(orderMap);
                            print('asdasdasdasdasdasdasd');
                            print(orderMap.length);
                            print('asdasdasdasdasdasdasd');
                            print(orderData.length);
                            print('asdasdasdasdasdasdasd');
                          }
                          print(model.subtotal.toString());
                          Map<String, String> data = {
                            // 'tax_rate': model.tax.toString(),
                            // 'discount_rate': model.discount.toString(),
                            // 'tax': cubit.discountsubtotalUpdate.toString(),
                            // 'discount': cubit.taxsubtotalUpdate.toString(),
                            'tax': cubit.taxsubtotalUpdate.toString(),
                            'discount': cubit.discountsubtotalUpdate.toString(),
                            'tax_rate': model.tax.toString(),
                            'discount_rate': model.discount.toString(),
                            'id': widget.getInvoiceModel.id.toString(),
                            'currency_type': "QAR",
                            'date': datecontroller.text.toString(),
                            'duedate': dueDatecontroller.text.toString(),
                            'subtotal': model.subtotal.toString(),
                            'agent_id': model.agent_id.toString(),

                            'type': 'invoice',

                            'total': model.total.toString(),
                            'paid': model.paid.toString(),
                            'note': model.note.toString(),
                          };
                          print(
                              '/////////////////////////////////////////////');
                          print(
                              '/////////////////////////////////////////////');
                          print(data);
                          print(
                              '/////////////////////////////////////////////');
                          for (int i = 0; i < orderData.length; i++) {
                            Map<String, String> order = orderData[i];
                            // data['order[${i + 1}][order]'] = order['order']!;
                            data['order[${i + 1}][description]'] =
                                order['description']!;
                            data['order[${i + 1}][quantity]'] =
                                order['quantity']!;
                            data['order[${i + 1}][price]'] = order['price']!;
                          }
                          print('////////////////////////////////');
                          print('////////////////////////////////');
                          print('////////////////////////////////');
                          print(data);
                          final response = await http.post(
                            Uri.parse(
                                'http://senzascent.test-holooltech.com/api/admin/accounting/edit-invoice/${widget.getInvoiceModel.id.toString()}'),
                            body: data,
                          );
                          print(widget.getInvoiceModel.id);

                          var responseData = jsonDecode(response.body);
                          print(responseData);
                          if (response.statusCode == 200) {
                            Navigator.of(context).pop();
                            cubit.getinvoice();
                            Fluttertoast.showToast(
                                msg: 'Update successfully',
                                backgroundColor: Colors.green);
                            Navigator.pop(context);
                            print('تم إرسال البيانات بنجاح');
                          } else {
                            print('حدث خطأ أثناء إرسال البيانات');
                          }
                        }
                      },
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width / 2,
                      height: 40,
                      title: 'Save & Share'),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String generateRandomCode() {
    Random random = Random();
    int codeLength = 5;
    String code = '';

    for (int i = 0; i < codeLength; i++) {
      code += random.nextInt(10).toString();
    }

    return code;
  }
}
