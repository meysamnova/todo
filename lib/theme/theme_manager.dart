import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant.dart';
class ThemeConfif{
//! lIGHT
static ThemeData get lightTheme{
  return ThemeData(dividerColor: const Color.fromARGB(255, 193, 193, 193),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kLightBlueColor,
  ),
  primaryColor: kWhiteColor,
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          foregroundColor: kWhiteColor, backgroundColor: kLightBlueColor)),
  fontFamily: GoogleFonts.vazirmatn().fontFamily,
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: kBlackColor, fontSize: 12),
    bodyMedium: TextStyle(color: kBlackColor, fontSize: 17),
  ),
  colorScheme: ColorScheme.fromSeed(

    seedColor: kLightBlueColor,
    //background
    primary: kWhiteColor,
    secondary: kSemiBlackColor,
    //divider
    onSecondary: kGreyColor,
  ),);
  
}

//! DARK
static ThemeData get darkTheme{
  return ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: kLightBlueColor,
    //background
    primary: kSemiBlackColor,
    secondary: kWhiteColor,
    //.5opacity black
    onSecondary: kGreyColor,
  ),
  checkboxTheme: const CheckboxThemeData(),
  fontFamily: GoogleFonts.vazirmatn().fontFamily,
  textTheme: const TextTheme(
    bodySmall: TextStyle(color: kWhiteColor, fontSize: 12),
    bodyMedium: TextStyle(color: kWhiteColor, fontSize: 17),
  ),
  primaryColor: kWhiteColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          foregroundColor: kWhiteColor, backgroundColor: kLightBlueColor)),
  useMaterial3: true,
);}
}