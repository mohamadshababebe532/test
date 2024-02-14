// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../view_model/home/home_view_model.dart';
import '../Accounter/add/addfatoura.dart';
import '../login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  var timeHourForCompare = DateFormat('hh').format(DateTime.now());

  var timeAmPmForCompare = DateFormat('aa').format(DateTime.now());

  @override
  void initState() {
    super.initState();
  
    print('asdasdqweqweqweqweqweqweqweqwe');
    // FirebaseMessaging.onMessageOpenedApp.listen((event) async {
    //   print('applied this function');
    //   if (Provider.of<HomeViewModel>(context, listen: false).role == 'admin') {
    //     switch (event.notification!.title) {
    //       case 'New Check':
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context) => TimeRecordAdmin()));
    //         break;
    //       case 'Overtime Requested':
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context) => OvertimeScreenAdmin()));
    //         break;
    //       case 'New Holiday Request':
    //         Navigator.of(context).push(MaterialPageRoute(
    //             builder: (context) => HolidayRequestScreenAdmin()));
    //         break;
    //       case 'New Opinion':
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context) => OpinionScreenAdmin()));
    //         break;
    //       case 'New Todo':
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context) => TaskBoardAdmin()));
    //         break;
    //       case 'Prepaid Requested':
    //         Navigator.of(context).push(MaterialPageRoute(
    //             builder: (context) => PrepaidRequestAdminScreen()));
    //         break;
    //       case 'SwitchDays Requested':
    //         Navigator.of(context).push(MaterialPageRoute(
    //             builder: (context) => SwitchDaysAdminScreen()));
    //         break;
    //     }
    //   } else if (Provider.of<HomeViewModel>(context, listen: false).role ==
    //       'user') {
    //     switch (event.notification!.title) {
    //       case 'Remember!':
    //         Navigator.of(context)
    //             .push(MaterialPageRoute(builder: (context) => TaskBoardUser()));
    //         break;
    //       case 'Profile Changed':
    //       case 'Salary Delivered':
    //         Navigator.of(context)
    //             .push(MaterialPageRoute(builder: (context) => ProfileScreen()));
    //         break;
    //       case 'Overtime Request':
    //         Navigator.of(context).push(MaterialPageRoute(
    //             builder: (context) => OvertimeStatusScreen()));
    //         break;
    //       case 'Holiday Request':
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context) => HolidayStatusScreen()));
    //         break;
    //       case 'New Inbox':
    //         Navigator.of(context)
    //             .push(MaterialPageRoute(builder: (context) => InboxScreen()));
    //         break;
    //       case 'New Announcement':
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context) => AnnouncementsScreen()));
    //         break;
    //       case 'New Official Holiday':
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context) => OfficialHoliday()));
    //         break;
    //       case 'SwitchDays Status':
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context) => SwitchDaysScreen()));
    //         break;
    //     }
    //   } else if (Provider.of<HomeViewModel>(context, listen: false).role ==
    //       'accountant')
    //     switch (event.notification!.title) {
    //       case 'Remember!':
    //         Navigator.of(context)
    //             .push(MaterialPageRoute(builder: (context) => TaskBoardUser()));
    //         break;
    //       case 'Profile Changed':
    //       case 'Salary Delivered':
    //         Navigator.of(context)
    //             .push(MaterialPageRoute(builder: (context) => ProfileScreen()));
    //         break;
    //       case 'Overtime Request':
    //         Navigator.of(context).push(MaterialPageRoute(
    //             builder: (context) => OvertimeStatusScreen()));
    //         break;
    //       case 'Holiday Request':
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context) => HolidayStatusScreen()));
    //         break;
    //       case 'New Inbox':
    //         Navigator.of(context)
    //             .push(MaterialPageRoute(builder: (context) => InboxScreen()));
    //         break;
    //       case 'New Announcement':
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context) => AnnouncementsScreen()));
    //         break;
    //       case 'New Official Holiday':
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context) => OfficialHoliday()));
    //         break;
    //       case 'SwitchDays Status':
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context) => SwitchDaysScreen()));
    //         break;
    //       case 'Server':
    //         cubit.getDomain();
    //         Navigator.of(context).push(
    //             MaterialPageRoute(builder: (context) => GetDomainScreen()));
    //         break;
    //     }
    //   print(event.notification!.title);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
          return ListView(
            padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 5.0),
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              DateFormat('EEEE')
                                  .format(homeViewModel.timeNow)
                                  .substring(0, 3),
                              style: const TextStyle(
                                  fontFamily: 'digital-7', fontSize: 28),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              DateFormat('yyyy:MM:dd')
                                  .format(homeViewModel.timeNow),
                              style: const TextStyle(
                                  fontFamily: 'digital-7', fontSize: 28),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          homeViewModel.role == 'admin'
                              ? DateFormat('hh:mm:ss')
                                  .format(homeViewModel.addtime)
                              : DateFormat('hh:mm:ss')
                                  .format(homeViewModel.timeNow),
                          style: TextStyle(
                              fontFamily: 'digital-7',
                              fontSize: 67,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Image.asset(
                      (int.parse(timeHourForCompare) < 12 &&
                              int.parse(timeHourForCompare) > 05 &&
                              timeAmPmForCompare == 'AM')
                          ? 'assets/images/morning.png'
                          : ((int.parse(timeHourForCompare) < 6 &&
                                      int.parse(timeHourForCompare) > 0 &&
                                      timeAmPmForCompare == 'PM') ||
                                  int.parse(timeHourForCompare) == 12)
                              ? 'assets/images/afternoon.png'
                              : 'assets/images/moon.png',
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/8,

              ),
              Column(
                children: [
                  
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder:(context) => AddFatouraScreen(),));
                    },
                    child: Container(
                  
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2
                        
                        ),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/Path 260.png'),
                            Text('ACCOUNTING',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold) ,),
                      
                          ],
                        ),
                      ),
                    ),
                  ),
                   Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Container(
              
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2
                    
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //  Image.asset('assets/images/Path 260.png'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text('COMMING SOON',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold) ,),
                        ),
                  
                      ],
                    ),
                  ),
                ),
              ),
                ],
              ),
             
              // SizedBox(
              //   width: double.infinity,
              //   child: GridView.builder(
              //       shrinkWrap: true,
              //       physics: const NeverScrollableScrollPhysics(),
              //       gridDelegate:
              //           const SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 2,
              //               crossAxisSpacing: 19,
              //               mainAxisSpacing: 20),
              //       itemCount: homeViewModel.role == 'admin'
              //           ? GridData.gridAdminData.length
              //           : homeViewModel.role == 'user'
              //               ? GridData.gridData.length
              //               : homeViewModel.role == 'accountant'
              //                   ? GridData.griddataAccounter.length
              //                   : 7,
              //       itemBuilder: (context, index) {
              //         return GestureDetector(
              //           onTap: () {
              //             homeViewModel.role == 'admin'
              //                 ? Navigator.of(context).push(MaterialPageRoute(
              //                     builder: (context) =>
              //                         GridData.gridAdminData[index]['route']))
              //                 : homeViewModel.role == 'user'
              //                     ? Navigator.of(context).push(
              //                         MaterialPageRoute(
              //                             builder: (context) => GridData
              //                                 .gridData[index]['route']))
              //                     : homeViewModel.role == 'accountant'
              //                         ? Navigator.of(context).push(
              //                             MaterialPageRoute(
              //                                 builder: (context) =>
              //                                     GridData.griddataAccounter[
              //                                         index]['route']))
              //                         : null;
              //           },
              //           child: Container(
              //               height: 170,
              //               width: 170,
              //               decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(14.0),
              //                   border: Border.all(
              //                     color: Colors.grey.withOpacity(0.4),
              //                   )),
              //               child: Center(
              //                 child: Column(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceEvenly,
              //                   children: [
              //                     Image.asset(
              //                       homeViewModel.role == 'admin'
              //                           ? GridData.gridAdminData[index]
              //                               ['images']
              //                           : homeViewModel.role == 'user'
              //                               ? GridData.gridData[index]
              //                                   ['images']
              //                               : homeViewModel.role ==
              //                                       'accountant'
              //                                   ? GridData.griddataAccounter[
              //                                       index]['images']
              //                                   : GridData.griddataAccounter[
              //                                       index]['images'],
              //                       height: 88.16,
              //                       width: 89.22,
              //                     ),
              //                     Text(homeViewModel.role == 'admin'
              //                         ? GridData.gridAdminData[index]['name']
              //                         : homeViewModel.role == 'user'
              //                             ? GridData.gridData[index]['name']
              //                             : homeViewModel.role == 'accountant'
              //                                 ? GridData.griddataAccounter[
              //                                     index]['name']
              //                                 : ''),
              //                   ],
              //                 ),
              //               )),
              //         );
              //       }),
              // ),
               SizedBox(height: MediaQuery.of(context).size.height/8,),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                        minimumSize: Size(80, 55),
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (cpntext) {
                            return AlertDialog(
                              title: Row(
                                children: [
                                  Text(
                                    'Do you really want to leave?   ',
                                    style: TextStyle(
                                        color: Color(0xFFA6A6A6), fontSize: 17),
                                  ),
                                  Image.asset(
                                    'assets/images/normal mode.png',
                                    height: 25,
                                  ),
                                ],
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                 Colors.black,
                                            minimumSize: Size(80, 40),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'No',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                    Spacer(),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                             Colors.black,
                                          minimumSize: Size(80, 40),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                        ),
                                        onPressed: () async {
                                          // await homeViewModel.signOut();
                
                                          await _storage.deleteAll();
                
                                         
                
                                          homeViewModel.dispose();
                                           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context) => LoginScreen(),), (route) => false);

                                        },
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Spacer(),
                                  ],
                                ),
                              ],
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: const Text('SIGN OUT',style: TextStyle(fontSize: 25),),
                    )),
              ),
              const SizedBox(
                height: 25.0,
              ),
            ],
          );
        }),
      ),
    );
  }
}


// Provider.of<HomeViewModel>(context, listen: false).role == 'user




//        await homeViewModel.signOut();

                                      // await _storage.deleteAll();

                                      // await Phoenix.rebirth(context);

                                      // homeViewModel.dispose();