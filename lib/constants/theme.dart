import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      disabledBackgroundColor: Colors.grey,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  primaryColor: Colors.red,
  fontFamily: 'Lato',
);

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Color.fromARGB(255, 195, 192, 192),
  ),
);
