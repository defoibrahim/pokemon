
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemony/core/theme/app_colors.dart';

// ignore: public_member_api_docs
final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: kScaffoldBackroundColor,
  secondaryHeaderColor: kMainTextColor,
  primaryColor: kMainColor,
  primaryColorDark: kMainColorDark,
  primaryColorLight: kMainColorLight,
  bottomAppBarColor: kWhiteColor,
  // dividerColor: const Color(0xFFD4D4D4),
  disabledColor: kDisabledColor,
  fontFamily: 'Roboto',
  errorColor: const Color(0xFFb11116),
  cardColor: kCardBackgroundColor,
  hintColor: kLightTextColor,
  indicatorColor: kMainColor,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(primary: kMainColor),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 13,
      color: Color(0xffa0a0a0),
    ),
    labelStyle: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 13,
      color: Color(0xffa0a0a0),
    ),
    alignLabelWithHint: true,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: kMainColor,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffa0a0a0),
      ),
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: kMainColor),
  dividerTheme: const DividerThemeData(
    color: Color(0xFFE9EBF0),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kScaffoldBackroundColor,
    elevation: 4.0,
    titleTextStyle: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      color: Color(0xff2d264b),
      fontWeight: FontWeight.w700,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(
      color: Color(0xff2d264b),
    ),
    toolbarTextStyle: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      color: Color(0xff2d264b),
      fontWeight: FontWeight.w700,
    ),
  ),

  //text theme which contains all text styles
  textTheme: const TextTheme(
    //text style of 'Delivering almost everything' at phone_number page
    bodyText1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.3,
      fontFamily: 'Roboto',
    ),

    //text style of 'Everything.' at phone_number page
    bodyText2: TextStyle(
      fontSize: 18.3,
      letterSpacing: 1.0,
      color: kDisabledColor,
      fontFamily: 'Roboto',
    ),

    //text style of button at phone_number page
    button: TextStyle(
      fontSize: 13.3,
      color: kWhiteColor,
      fontFamily: 'Roboto',
    ),

    //text style of 'Got Delivered' at home page
    headline4: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16.7,
      fontFamily: 'Roboto',
    ),

    //text style of 'everything you need' at home page
    headline5: TextStyle(
      color: kDisabledColor,
      fontSize: 20.0,
      letterSpacing: 0.5,
      fontFamily: 'Roboto',
    ),

    //text entry text style
    caption: TextStyle(
      color: kMainTextColor,
      fontSize: 13.3,
      fontFamily: 'Roboto',
    ),

    overline: TextStyle(color: kLightTextColor, letterSpacing: 0.2),

    //text style of titles of card at home page
    headline2: TextStyle(
      color: kMainTextColor,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
      fontFamily: 'Roboto',
    ),
    subtitle2: TextStyle(
      color: kLightTextColor,
      fontSize: 15.0,
      fontFamily: 'Roboto',
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kAccentColor),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: kMainColor),
);
