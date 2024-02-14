import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 

import '../../../../core/theme/app_theme.dart';
import '../cubit/accounter_cubit.dart';
import '../get/getallQuatitionscreen.dart';
import '../get/getallagentsscreen.dart';
import '../get/getallexpansesscreendubia.dart';
import '../get/getallexpansessscreensyria.dart';
import '../get/getallresourceDubai.dart';
import '../get/getallresourcesyria.dart';
import '../get/getbankscreen.dart';
import '../get/getinvoicescreen.dart';

class AddFatouraScreen extends StatelessWidget {
  int? quanttiy;

  AddFatouraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AccounterCubit>(context);
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AccounterCubit, AccounterState>(
         
          builder: (context, state) {
         return   ListView(
                  children: [
        
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
               
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/7),
                child: Text(
                  'Accounting Screen',
                  style: TextStyle(fontSize: 25, color: appTheme.primaryColor),
                ),
              ),
             
            ],
          ),
          SizedBox(
            
            height: MediaQuery.of(context).size.height /4.5,
            child: 
            ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ItemAccount(cubit: cubit,index: 0, imagePath:'assets/images/Group 69.png' ,onTapItem:(){
                   cubit.indexItem(0);
              
                  cubit.getresource();
                 
                } ,title:'Income' ,widget:GetAllResourceScreenDubai() ,),
                              // ItemAccount(cubit: cubit,index: 1, imagePath: 'assets/images/Group 69.png' ,onTapItem:(){
                              //   cubit.indexItem(1);
                              //   cubit.getresource();
                              
                              // } ,title:'Income Syria' ,widget:GetAllResourceScreenSyria() ,),
                
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: GestureDetector(
                //     onTap: () {
                //       cubit.getresource();
                //       Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => GetAllResourceScreenSyria(),
                //       ));
                //     },
                //     child: Container(
                //         height: 170,
                //         width: 170,
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(14.0),
                //             border: Border.all(
                //               color: Colors.grey.withOpacity(0.4),
                //             )),
                //         child: Center(
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               Image.asset(
                //                 'assets/images/Group 69.png',
                //                 height: 88.16,
                //                 width: 89.22,
                //               ),
                //               Text('Income Syria'),
                //             ],
                //           ),
                //         )),
                //   ),
                // ),
                
                              ItemAccount(cubit: cubit,index: 2, imagePath:  'assets/images/Group 70.png' ,onTapItem:(){
                                 cubit.indexItem(2);
                               cubit.getallexpansess2() ;
                              
                              },title:'Expensess' ,widget:getAllExpansessDubai() ,),
                
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: GestureDetector(
                //     onTap: () {
                //       cubit.getallexpansess2();
                //       Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => getAllExpansessDubai(),
                //       ));
                //     },
                //     child: Container(
                //         height: 170,
                //         width: 170,
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(14.0),
                //             border: Border.all(
                //               color: Colors.grey.withOpacity(0.4),
                //             )),
                //         child: Center(
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               Image.asset(
                //                 'assets/images/Group 70.png',
                //                 height: 88.16,
                //                 width: 89.22,
                //               ),
                //               Text('Expensess Dubai'),
                //             ],
                //           ),
                //         )),
                //   ),
                // ),
                // ItemAccount(cubit: cubit,index: 3, imagePath: 'assets/images/Group 70.png' ,onTapItem:(){
                //   cubit.indexItem(3);
                //   cubit.getallexpansess();
                // } ,title:'Expensess Syria' ,widget:getAllExpansessSyria() ,),
                
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: GestureDetector(
                //     onTap: () {
                //       cubit.getallexpansess();
                //       Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => getAllExpansessSyria(),
                //       ));
                //     },
                //     child: Container(
                //         height: 170,
                //         width: 170,
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(14.0),
                //             border: Border.all(
                //               color: Colors.grey.withOpacity(0.4),
                //             )),
                //         child: Center(
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               Image.asset(
                //                 'assets/images/Group 70.png',
                //                 height: 88.16,
                //                 width: 89.22,
                //               ),
                //               Text('Expensess Syria'),
                //             ],
                //           ),
                //         )),
                //   ),
                // ),
              ItemAccount(cubit: cubit,index: 4, imagePath: 'assets/images/Group 71.png' ,onTapItem:(){
                 cubit.indexItem(4);
                 cubit.getagent() ;
              },title:'Add Clients' ,widget:GetAllAgentsScreen() ,),
                
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: GestureDetector(
                //     onTap: () {
                //       cubit.getagent();
                //       Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => GetAllAgentsScreen(),
                //       ));
                //     },
                //     child: Container(
                //         height: 170,
                //         width: 170,
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(14.0),
                //             border: Border.all(
                //               color: Colors.grey.withOpacity(0.4),
                //             )),
                //         child: Center(
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               Image.asset(
                //                 'assets/images/Group 71.png',
                //                 height: 88.16,
                //                 width: 89.22,
                //               ),
                //               Text('Customer'),
                //             ],
                //           ),
                //         )),
                //   ),
                // ),
              ItemAccount(cubit: cubit,index: 5, imagePath: 'assets/images/Group 74.png' ,onTapItem:(){
               cubit.indexItem(5);
                cubit.getinvoice();
              } ,title:'Invoice' ,widget:GetInvoiceScreen() ,),
                
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: GestureDetector(
                //     onTap: () {
                //       cubit.getinvoice();
                //       Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => GetInvoiceScreen(),
                //       ));
                //     },
                //     child: Container(
                //         height: 170,
                //         width: 170,
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(14.0),
                //             border: Border.all(
                //               color: Colors.grey.withOpacity(0.4),
                //             )),
                //         child: Center(
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               Image.asset(
                //                 'assets/images/Group 74.png',
                //                 height: 88.16,
                //                 width: 89.22,
                //               ),
                //               Text('Invoice'),
                //             ],
                //           ),
                //         )),
                //   ),
                // ),
           ItemAccount(cubit: cubit,index: 6, imagePath:   'assets/images/Group 75.png' ,onTapItem:(){
            cubit.indexItem(6);
            // cubit.getinvoice();
            cubit.getquatition();
           } ,title:'Qoutation' ,widget:GetQuationScreen() ,),
                
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: GestureDetector(
                //     onTap: () {
                //       cubit.getinvoice();
                //       Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => GetQuationScreen(),
                //       ));
                
                //       cubit.getquatition();
                //     },
                //     child: Container(
                //         height: 170,
                //         width: 170,
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(14.0),
                //             border: Border.all(
                //               color: Colors.grey.withOpacity(0.4),
                //             )),
                //         child: Center(
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               Image.asset(
                //                 'assets/images/Group 75.png',
                //                 height: 88.16,
                //                 width: 89.22,
                //               ),
                //               Text('Qoutation'),
                //             ],
                //           ),
                //         )),
                //   ),
                // ),
                 ItemAccount(cubit: cubit,index: 7, imagePath:   'assets/images/bank.png',onTapItem:(){
                cubit.indexItem(7);
                cubit.getBank();
                 } ,title:'Bank Account' ,widget:GetBank() ,),
                
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: GestureDetector(
                //     onTap: () {
                //       cubit.getBank();
                //       Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => GetBank(),
                //       ));
                //     },
                //     child: Container(
                //         height: 170,
                //         width: 170,
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(14.0),
                //             border: Border.all(
                //               color: Colors.grey.withOpacity(0.4),
                //             )),
                //         child: Center(
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               Image.asset(
                //                 'assets/images/bank.png',
                //                 height: 88.16,
                //                 width: 89.22,
                //               ),
                //               Text('Bank Account'),
                //             ],
                //           ),
                //         )),
                //   ),
                // ),
              ],
            ),
          ),
          Divider(
            thickness: 0.4,
            color: Colors.black,
          ),  
                     Container(
                         height: MediaQuery.of(context).size.height/1.6,
                         color: Colors.white,
                         child:cubit.index==1?
                      GetAllResourceScreenSyria():cubit.index==2?
                      getAllExpansessDubai():cubit.index==3?
                      getAllExpansessSyria()
                      :cubit.index==4?
                      GetAllAgentsScreen():cubit.index==5?
                      GetInvoiceScreen():cubit.index==6?
                      GetQuationScreen():cubit.index==7?
                      GetBank():
                      GetAllResourceScreenDubai() ,
                      )
                  ],
                );
          },
          
        )
      ),
    );
     
  }
}

class ItemAccount extends StatelessWidget {
  final Function onTapItem;
  final Widget widget;
  final String imagePath;
  final String title;
  final int index;
   final AccounterCubit cubit;
  const ItemAccount({
    super.key,
      required this.onTapItem, required this.widget, required this.imagePath, required this.title, required this.index, required  this.cubit,
  });

   

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccounterCubit,AccounterState>(
      builder: (context, state) {
        return  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: GestureDetector(
          onTap: () {
          
           onTapItem();
            
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => widget
            // ));
            
          },
          child: Container(
            
            
                 decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.0),
                  border: Border.all(
                    color: cubit.index==index?Colors.black:Colors.grey ,
                    width: 5
                    // Colors.grey.withOpacity(0.4),
                  )),
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15
                    ),
                    child: Image.asset(
                     imagePath,
                      height: MediaQuery.of(context).size.height/12,
                      width:MediaQuery.of(context).size.width/6 ,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.5,horizontal: 5),
                    child: Text(title),
                  ),
                ],
              )),
        ),
      );
      },
      
    );
  }
}
// 'assets/images/Group 69.png',
//'Income Dubai'
//GetAllResourceScreenDubai()
// cubit.getresource2();




  // Row(
  //                 children: [
  //                   IconButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pop();
  //                       },
  //                       icon: Icon(
  //                         Icons.arrow_back,
  //                         size: 40,
  //                       )),
  //                   Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
  //                   Text(
  //                     'Add Expanses Record',
  //                     style:
  //                         TextStyle(color: appTheme.primaryColor, fontSize: 25),
  //                   ),
  //                 ],
  //               ),
  //               Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 25),
  //                 width: double.infinity,
  //                 height: MediaQuery.of(context).size.height / 1.2,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                         'Time : ${DateFormat('hh:mm:ss a').format(DateTime.now())}'),
  //                     Text(
  //                         'Date : ${DateFormat('yyyy-MM-dd').format(DateTime.now())}'),
  //                     TextFormField(
  //                       controller: desccontroller,
  //                       obscureText: false,
  //                       style: TextStyle(fontSize: 14),
  //                       decoration: InputDecoration(
  //                         hintText: 'Description',
  //                         hintStyle: TextStyle(color: Color(0XFF0797A7)),
  //                         labelStyle: TextStyle(color: Color(0XFF0797A7)),
  //                         border: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(
  //                             5.0,
  //                           ),
  //                           borderSide: BorderSide(
  //                               width: 5.0,
  //                               style: BorderStyle.solid,
  //                               color: Color(0xff252b3b)),
  //                         ),
  //                       ),
  //                       maxLines: 2,
  //                     ),
  //                     Text('Amount :'),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Container(
  //                             width: MediaQuery.of(context).size.width / 3,
  //                             height: 40,
  //                             child: TextFormField(
  //                               cursorHeight: 20,
  //                               keyboardType: TextInputType.phone,
  //                               controller: desccontroller,
  //                               decoration: InputDecoration(
  //                                 hintStyle:
  //                                     TextStyle(color: Color(0XFF0797A7)),
  //                                 labelStyle:
  //                                     TextStyle(color: Color(0XFF0797A7)),
  //                                 border: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(
  //                                     5.0,
  //                                   ),
  //                                   borderSide: BorderSide(
  //                                       width: 5.0,
  //                                       style: BorderStyle.solid,
  //                                       color: Color(0xff252b3b)),
  //                                 ),
  //                               ),
  //                             )),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               ),