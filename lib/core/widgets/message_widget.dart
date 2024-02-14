// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
class MessageWidget extends StatefulWidget {
  MessageWidget({this.message});
  final String? message;

  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,

      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        width: double.infinity,
        height: 150.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 1
            Text(
              widget.message!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14.0,
              ),
            ),

            // 2
            TextButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor
              ),
                onPressed: (){
                setState(() {
                  Navigator.of(context).pop();
                });
                },
                child: const Text('Continue',style: TextStyle(color: Colors.white),)),
          ],
        ),
      ),
    );
  }
}

