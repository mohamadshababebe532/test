import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../presentiton/views/Accounter/cubit/accounter_cubit.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      height: 400,
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.grey.shade50,
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: ShapeDecoration(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.grey.shade50,
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: ShapeDecoration(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.grey.shade50,
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: ShapeDecoration(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: Color.fromARGB(255, 134, 125, 125),
            highlightColor: Colors.grey.shade50,
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: ShapeDecoration(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerInvoice extends StatelessWidget {
  const ShimmerInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AccounterCubit>(context);
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Shimmer.fromColors(
                    child: Container(
                      width: 20,
                      height: 17,
                      decoration: ShapeDecoration(
                        color: Color.fromARGB(255, 134, 125, 125),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                    ),
                    baseColor: Colors.grey.shade100,
                    highlightColor: Colors.grey.shade50,
                  ),
                  Spacer(),
                  Shimmer.fromColors(
                    child: Container(
                      width: 120,
                      height: 35,
                      decoration: ShapeDecoration(
                        color: Color.fromARGB(255, 134, 125, 125),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                    ),
                    baseColor: Colors.grey.shade100,
                    highlightColor: Colors.grey.shade50,
                  ),
                  SizedBox(),
                  Spacer(),
                  Shimmer.fromColors(
                    child: Container(
                      width: 20,
                      height: 17,
                      decoration: ShapeDecoration(
                        color: Color.fromARGB(255, 134, 125, 125),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                    ),
                    baseColor: Colors.grey.shade100,
                    highlightColor: Colors.grey.shade50,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Shimmer.fromColors(
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: ShapeDecoration(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
              ),
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.grey.shade50,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.2,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  // var invoiceModel = cubit.getinvoiceModel[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Shimmer.fromColors(
                                  child: Container(
                                    width: 80,
                                    height: 17,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                    ),
                                  ),
                                  baseColor: Colors.grey.shade100,
                                  highlightColor: Colors.grey.shade50,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Shimmer.fromColors(
                                  child: Container(
                                    width: 80,
                                    height: 17,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                    ),
                                  ),
                                  baseColor: Colors.grey.shade100,
                                  highlightColor: Colors.grey.shade50,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              child: Container(
                                width: 80,
                                height: 17,
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                            Shimmer.fromColors(
                              child: Container(
                                height: 20,
                                width: 30,
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              child: Container(
                                width: 80,
                                height: 17,
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                            Shimmer.fromColors(
                              child: Container(
                                height: 20,
                                width: 30,
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              child: Container(
                                width: 80,
                                height: 17,
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                            Shimmer.fromColors(
                              child: Container(
                                height: 20,
                                width: 30,
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Shimmer.fromColors(
                                  child: Container(
                                    width: 80,
                                    height: 17,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                    ),
                                  ),
                                  baseColor: Colors.grey.shade100,
                                  highlightColor: Colors.grey.shade50,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Shimmer.fromColors(
                                  child: Container(
                                    width: 80,
                                    height: 17,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                    ),
                                  ),
                                  baseColor: Colors.grey.shade100,
                                  highlightColor: Colors.grey.shade50,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              child: Container(
                                width: 80,
                                height: 17,
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                            Shimmer.fromColors(
                              child: Container(
                                height: 20,
                                width: 30,
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Shimmer.fromColors(
                                  child: Container(
                                    width: 80,
                                    height: 17,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                    ),
                                  ),
                                  baseColor: Colors.grey.shade100,
                                  highlightColor: Colors.grey.shade50,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Shimmer.fromColors(
                                  child: Container(
                                    width: 80,
                                    height: 17,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                    ),
                                  ),
                                  baseColor: Colors.grey.shade100,
                                  highlightColor: Colors.grey.shade50,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              child: Container(
                                height: 20,
                                width: 30,
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                            Shimmer.fromColors(
                              child: Container(
                                height: 20,
                                width: 30,
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ExpansionTile(
                            backgroundColor: Colors.white,
                            iconColor: Colors.white,
                            collapsedIconColor: Colors.white,
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 0,
                                itemBuilder: (context, orderIndex) {
                                  var i = orderIndex;
                                  // var order = invoiceModel.orders![orderIndex];

                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Shimmer.fromColors(
                                            child: Container(
                                              width: 80,
                                              height: 17,
                                              decoration: ShapeDecoration(
                                                color: Colors.grey,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.0),
                                                ),
                                              ),
                                            ),
                                            baseColor: Colors.grey.shade100,
                                            highlightColor: Colors.grey.shade50,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Row(
                                          children: [
                                            Shimmer.fromColors(
                                              child: Container(
                                                width: 80,
                                                height: 17,
                                                decoration: ShapeDecoration(
                                                  color: Colors.grey,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                  ),
                                                ),
                                              ),
                                              baseColor: Colors.grey.shade100,
                                              highlightColor:
                                                  Colors.grey.shade50,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: Text(''),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Row(
                                          children: [
                                            Shimmer.fromColors(
                                              child: Container(
                                                width: 80,
                                                height: 17,
                                                decoration: ShapeDecoration(
                                                  color: Colors.grey,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                  ),
                                                ),
                                              ),
                                              baseColor: Colors.grey.shade100,
                                              highlightColor:
                                                  Colors.grey.shade50,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Row(
                                          children: [
                                            Shimmer.fromColors(
                                              child: Container(
                                                width: 80,
                                                height: 17,
                                                decoration: ShapeDecoration(
                                                  color: Colors.grey,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                  ),
                                                ),
                                              ),
                                              baseColor: Colors.grey.shade100,
                                              highlightColor:
                                                  Colors.grey.shade50,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 17,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                            title: Shimmer.fromColors(
                              child: Container(
                                width: 80,
                                height: 30,
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                            // collapsedIconColor: Colors.white,
                            // collapsedBackgroundColor: appTheme.primaryColor,
                            // iconColor: appTheme.primaryColor,
                            // textColor: appTheme.primaryColor,
                            // collapsedTextColor: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              child: Container(
                                width: 80,
                                height: 17,
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                            Shimmer.fromColors(
                              child: Container(
                                height: 20,
                                width: 30,
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              child: Container(
                                width: 80,
                                height: 17,
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                            Shimmer.fromColors(
                              child: Container(
                                height: 20,
                                width: 30,
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              child: Container(
                                width: 80,
                                height: 17,
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                            Shimmer.fromColors(
                              child: Container(
                                height: 20,
                                width: 30,
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              child: Container(
                                width: 80,
                                height: 17,
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                            Shimmer.fromColors(
                              child: Container(
                                height: 20,
                                width: 30,
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              child: Container(
                                width: 80,
                                height: 17,
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                            Shimmer.fromColors(
                              child: Container(
                                height: 20,
                                width: 30,
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                          ],
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (context, paiedindex) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Shimmer.fromColors(
                                        child: Container(
                                          height: 20,
                                          width: 30,
                                        ),
                                        baseColor: Colors.grey.shade100,
                                        highlightColor: Colors.grey.shade50,
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Shimmer.fromColors(
                              child: Container(
                                width: 80,
                                height: 17,
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                            // PopupMenuItem(child: Icon(Icons.))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Shimmer.fromColors(
                                  child: Container(
                                    height: 20,
                                    width: 30,
                                  ),
                                  baseColor: Colors.grey.shade100,
                                  highlightColor: Colors.grey.shade50,
                                ),
                                Shimmer.fromColors(
                                  child: Container(
                                    width: 80,
                                    height: 17,
                                    decoration: ShapeDecoration(
                                      color: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ),
                                    ),
                                  ),
                                  baseColor: Colors.grey.shade100,
                                  highlightColor: Colors.grey.shade50,
                                ),
                              ],
                            ),
                            Shimmer.fromColors(
                              child: Container(
                                width: 80,
                                height: 17,
                                decoration: ShapeDecoration(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                ),
                              ),
                              baseColor: Colors.grey.shade100,
                              highlightColor: Colors.grey.shade50,
                            ),
                          ],
                        ),
                        Shimmer.fromColors(
                          child: Container(
                            width: 80,
                            height: 17,
                            decoration: ShapeDecoration(
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                            ),
                          ),
                          baseColor: Colors.grey.shade100,
                          highlightColor: Colors.grey.shade50,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
