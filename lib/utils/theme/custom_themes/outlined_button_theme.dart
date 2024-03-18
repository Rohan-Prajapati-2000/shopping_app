import 'package:flutter/material.dart';

class SOutlinedButtonTheme{
  SOutlinedButtonTheme._();

  // Light Theme
  static OutlinedButtonThemeData lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.black,
    side: BorderSide(color: Colors.blue),
    textStyle: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
    )
  );

  // Dark Theme
  static OutlinedButtonThemeData darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      side: BorderSide(color: Colors.blueAccent),
      textStyle: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
    )
  );

}