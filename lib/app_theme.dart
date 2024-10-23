import 'package:flutter/material.dart';

class Apptheme{
  static const Color primary = Color(0xFF5D9CEC);
  static const Color backgroundLight = Color(0xFFDFECDB);
  static const Color backgroundDark = Color(0xFF060E1E);
  static const Color black = Color(0xFF363636);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFC8C9CB);
  static const Color green = Color(0xFF61E757);
  static const Color red = Color(0xFFEC4B4B);
  static ThemeData ligthTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: backgroundLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: white,
      selectedItemColor: primary,
      unselectedItemColor: grey,
      showSelectedLabels: false,
      showUnselectedLabels: false
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: CircleBorder(side: BorderSide(width: 4 , color: white)),
      backgroundColor: primary,
      foregroundColor: white
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: black)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: primary)
      )
    

  );
  static ThemeData darktheme = ThemeData(

  );
}