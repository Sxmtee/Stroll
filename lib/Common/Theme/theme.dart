import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskone/Common/Utils/color.dart';

class ThemeState {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.white,
    iconTheme: IconThemeData(color: AppColors.black, opacity: 0.8),
    cardColor: AppColors.card,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      prefixIconColor: AppColors.black,
      suffixIconColor: AppColors.black,
      border: defaultWhiteBorder,
      enabledBorder: defaultWhiteBorder,
      focusedBorder: defaultWhiteBorder,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.light().textTheme,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.black,
    iconTheme: const IconThemeData(color: AppColors.white, opacity: 0.8),
    cardColor: const Color.fromARGB(255, 61, 60, 60),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      prefixIconColor: AppColors.white,
      suffixIconColor: AppColors.white,
      focusedBorder: defaultBlackBorder,
      enabledBorder: defaultBlackBorder,
      border: defaultBlackBorder,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark().textTheme,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.black,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
  );
}

const defaultWhiteBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: AppColors.primaryColor,
    width: 0.5,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(5),
  ),
);

const defaultBlackBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: AppColors.primaryColor,
    width: 0.5,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(20),
  ),
);
