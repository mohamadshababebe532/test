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
import '../cubit/accounter_cubit.dart';
import '../model/addinvoice.dart';
import 'addcustomerscreen.dart';

class AddInvoice extends StatefulWidget {
  AddInvoice({super.key});

  @override
  State<AddInvoice> createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {
  TextEditingController quantitycontrller = TextEditingController();
  TextEditingController servicecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController taxcontroller = TextEditingController();
  TextEditingController totalcontroller = TextEditingController();
  TextEditingController notecontroller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController dueDatecontroller = TextEditingController();
  GlobalKey<FormState> _formkey2 = GlobalKey();

  TextEditingController other = TextEditingController();
  String? selectAgents;

  int quantity = 1;
  var item = ['SYP', 'AED', 'USD','Other'];
  String Curuncy_Type='SYP';
  String? typeinvoice;
  String? selectBank;
  void decreaseQuantity(int index) {
    var cubit = BlocProvider.of<AccounterCubit>(context);
    setState(() {
      if (cubit.addinvoicemodel[index].quantitys > 1) {
        cubit.addinvoicemodel[index].quantitys--;
      }
    });
  }

  void increaseQuantity(int index) {
    var cubit = BlocProvider.of<AccounterCubit>(context);
    setState(() {
      cubit.addinvoicemodel[index].quantitys++;
    });
  }

  void initState() {
     final _currentDate = DateTime.now();
    var cubit = BlocProvider.of<AccounterCubit>(context);
    datecontroller.text=DateFormat('yyyy-MM-dd').format( _currentDate).toString();
    // datecontroller.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    dueDatecontroller.text=DateFormat('yyyy-MM-dd').format( _currentDate.add(Duration(days: 10)));
    // dueDatecontroller.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    cubit.tax.clear();
    cubit.paid.clear();
    notecontroller.clear();
    cubit.discount.clear();
    TextEditingController newServiceController = TextEditingController();
    TextEditingController newDescriptionController = TextEditingController();
    TextEditingController newpricecontroller = TextEditingController();
    TextEditingController newtaxcontroller = TextEditingController();
    AddInvoiceModel addInvoiceModel = AddInvoiceModel(
        descontroller: newDescriptionController,
        price: newpricecontroller,
        namecontroller: newServiceController);
     if(cubit.addinvoicemodel.isEmpty){
 cubit.addform(addInvoiceModel: addInvoiceModel);
    cubit.calculateTotal();

     }
   
    print(cubit.addinvoicemodel.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AccounterCubit>(context);

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
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:   EdgeInsets.only(left: MediaQuery.of(context).size.width/5),
                            child: Text(
                              'New Invoice',
                              style: TextStyle(
                              fontSize: 20, color: appTheme.primaryColor),
                            ),
                          ),
                        ],
                      ),
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
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            ),
                            onPressed: ()async{
                               DateTime? pickdatetime = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2050));
    
                                if (pickdatetime != null) {
                                  datecontroller.text =
                                      DateFormat('y-MM-d').format(pickdatetime);
                                }
                            }, child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Date'),
                            )),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
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
                            
                            onPressed: ()async{
                               DateTime? pickdatetime = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2050));
    
                                if (pickdatetime != null) {
                                  dueDatecontroller.text =
                                      DateFormat('y-MM-d').format(pickdatetime);
                                }
                            }, child:Text('Due Date'),
                          style:ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),

                          ) ,
                          ),
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
                                          BorderRadius.all(Radius.circular(0)),
                                      borderSide:
                                          BorderSide(style: BorderStyle.none)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0))),
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
                    menuMaxHeight:MediaQuery.of(context).size.height/2.5,
                      dropdownColor: Colors.grey.shade300,
                      hint: Text('Choose Customer'),
                      elevation: 0,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                      ),
                      value: selectAgents,
                      items: cubit.addAgentModel
                          .map((e) => DropdownMenuItem<String>(
                            

                            
                              value: e.id.toString(),
                              child: Container(
                                
                                  width: MediaQuery.of(context).size.width / 1.5,
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
                        color:   Colors.black  ,
                        width: MediaQuery.of(context).size.width / 1.7,
                        height: 40,
                        iconData: Icons.add_circle_outline_outlined,
                        title: 'Add New Customer'),
                  ),
                  Divider(
                    thickness: 2,
                    color: appTheme.primaryColor,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 4,
                    child: ListView.builder(
                        itemCount: cubit.addinvoicemodel.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
    
                                                    AddInvoiceModel
                                                        addInvoiceModel =
                                                        AddInvoiceModel(
                                                      descontroller:
                                                          newDescriptionController,
                                                      price: newpricecontroller,
                                                      namecontroller:
                                                          newServiceController,
                                                    );
    
                                                    cubit.addform(
                                                        addInvoiceModel:
                                                            addInvoiceModel);
                                                    cubit.calculateTotal();
    
                                                    print(cubit
                                                        .addinvoicemodel.length);
                                                  },
                                                  icon: Icon(Icons.add)),
                                            ],
                                          ),
                                   cubit.addinvoicemodel.length>1?  IconButton(
                                              onPressed: () {
                                               
                                                cubit.removeform(
                                                    addInvoiceModel: cubit
                                                        .addinvoicemodel[index]);
                                                cubit.calculateTotal();
                                              },
                                              icon: Icon( Icons.delete)
                                              ) :SizedBox.shrink(),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              TextFormField(
                                validator: (input) {
                                  if (cubit.addinvoicemodel[index].descontroller!
                                      .text.isNotEmpty) {
                                    return null;
                                  } else {
                                    return 'Description Must not be empty';
                                  }
                                },
                                controller:
                                    cubit.addinvoicemodel[index].descontroller,
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
                                        if (cubit.addinvoicemodel[index]
                                                .quantitys <
                                            1) {
                                          return;
                                        }
    
                                        cubit.removequantity(
                                            quantitys: cubit
                                                .addinvoicemodel[index].quantitys,
                                            index: index);
                                        cubit.calculateTotal();
                                      },
                                      icon: Icon(Icons.remove_circle,color:  Colors.black)),
                                  InkWell(
                                    onTap: () async {},
                                    child: Text(cubit
                                        .addinvoicemodel[index].quantitys
                                        .toStringAsFixed(0)),
                                  ),
    
                                  InkWell(
                                    onLongPress: () {
                                      showDialog(
                                          context: context,
                                              barrierDismissible: false, 
                                          builder: (context) {
                                            return BlocConsumer<AccounterCubit,
                                                AccounterState>(
                                              listener: (context, state) {},
                                              builder: (context, state) {
                                                return AlertDialog(
                                                  title: Column(
                                                    children: [
                                                      Container(
                                                          width: MediaQuery.of(
                                                                      context)
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
                                                                  color: Colors
                                                                      .black),
                                                              labelStyle:
                                                                  TextStyle(
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
                                                                    width: 5.0,
                                                                    style:
                                                                        BorderStyle
                                                                            .solid,
                                                                    color: Color(
                                                                        0xff252b3b)),
                                                              ),
                                                            ),
                                                            controller:
                                                                quantitycontrller,
                                                          )),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            cubit
                                                                    .addinvoicemodel[
                                                                        index]
                                                                    .quantitys =
                                                                double.parse(
                                                                    quantitycontrller
                                                                        .text);
                                                            cubit
                                                                .calculateTotal();
                                                            print(
                                                                quantitycontrller
                                                                    .text);
                                                            Navigator.of(context)
                                                                .pop();
                                                          },
                                                          child: Text('Save'))
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          });
                                    },
                                    child: IconButton(
                                        onPressed: () async {
                                          print(cubit
                                              .addinvoicemodel[index].quantitys);
                                          cubit.addquantitys(
                                              quantitys: cubit
                                                  .addinvoicemodel[index]
                                                  .quantitys,
                                              index: index);
                                          print(cubit
                                              .addinvoicemodel[index].quantitys);
                                          cubit.calculateTotal();
                                        },
                                        icon: Icon(Icons.add_circle,color: Colors.black,)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text('Price'),
                                  ),
                                  Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2.5,
                                      height: 65,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: TextFormField(
                                          style: TextStyle(fontSize: 13),
                                          validator: (input) {
                                            if (cubit.addinvoicemodel[index]
                                                .price!.text.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Price Must not be empty';
                                            }
                                          },
                                          cursorHeight: 20,
                                          keyboardType: TextInputType.phone,
                                          controller:
                                              cubit.addinvoicemodel[index].price,
                                          onChanged: (_) => setState(() {
                                            cubit.calculateTotal();
                                          }),
                                          decoration: InputDecoration(
                                            hintStyle:
                                                TextStyle(color: Colors.black),
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
                    thickness: 2,
                    color: appTheme.primaryColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text('SubTotal:  ${cubit.endtotal.toStringAsFixed(2)}'),
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       width: 120,
                      //       height: 90,
                      //       child: DropdownButtonFormField(
                      //          validator: (value) {
                      //       if(value=='Other'&&other.text.isEmpty){
                      //          Fluttertoast.showToast(
                      //           msg: 'Please Choose Currency Code ',
                      //           backgroundColor: Colors.red);
                      //         return '';
                      //       }
                      //       return null;
                      //     },
                      //             dropdownColor: Colors.grey.shade300,
                              
                      //         elevation: 5,
                      //         decoration: const InputDecoration(
                      //           errorBorder: OutlineInputBorder(
                                  
                      //                 borderRadius:
                      //                     BorderRadius.all(Radius.circular(0))),
                      //             border: OutlineInputBorder(
                      //                 borderRadius:
                      //                     BorderRadius.all(Radius.circular(0)))),
                      //         hint: Text(
                      //           Curuncy_Type,
                      //           style:
                      //               TextStyle(color: Colors.black, fontSize: 13),
                      //         ),
                      //         items: item.map((String value) {
                      //           return DropdownMenuItem<String>(
                                  
                      //             alignment: Alignment.topLeft,
                      //             value: value,
                      //           // value:Curuncy_Type!=null?Curuncy_Type:'DXP',
                      //             child: Text(
                      //                value=='Other'&&other.text!=''?other.text:value ,
                      //               style: const TextStyle(
                      //                   color: Colors.black, fontSize: 12),
                      //             ),
                      //           );
                      //         }).toList(),
                               
                      //         onChanged: (newValue) {
                      //           //  newValue=other.text;
                      //           print(newValue);
                              
                      //           if(newValue.toString()=='Other'){
                      //             showDialog(context: context,barrierDismissible: false, builder:(context) {
                      //               return AlertDialog(
                      //                   title: Text('Currency Code'),
                      //                   content: Form(
                      //                     key: _formkey2,
                      //                     child: TextFormField(
                      //                       controller: other,
                      //                       validator: (value) {
                      //                         if(value!.isEmpty){
                      //                           return 'Please Enter Currency Code';
                      //                         }
                      //                         return null;
                      //                       },
                      //                     ),
                      //                   ),
                      //                   actions: [
                      //                     TextButton(
                      //                       onPressed: (){
                      //                       if(!_formkey2.currentState!.validate()){
                      //                           return;
                      //                         }
                                         
                      //                    setState(() {
                      //                      Curuncy_Type = other.text;
                      //                     //  item[3]='Other';
                      //                    }); 
                                             
                                           
                      //                         Navigator.of(context).pop();
                      //                         print(Curuncy_Type);
                      //                     }, child: Text('OK')),
                      //                      TextButton(
                      //                       onPressed: (){
                      //                         Navigator.of(context).pop();
                      //                         print(Curuncy_Type);
                                              
                      //                     }, child: Text('Cancle')),
                      //                   ],
                      //               );
                      //             },);
                      //           }
                      //           else{
                                  
                      //           Curuncy_Type = newValue.toString();


                                  
                      //          }
                              
    
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                             
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text('Tax Rate'),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height: 35,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 12),
                                    cursorHeight: 20,
                                    keyboardType: TextInputType.phone,
                                    controller: cubit.tax,
                                    onChanged: (value) => cubit.calculateTotal(),
                                    decoration: InputDecoration(
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
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10.0),
                              ),
                               
                              Text('DiscountRate'),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height: 35,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 12),
                                    cursorHeight: 20,
                                    keyboardType: TextInputType.phone,
                                    // initialValue: '',
                                    controller: cubit.discount,
                                    onChanged: (value) => cubit.calculateTotal(),
                                    decoration: InputDecoration(
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
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 25.0, left: 3),
                                child: Text('Paid'),
                              ),
                               SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 6,
                                height: 35,
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  cursorHeight: 20,
                                  controller: cubit.paid,
                                  onChanged: (value) => cubit.calculateTotal(),
                                  obscureText: false,
                                  style: TextStyle(fontSize: 12),
                                  decoration: InputDecoration(
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
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total:  ',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 0),
                                       child: Container(
                                        width: MediaQuery.of(context).size.width/4.9,
                                         child: Text(
                                          cubit.total.toStringAsFixed(2),
                                          style: TextStyle(fontSize: 12),
                                            ),
                                       ),
                                     ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tax Due :  ${cubit.taxsubtotal.toString()}'),
                            Text(
                                'Discount Due :  ${cubit.discountsubtotal.toString()}'),
                          ],
                        ),
                        BlocConsumer<AccounterCubit, AccounterState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state is GetNoteLoadingState) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Column(
                                children: [
                                  TextFormField(
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
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DropdownButtonFormField(
                                    dropdownColor: Colors.grey.shade300,
                                      hint: Text('Choose Bank'),
                                      elevation: 5,
                                      decoration: const InputDecoration(
                                         
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(0)),
                                                
                                                
                                                ),
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
                                                  child: Text(
                                                    e.name.toString()
                                                  ))))
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
                                      })
                                ],
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    
                      onPress: () async {
                        if (_formkey.currentState!.validate() == true) {
                          if (Curuncy_Type == 'Other' ) {
                            Fluttertoast.showToast(
                                msg: 'Please Choose Currency Code',
                                backgroundColor: Colors.red);
                            return;
                          }
                           if (cubit.addinvoicemodel[0].descontroller == '') {
                            Fluttertoast.showToast(
                                msg: 'Please Add Desc',
                                backgroundColor: Colors.red);
                            return;
                          }
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
                          if (cubit.paid.text == '') {
                            cubit.paid.text = '0';
                          }
                          if (cubit.addinvoicemodel.isEmpty) {
                            Fluttertoast.showToast(
                                msg: 'Plase Add Invoice',
                                backgroundColor: Colors.red);
                          }
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoadingWidget2()));
                          MohamadModel model = MohamadModel(
                            currency_type: "QAR",
                            date: datecontroller.text,
                            subtotal: cubit.endtotal.toString(),
                            duedate: dueDatecontroller.text,
                            note: notecontroller.text,
                            agent_id: selectAgents.toString(),
                            agent_no: generateRandomCode(),
                            type: 'invoice',
                            tax: cubit.tax.text,
                            discount: cubit.discount.text,
                            total: cubit.total.toString(),
                            invoice_no: generateRandomCode(),
                            paid: cubit.paid.text,
                          );
                          List<Map<String, String>> orderData = [];
                          for (int i = 0; i < cubit.addinvoicemodel.length; i++) {
                            AddInvoiceModel order = cubit.addinvoicemodel[i];
                            Map<String, String> orderMap = {
                              'description': order.descontroller!.text,
                              'quantity': order.quantitys.toString(),
                              'price': order.price!.text,
                            };
                            orderData.add(orderMap);
                          }
                          Map<String, String> data = {
                            'tax': cubit.taxsubtotal.toString(),
                            'discount': cubit.discountsubtotal.toString(),
                            'tax_rate': model.tax.toString(),
                            'discount_rate': model.discount.toString(),
                            'currency_type': Curuncy_Type.toString(),
                            'subtotal': model.subtotal.toString(),
                            'date': datecontroller.text,
                            'duedate': dueDatecontroller.text,
                            'agent_id': model.agent_id.toString(),
                            'type': model.type.toString(),
                            'total': model.total.toString(),
                            'paid': model.paid.toString(),
                            'note': model.note.toString(),
                          };
                          print(Curuncy_Type.toString());
                          for (int i = 0; i < orderData.length; i++) {
                            Map<String, String> order = orderData[i];
    
                            data['order[${i + 1}][description]'] =
                                order['description']!;
                            data['order[${i + 1}][quantity]'] =
                                order['quantity']!;
                            data['order[${i + 1}][price]'] = order['price']!;
                          }
    
                          final response = await http.post(
                              Uri.parse(
                                  'http://senzascent.test-holooltech.com/api/admin/accounting/create-invoice'),
                              body: data,
                              headers: {
                                'Accept': 'application/json',
                              });
    
                          var responseData = jsonDecode(response.body);
                          Navigator.pop(context);
                          if (response.statusCode == 200) {
                            other.clear;
                            print(responseData);
                            if (responseData['status'] == true) cubit.resetForm();
                            setState(() {
                              orderData.clear();
                            });
    
                            cubit.getinvoice();
                            Fluttertoast.showToast(
                                msg: 'Add Invoice successfully',
                                backgroundColor: Colors.green);
                            Navigator.of(context).pop();
                            print('تم إرسال البيانات بنجاح');
                          } else if (response.statusCode == 500) {
                            Fluttertoast.showToast(
                                msg: 'Please Cheack your Internet');
                          } else {
                            print('asd');
                            Fluttertoast.showToast(
                                msg: 'Please Cheack your Internet');
                          }
                        }
                      },
                      color:  Colors.black,
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
