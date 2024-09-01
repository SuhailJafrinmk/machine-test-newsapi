import 'package:flutter/material.dart';

class ApiConstants {
  static const String getAllNews='/v2/everything/';
  static const String getTopHeadlines='/v2/top-headlines/';
}

class AppAssetImages{
  static const String placeholderImage='https://res.cloudinary.com/dccos4vab/image/upload/v1724157117/image-not-found-scaled-1150x647_dzdhuj.png';
}

class AppColors{
  static const Color primary = Color(0xFFE8ECF4);
  static const Color primaryContainer = Color(0xFFE8ECF4);
  static const Color secondary = Color(0xFFFBDADA);
  static const Color secondaryContainer = Color(0xFFFBDADA);
  static const Color background = Colors.white;
  static const Color surface = Colors.white;
  static const Color onPrimary = Color(0xFF1A1A1A);
  static const Color onSecondary = Colors.white;
  static const Color onBackground = Color(0xFF1A1A1A);
  static const Color onSurface = Color(0xFF1A1A1A);
  static const Color error = Colors.red;
  static const Color onError = Colors.white;
}

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Color(0xFF1A1A1A),
  );

  static const TextStyle headline6 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: Color(0xFF1A1A1A),
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16.0,
    color: Color(0xFF1A1A1A),
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14.0,
    color: Color(0xFF6B6B6B),
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12.0,
    color: Color(0xFF6B6B6B),
  );
}
