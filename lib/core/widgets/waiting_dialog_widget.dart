// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class WaitingDialogWidget extends StatelessWidget {
  final String? waitMessage;
  // ignore: prefer_const_constructors_in_immutables
  WaitingDialogWidget({this.waitMessage});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        width: double.infinity,
        child: Row(
          children: [
            // 1
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              color:  Color(0xFFA6A6A6),
              strokeWidth: 3.0,
            ),

            const SizedBox(
              width: 15.0,
            ),

            // 2
            Text(
              waitMessage!,
              style: TextStyle(
                color: Color(0xFFA6A6A6),
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final void Function() onPress;
  final Color color;
  final double width;
  final double height;
  final String title;
  const CustomButton(
      {Key? key,
      required this.onPress,
      required this.color,
      required this.width,
      required this.height,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPress,
        child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          height: height,
          width: width,
          child: Center(
              child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ));
  }
}
