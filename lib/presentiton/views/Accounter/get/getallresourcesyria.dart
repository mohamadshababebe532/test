import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
 
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../add/revenuesscreen.dart';
import '../cubit/accounter_cubit.dart';
import '../update/updaterevenusscreen..dart';

class GetAllResourceScreenSyria extends StatelessWidget {
  GetAllResourceScreenSyria({super.key});
  TextEditingController searchcontroller = TextEditingController();
  TextEditingController datecontrollerexcel = TextEditingController();
  TextEditingController namecontrollerexcel = TextEditingController();
  TextEditingController namepdf = TextEditingController();
  TextEditingController duedatecontrollerexcel = TextEditingController();

  var item = ['description      ', 'income    ', 'date'];
  String? gender;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AccounterCubit>(context);
    return  Column(
        children: [
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButtons(
            iconData: Icons.add,
            onPress: () {
              cubit.getagent();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RevenuesScreen(nameRevenuse: 'sy'),
              ));
            },
            color: appTheme.primaryColor,
            width: MediaQuery.of(context).size.width / 2,
            height: 40,
            title: 'Add Income Record',
          ),
              // IconButton(
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //     icon: Icon(Icons.arrow_back)),
              // Spacer(),
              // Text(
              //   'Income Page Syria',
              //   style: TextStyle(fontSize: 25, color: appTheme.primaryColor),
              // ),
              // Spacer(),
              // Spacer(),
              
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title:
                                  BlocConsumer<AccounterCubit, AccounterState>(
                                listener: (context, state) {
                                  if (state is SearchIncomeSucState) {
                                    Navigator.pop(context);
                                  } else if (state is SearcIncomeFaieldState) {
                                    Fluttertoast.showToast(msg: 'No Income');
                                  }
                                },
                                builder: (context, state) {
                                  if (state is SearchIncomeLoading) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 25,
                                        ),
                                        TextFormField(
                                          controller: searchcontroller,
                                          decoration: InputDecoration(
                                            hintText:
                                                'Search by company name OR Invoice No',
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
                                        ElevatedButton(
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
                                              BlocProvider.of<AccounterCubit>(
                                                      context)
                                                  .searchincome(
                                                      filter: gender.toString(),
                                                      search: searchcontroller
                                                          .text);
                                            },
                                            child: Text('Search')),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text('Filter:'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                height: 60,
                                                child: DropdownButtonFormField(
                                                  elevation: 5,
                                                  decoration: const InputDecoration(
                                                      border: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          0)))),
                                                  hint: Text(
                                                    'Filter',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                  items:
                                                      item.map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      value: value,
                                                      child: Text(
                                                        '$value',
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (newValue) {
                                                    gender =
                                                        newValue.toString();
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
                  )),
            ],
          ),
          // CustomButtons(
          //   iconData: Icons.add,
          //   onPress: () {
          //     cubit.getagent();
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => RevenuesScreen(),
          //     ));
          //   },
          //   color: appTheme.primaryColor,
          //   width: MediaQuery.of(context).size.width / 2,
          //   height: 40,
          //   title: 'Add Income Record',
          // ),
          Expanded(
            child: BlocConsumer<AccounterCubit, AccounterState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is getExpansessLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (cubit.revenuessModel.isEmpty) {
                  return Center(
                    child: Text('No Revenuse'),
                  );
                } else {
                  return ListView.builder(
                      itemCount: cubit.revenuessModel.length,
                      itemBuilder: (context, index) {
                        return cubit.revenuessModel[index].type_value == 'sy'
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1)),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: ListTile(
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  'Date:   ${cubit.revenuessModel[index].date.toString()}',
                                                  style:
                                                      TextStyle(fontSize: 13)),
                                              Text(
                                                  'Amount:  ${cubit.revenuessModel[index].income.toString()}',
                                                  style:
                                                      TextStyle(fontSize: 13)),
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
                                                                is DeletedSucsyfllytState) {
                                                              Fluttertoast
                                                                  .showToast(
                                                                      msg:
                                                                          'Deleted Succsyflly');
                                                              cubit
                                                                  .getallexpansess();
                                                              Navigator.pop(
                                                                  context);
                                                            } else if (state
                                                                is DeletedFaliedState) {
                                                              Fluttertoast
                                                                  .showToast(
                                                                      msg:
                                                                          'Errors Deleted');
                                                            }
                                                          },
                                                          builder:
                                                              (context, state) {
                                                            return AlertDialog(
                                                              title: Column(
                                                                children: [
                                                                  Text(
                                                                      'Are you sure you want to delete this Income ?'),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      ElevatedButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Text('No')),
                                                                      ElevatedButton(
                                                                          onPressed:
                                                                              () {
                                                                            cubit.deleterevenuse(id: cubit.revenuessModel[index].id.toString());
                                                                          },
                                                                          child: Text(state is DeletedLoadingState
                                                                              ? 'Loading...'
                                                                              : 'Yes'))
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      });
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  'Office : ${cubit.revenuessModel[index].type_value.toString()}',
                                                  style:
                                                      TextStyle(fontSize: 13)),
                                              Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        cubit.getagent();
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return UpdaterevenuseScreen(
                                                            nameUpdate: 'sy',
                                                            revenuessModelsss:
                                                                cubit.revenuessModel[
                                                                    index],
                                                          );
                                                        }));
                                                      },
                                                      icon: Icon(Icons.edit)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Text(
                                              'Description:  ${cubit.revenuessModel[index].description.toString()}',
                                              style: TextStyle(fontSize: 13)),
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
                if (state is getExpansessLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'TotalSyria : ${cubit.total_income_syria.toString()}',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Total : ${cubit.total_income.toString()}',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),

                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          ElevatedButton(
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
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
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
                                                          hintText: 'Date'),
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
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
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
                                                          hintText: 'Due Date'),
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
                                              Text(
                                                'Please Select Dubai or Syria',
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        if (namepdf
                                                            .text.isEmpty) {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'Please Check Your Data');
                                                          return;
                                                        }
                                                        cubit.urlsyriapdfincome(
                                                            date:
                                                                datecontrollerexcel
                                                                    .text,
                                                            duedate:
                                                                duedatecontrollerexcel
                                                                    .text,
                                                            syria:
                                                                namepdf.text);
                                                      },
                                                      child: Text(state
                                                              is AddUrlLancherPdfSyriaLoadingState
                                                          ? 'Loading...'
                                                          : 'Syria')),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        if (namepdf
                                                            .text.isEmpty) {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'Please Check Your Data');
                                                          return;
                                                        }
                                                        cubit.urldubaipdfincome(
                                                            date:
                                                                datecontrollerexcel
                                                                    .text,
                                                            duedate:
                                                                duedatecontrollerexcel
                                                                    .text,
                                                            dubai:
                                                                namepdf.text);
                                                      },
                                                      child: Text(state
                                                              is AddUrlLancherPdfDubiaLoadingState
                                                          ? "Loading..."
                                                          : 'Dubai')),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ));
                              },
                              child: Text('Pdf')),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
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
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
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
                                                          hintText: 'Date'),
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
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
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
                                                          hintText: 'Due Date'),
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
                                                  onPressed: () {
                                                    cubit.urlincome(
                                                        DueDateUrlExcel:
                                                            duedatecontrollerexcel
                                                                .text,
                                                        dateUrlExcel:
                                                            datecontrollerexcel
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
      );
   
  }
}
