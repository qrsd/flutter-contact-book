import 'package:flutter/material.dart';

/// Overall theme data for app
ThemeData themeData = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    elevation: 0.0,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xff2A395A),
    textTheme: ButtonTextTheme.primary,
  ),
  unselectedWidgetColor: Color(0xffA5A9B7),
  accentColor: Color(0xff2A395A),
  iconTheme: IconThemeData(
    color: Color(0xff2A395A),
  ),
  cursorColor: Color(0xff2A395A),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xffA5A9B7), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xff2A395A), width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  ),
  primaryIconTheme: IconThemeData(
    color: Color(0xff2A395A),
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Color(0xff2A395A), fontWeight: FontWeight.bold),
    bodyText2: TextStyle(color: Color(0xffA5A9B7)),
  ),
);
