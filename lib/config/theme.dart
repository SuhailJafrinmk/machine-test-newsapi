import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    primary:  Color(0xFFE8ECF4),   
    primaryContainer: Color(0xFFE8ECF4),
    secondary: Color(0xFFFBDADA), 
    secondaryContainer: Color(0xFFFBDADA),
    background: Colors.white, 
    surface: Colors.white,       
    onPrimary: Color(0xFF1A1A1A),
    onSecondary: Colors.white,    
    onBackground: Color(0xFF1A1A1A),
    onSurface: Color(0xFF1A1A1A),
    error: Colors.red,           
    onError: Colors.white,
    brightness: Brightness.light, 
  ),
  
  scaffoldBackgroundColor: Colors.white,

  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1A1A1A),
    ),
    headline6: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1A1A1A),
    ),
    bodyText1: TextStyle(
      fontSize: 16.0,
      color: Color(0xFF1A1A1A),
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      color: Color(0xFF6B6B6B),
    ),
    caption: TextStyle(
      fontSize: 12.0,
      color: Color(0xFF6B6B6B),
    ),
  ),
  
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  ),
  
  buttonTheme: ButtonThemeData(
    buttonColor: const Color(0xFFFBDADA),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    textTheme: ButtonTextTheme.primary,
  ),
  
  iconTheme: const IconThemeData(
    color: Color(0xFF1A1A1A),
  ),
  
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(
      color: Color(0xFF1A1A1A),
    ),
    titleTextStyle: TextStyle(
      color: Color(0xFF1A1A1A),
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0,
  ),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xFFFBDADA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    ),
  ),
  
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
      borderRadius: BorderRadius.circular(8.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFF6B6B6B)),
      borderRadius: BorderRadius.circular(8.0),
    ),
    labelStyle: const TextStyle(
      color: Color(0xFF6B6B6B),
    ),
    hintStyle: const TextStyle(
      color: Color(0xFF6B6B6B),
    ),
  ),
);
