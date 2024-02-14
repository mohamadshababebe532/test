import 'package:flutter/material.dart';

final appTheme = ThemeData(
  // useMaterial3: true,
  colorScheme: ThemeData()
      .colorScheme
      .copyWith(secondary: Colors.white, primary: const Color(0xFFA6A6A6)),
  primaryColor: const Color(0xFFA6A6A6),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xFFA6A6A6),
  ),
  hintColor: const Color(0xFFD5D5D5),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  fontFamily: 'Janna',
);
