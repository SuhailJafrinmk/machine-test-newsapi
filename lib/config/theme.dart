
import 'package:flutter/material.dart';
import 'package:kalpas_machine_test/core/utils/constants.dart';


final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    primary: AppColors.primary,   
    primaryContainer: AppColors.primaryContainer,
    secondary: AppColors.secondary, 
    secondaryContainer: AppColors.secondaryContainer,
    background: AppColors.background, 
    surface: AppColors.surface,       
    onPrimary: AppColors.onPrimary,
    onSecondary: AppColors.onSecondary,    
    onBackground: AppColors.onBackground,
    onSurface: AppColors.onSurface,
    error: AppColors.error,           
    onError: AppColors.onError,
    brightness: Brightness.light, 
  ),
  
  scaffoldBackgroundColor: AppColors.background,

  textTheme: const TextTheme(
    headline1: AppTextStyles.headline1,
    headline6: AppTextStyles.headline6,
    bodyText1: AppTextStyles.bodyText1,
    bodyText2: AppTextStyles.bodyText2,
    caption: AppTextStyles.caption,
  ),
  
  cardTheme: CardTheme(
    color: AppColors.surface,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  ),
  
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.secondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    textTheme: ButtonTextTheme.primary,
  ),
  
  iconTheme: const IconThemeData(
    color: AppColors.onPrimary,
  ),
  
  appBarTheme:  AppBarTheme(
    color: AppColors.surface,
    iconTheme: const IconThemeData(
      color: AppColors.onPrimary,
    ),
    titleTextStyle: AppTextStyles.headline6.copyWith(fontSize: 20.0),
    elevation: 0,
  ),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColors.secondary,
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
      borderSide: const BorderSide(color: AppColors.primary),
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
