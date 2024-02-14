import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../add/addcustomerscreen.dart';
import '../cubit/accounter_cubit.dart';
import '../update/updateagentscreen.dart';
 
// import 'package:holool_app/presentiton/views/Accounter/update/updaterevenusscreen..dart';

class GetAllAgentsScreen extends StatelessWidget {
  GetAllAgentsScreen({super.key});
  TextEditingController searchcontroller = TextEditingController();
  var item = ['phone', 'name', 'company_name'];
  String? gender;
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AccounterCubit>(context);
    return Scaffold(
      body: Column(
        children: [
          // SizedBox(
          //   height: 35,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width/9,),
               CustomButtons(
                   onPress: () {
                     Navigator.of(context).push(MaterialPageRoute(
                         builder: (context) => AddCustomerScreen()));
                   },
                   color: Colors.black,
                   width: MediaQuery.of(context).size.width / 2,
                   height: 40,
                   title: 'Add Agents'),
              // IconButton(
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //     icon: Icon(Icons.arrow_back)),
              // Spacer(),
              // Text(
              //   'Customers',
              //   style: TextStyle(color: appTheme.primaryColor, fontSize: 25),
              // ),
              // Spacer(),
              // Spacer(),
              BlocBuilder<AccounterCubit, AccounterState>(

                builder: (context,state) {
                  return 
                 cubit.addAgentModel.isNotEmpty? IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title:
                                      BlocConsumer<AccounterCubit, AccounterState>(
                                    listener: (context, state) {
                                      if (state is SearchAgentsSucState) {
                                        Navigator.pop(context);
                                      } else if (state is SearchAgentsFaliedState) {
                                        Fluttertoast.showToast(msg: 'No Agents');
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state is SearchAgentsLoadingState) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      
                                       else {
                                        return Column(
                                          children: [
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
                                              style: ButtonStyle(
                                                 backgroundColor: MaterialStateProperty.all<Color>(Colors.black),

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
                                                  BlocProvider.of<AccounterCubit>(
                                                          context)
                                                      .searchAgents(
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
                                                          child: Container(
                                                            width: 80,
                                                            child: Text(
                                                              '$value',
                                                              style:
                                                                  const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize: 12),
                                                            ),
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
                      )):SizedBox.shrink();
                }
              ),
            ],
          ),
          // Container(
          //     child: CustomButtons(
          //         onPress: () {
          //           Navigator.of(context).push(MaterialPageRoute(
          //               builder: (context) => AddCustomerScreen()));
          //         },
          //         color: appTheme.primaryColor,
          //         width: MediaQuery.of(context).size.width / 2,
          //         height: 40,
          //         title: 'Add Agents')),
          Expanded(
            child: BlocConsumer<AccounterCubit, AccounterState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetAllAgentsLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (cubit.addAgentModel.isEmpty) {
                  return Center(
                    child: Text(
                      'No Agents',
                      style: TextStyle(fontSize: 25),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: cubit.addAgentModel.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                              decoration:
                                  BoxDecoration( 
                                    color: Color(0xFFEBEBEB)
                                  ),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: ListTile(
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                         Row(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ID : ',
                                              style: TextStyle(
                                                  color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                '${cubit.addAgentModel[index].id.toString()}'),
                                          ],
                                        ) ,
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    cubit.addAgentModel[index].type!.isNotEmpty?    Row(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Type : ',
                                             style: TextStyle(
                                                  color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                '${cubit.addAgentModel[index].type.toString()}'),
                                          ],
                                        ):SizedBox.shrink(),
                                        Row(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: appTheme.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return UpdateAgentsScreen(
                                                        addAgentModelsss:
                                                            cubit.addAgentModel[
                                                                index],
                                                      );
                                                    }));
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                 cubit.addAgentModel[index].name!.isNotEmpty?   Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name : ',
                                          style: TextStyle(
                                                  color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            '${cubit.addAgentModel[index].name.toString()}'),
                                      ],
                                    ):SizedBox.shrink(),
                             cubit.addAgentModel[index].company_name!.isNotEmpty?       Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Company : ',
                                          style: TextStyle(
                                                  color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Text(
                                              '${cubit.addAgentModel[index].company_name.toString()}'),
                                        ),
                                      ],
                                    ):SizedBox.shrink(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                   cubit.addAgentModel[index].phone_number!.isNotEmpty?     Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Phone : ',
                                              style: TextStyle(
                                                  color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                '${cubit.addAgentModel[index].phone_number.toString()}'),
                                          ],
                                        ):SizedBox.shrink(),
                                      ],
                                    ),
                                cubit.addAgentModel[index].country!.isNotEmpty?    Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Country : ',
                                           style: TextStyle(
                                                  color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            '${cubit.addAgentModel[index].country.toString()}'),
                                      ],
                                    ):SizedBox.shrink(),
                                cubit.addAgentModel[index].website!.isNotEmpty?    Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Website : ',
                                          style: TextStyle(
                                                  color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          width: 120,
                                          child: Text(
                                              '${cubit.addAgentModel[index].website.toString()}'),
                                        ),
                                      ],
                                    ):SizedBox.shrink(),
                                 cubit.addAgentModel[index].land_line!.isNotEmpty?   Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'LandLine : ',
                                           style: TextStyle(
                                                  color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            '${cubit.addAgentModel[index].land_line.toString()}'),
                                      ],
                                    ):SizedBox.shrink(),
                                  ],
                                ),
                              )),
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
