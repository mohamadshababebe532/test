import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  final void Function() onPress;
  final Color color;
  final double width;
  final double height;
  final String title;
  final bool hasIcon;
  final IconData? iconData;
  const CustomButtons(
      {Key? key,
      required this.onPress,
      required this.color,
      required this.width,
      required this.height,
      required this.title,
      this.hasIcon = false,
      this.iconData })
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
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Center(),
            ],
          )),
        ));
  }
}
